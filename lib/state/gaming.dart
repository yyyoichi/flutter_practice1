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

  Gaming copyWith({bool? isA, bool? isLoading, List<History>? histories}) {
    return Gaming(
        isA: isA ?? this.isA,
        isLoading: isLoading ?? this.isLoading,
        histories: histories ?? this.histories);
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
  _nextTo({required Position direction, int howMany = 1}) {
    int r = row + (direction.row * howMany);
    int c = column + (direction.column * howMany);
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

  bool canPut() {
    return false;
  }
}

final gameStateProvider = StateNotifierProvider<GameNotifier, Gaming>((ref) {
  return GameNotifier();
});
