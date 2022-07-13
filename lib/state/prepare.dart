import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodTableState {
  final int numOfLines;
  final Set<int> positionsOfIsland;
  final int maxOfIsland;

  const RiverpodTableState(
      {this.numOfLines = 5,
      this.positionsOfIsland = const <int>{3, 18},
      this.maxOfIsland = 2});
  RiverpodTableState copyWith(
      {int? numOfLines, Set<int>? positionsOfIsland, int? maxOfIsland}) {
    return RiverpodTableState(
      numOfLines: numOfLines ?? this.numOfLines,
      positionsOfIsland: positionsOfIsland ?? this.positionsOfIsland,
      maxOfIsland: maxOfIsland ?? this.maxOfIsland,
    );
  }
}

class RiverpodTableStateNotifier extends StateNotifier<RiverpodTableState> {
  RiverpodTableStateNotifier() : super(const RiverpodTableState());

  void onChangeLines(double n) {
    int num = n.toInt();
    int maxOfisland = getMaxIsland(num);
    if (maxOfisland < state.positionsOfIsland.length) {
      state = state.copyWith(
          numOfLines: num,
          positionsOfIsland: _getPosIsland(maxOfisland, num),
          maxOfIsland: maxOfisland);
    } else {
      state = state.copyWith(numOfLines: num, maxOfIsland: maxOfisland);
    }
  }

  void onChangeIsland(double n) {
    int num = n.toInt();
    Set<int> posIsland = _getPosIsland(num, state.numOfLines);
    state = state.copyWith(positionsOfIsland: posIsland);
  }

  Set<int> _getPosIsland(int num, int numOfLines) {
    Set<int> posIsland = <int>{};
    while (posIsland.length < num) {
      int r = math.Random().nextInt(numOfLines * numOfLines);
      posIsland.add(r);
    }
    return posIsland;
  }

  int getMaxIsland(nowNumOfLines) {
    final int numOfCeil = nowNumOfLines * nowNumOfLines;
    final int limit = (numOfCeil * 0.1).floor();
    return limit;
  }
}

final riverpodTableProvider =
    StateNotifierProvider<RiverpodTableStateNotifier, RiverpodTableState>(
        (ref) {
  return RiverpodTableStateNotifier();
});