import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../game_app.dart';
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