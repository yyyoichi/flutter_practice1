import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class Gaming {
  final bool isA;
  final bool isLoading;
  final bool ended;
  final List<History> histories;

  const Gaming(
      {this.isA = true,
      this.isLoading = false,
      this.ended = false,
      this.histories = const <History>[]});

  Gaming copyWith({bool? isA, bool? isLoading, bool? ended, List<History>? histories}) {
    return Gaming(
        isA: isA ?? this.isA,
        isLoading: isLoading ?? this.isLoading,
        ended: ended ?? this.ended,
        histories: histories ?? this.histories);
  }

  History? getLatestMoveHistory({bool opponent = false}) {
    bool isTarget(History h) {
      /// 相手のHistoryを取得する
      if (opponent) return h.isA != isA;

      /// 自分のHistoryを取得する
      return h.isA == isA;
    }

    /// 移動前の履歴
    for (History hist in histories) {
      if (isTarget(hist) && hist.type == "move") {
        return hist;
      }
    }
    return null;
  }

  bool isNowPosition(int row, int column) {
    History? history = getLatestMoveHistory();
    if (history == null) {
      return false;
    }
    Position targetPosition = Position(row, column);
    Position position = history.position;
    return position.equals(targetPosition);
  }
}

@immutable
class History {
  /// 進んだ方向を表す（0~8, !=4）
  final Direction direction;

  /// "attack" or "move"
  final String type;

  /// "safe" "near" "over"
  final String result;

  /// 行動距離
  final int step;

  /// board index( "0,0" )
  final Position position;
  final bool isA;
  const History(this.direction, this.type, this.position, this.isA, this.step,
      this.result);
  @override
  String toString() {
    return "player: ${isA ? "A" : "B"}, type: $type, position: (${position.row},${position.column}), direction: (${direction.x},${direction.y})";
  }
}

class Direction {
  late final int x;
  late final int y;
  Direction(x, y) {
    bool isRange(n) {
      return -1 <= n && n <= 1;
    }

    if (isRange(x) && isRange(y)) {
      this.x = x;
      this.y = y;
    } else {
      throw Exception("方向は、-1, 0, 1 のいずれかを指定します");
    }
  }
  static Stream<Direction> getAll() async* {
    for (int x = -1; x <= 1; x++) {
      for (int y = -1; y <= 1; y++) {
        if (x == 0 && y == 0) {
          continue;
        }
        yield Direction(x, y);
      }
    }
  }
}

class Position {
  final int row;
  final int column;
  Position(this.row, this.column);
  nextTo({required Direction direction, int howMany = 1}) {
    int r = row + (direction.x * howMany);
    int c = column + (direction.y * howMany);
    return Position(r, c);
  }

  Direction wayFrom({required Position pos, int howMany = 1}) {
    final x = (pos.row - row) ~/ howMany;
    final y = (pos.column - column) ~/ howMany;
    return Direction(x, y);
  }

  bool equals(Position pos) {
    return pos.row == row && pos.column == column;
  }
}

class GameNotifier extends StateNotifier<Gaming> {
  GameNotifier() : super(const Gaming());
  void closeLoading() {
    state = state.copyWith(isLoading: false);
  }

  void changePlayer() {
    state = state.copyWith(isLoading: !state.isLoading, isA: !state.isA);
  }

  Future<Function?> put(int row, int column, String type, int step) async {
    Direction direction;
    Position position = Position(row, column);
    History? prevHistory = state.getLatestMoveHistory();
    if (prevHistory == null) {
      direction = Direction(0, 0);
    } else {
      /// 過去に移動した履歴がある
      Position prevPosition = prevHistory.position;
      if (await _nextPut(position, prevPosition, step) == false) {
        // 置けない
        return null;
      }
      direction = prevPosition.wayFrom(pos: position);
      debugPrint("privHistory: ${prevHistory.toString()}");
    }
    bool isA = state.isA;
    return (String result) {
      History history = History(direction, type, position, isA, step, "safe");
      debugPrint("newHistory: ${history.toString()}");
      state = state.copyWith(histories: [history, ...state.histories], ended: result == "over" ? true: false);
    };
  }

  /// [step]だけ離れている関係性であるかを返す
  Future<bool> _nextPut(
      Position nextPosition, Position prevPosition, int step) async {
    /// 移動可能な方向を順に取得
    await for (Direction d in Direction.getAll()) {
      /// 行動前の場所からある方向にstepだけ進んだ位置を取得
      Position p = prevPosition.nextTo(direction: d, howMany: step);

      /// 移動したい場所と一致すれば
      if (nextPosition.equals(p)) {
        return true;
      }
    }
    return false;
  }

  Future<String> atackResulut(int row, int column) async {
    History? optHistory = state.getLatestMoveHistory(opponent: true);
    if (optHistory == null) return "";
    Position position = Position(row, column);
    if (position.equals(optHistory.position)) return "over";
    if (await _nextPut(position, optHistory.position, 1)) return "near";
    return "safe";
  }

  String? getWinner() {
    if(state.ended == false) return null;
    History history = state.histories[0];
    bool isA = history.isA;
    return isA ? "A" : "B";
  }
}

final gameStateProvider = StateNotifierProvider<GameNotifier, Gaming>((ref) {
  return GameNotifier();
});
