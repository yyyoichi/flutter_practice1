import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:math' as math;

class RiverpodTableApp extends StatelessWidget {
  const RiverpodTableApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: Scaffold(
            appBar: AppBar(title: const Text("Reverpod.")),
            body: Center(
                child: Column(children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(25.0),
                // child: RiverpodGrid(),
              )),
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 25.0),
                // child: RiverpodSlider(),
              )
            ]))));
  }
}

@immutable
class RiverpodTableState {
  final int numOfLines;
  final int numOfIsland;
  final List<int> positionsOfIsland;
  const RiverpodTableState(
      {this.numOfLines = 5,
      this.numOfIsland = 0,
      this.positionsOfIsland = const []});
  RiverpodTableState copyWith(
      {int? numOfLines, int? numOfIsland, List<int>? positionsOfIsland}) {
    return RiverpodTableState(
        numOfLines: numOfLines ?? this.numOfLines,
        numOfIsland: numOfIsland ?? this.numOfIsland,
        positionsOfIsland: positionsOfIsland ?? this.positionsOfIsland);
  }
}

class RiverpodTableStateNotifier extends StateNotifier<RiverpodTableState> {
  RiverpodTableStateNotifier() : super(const RiverpodTableState());
  void onChangeLines(int num) {
    state = state.copyWith(numOfLines: num);
  }

  void onChangeIsland(int num) {
    List<int> posIsland = [];
    for (var i = 0; i < num; i++) {
      int r = math.Random().nextInt(state.numOfLines) + 1;
      posIsland.add(r);
    }
    state = state.copyWith(numOfIsland: num, positionsOfIsland: posIsland);
  }
}
