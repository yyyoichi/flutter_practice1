import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class Gaming {
  final bool isA;
  final bool isLoading;
  final List<History> aHistories;
  final List<History> bHistories;

  const Gaming(
      {this.isA = true,
      this.isLoading = false,
      this.aHistories = const <History>[],
      this.bHistories = const <History>[]});

  Gaming copyWith({bool? isA, bool? isLoading, List<History>? aHistories, List<History>? bHistories}) {
    return Gaming(
        isA: isA ?? this.isA,
        isLoading: isLoading ?? this.isLoading,
        aHistories: aHistories ?? this.aHistories,
        bHistories: bHistories ?? this.bHistories);
  }
}

class History {
  /// 進んだ方向を表す（0~8, !=4）
  final Position direction;
  /// "attack" or "move"
  final String type;
  /// 行動距離
  final int step;
  /// board index( "0,0" )
  final Position position;
  final bool isA;
  History(this.direction, this.type, this.position, this.isA, this.step);
}

class Direction {
  final int x;
  final int y;
  Direction(this.x, this.y);
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


  bool equals(Position pos) {
    return pos.row == row && pos.column == column;
  }
}

class GameNotifier extends StateNotifier<Gaming> {
  GameNotifier() : super(const Gaming());
  void onChangePlayer() {
    state.copyWith(isA: !state.isA, isLoading: !state.isLoading);
  }

  Future<bool> canPut(int row, int column, int step) async {
    int length = state.isA ? state.aHistories.length : state.bHistories.length;
    if(length == 0 ) return true;// game 初めならどこでもOK
    /// 移動したい場所
    Position nextPosition = Position(row, column);
    /// 移動前の履歴
    History latestHistory = state.isA ? state.aHistories[length - 1] : state.bHistories[length - 1];
    Position latestPosition = latestHistory.position;
    /// 移動可能な方向を順に取得
    await for(Direction d in Direction.getAll()) {
      /// 行動前の場所からある方向にstepだけ進んだ位置を取得
      Position p = latestPosition.nextTo(direction: d, howMany: step);
      /// 移動したい場所と一致すれば
      if(nextPosition.equals(p)) {
        return true;
      }
    }
    return false;
  }
}

final gameStateProvider = StateNotifierProvider<GameNotifier, Gaming>((ref) {
  return GameNotifier();
});
