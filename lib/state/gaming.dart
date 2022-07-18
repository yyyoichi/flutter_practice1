import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class Gaming {
  final bool isA;
  final bool isLoading;
  final List<History> histories;

  const Gaming(
      {this.isA = true,
      this.isLoading = false,
      this.histories = const <History>[]});

  Gaming copyWith(
      {bool? isA,
      bool? isLoading,
      List<History>? histories}) {
    return Gaming(
        isA: isA ?? this.isA,
        isLoading: isLoading ?? this.isLoading,
        histories: histories ?? this.histories);
  }
  History? getLatestMoveHistory() {
    /// 移動前の履歴
    for (History hist in histories) {
      if (hist.isA == isA && hist.type == "move") {
        return hist;
      }
    }
    return null;
  }
  bool isNowPosition(int row, int column) {
    History? history = getLatestMoveHistory();
    if(history == null) {
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

  /// 行動距離
  final int step;

  /// board index( "0,0" )
  final Position position;
  final bool isA;
  const History(this.direction, this.type, this.position, this.isA, this.step);
  @override
  String toString() {
    return "player: ${isA ? "A": "B"}, type: $type, position: (${position.row},${position.column}), direction: (${direction.x},${direction.y})";
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

  Future<bool> put(int row, int column, int step) async {
    Direction direction;
    Position position = Position(row, column);
    History? prevHistory = state.getLatestMoveHistory();
    if (prevHistory == null) {
      direction = Direction(0, 0);
    } else {
      /// 過去に移動した履歴がある
      Position prevPosition = prevHistory.position;
      if(await _canPut(position, prevPosition, step) == false) {
        // 置けない
        return false;
      }
      direction = prevPosition.wayFrom(pos: position);
      debugPrint("privHistory: ${prevHistory.toString()}");
    }
    String type = "move";
    bool isA = state.isA;
    History history = History(direction, type, position, isA, step);
    debugPrint("newHistory: ${history.toString()}");
    state = state.copyWith(histories: [history, ...state.histories]);
    return true;
  }
   /// 移動可能な場所かを返す
  Future<bool> _canPut(Position nextPosition, Position prevPosition, int step) async {
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
}

final gameStateProvider = StateNotifierProvider<GameNotifier, Gaming>((ref) {
  return GameNotifier();
});
