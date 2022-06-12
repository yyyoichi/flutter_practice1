import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/setting_field.dart';
import 'package:flutter_application_1/components/line_num_slider.dart';
import 'package:flutter_application_1/components/island_num_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:math' as math;

class GameSettingApp extends StatelessWidget {
  const GameSettingApp({Key? key}) : super(key: key);
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
                child: const SettingField()
              )),
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 25.0),
                child: const LineNumSlider(),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 25.0),
                child: const IslandNumSlider(),
              )
            ]))));
  }
}

@immutable
class RiverpodTableState {
  final int numOfLines;
  final int numOfIsland;
  final Set<int> positionsOfIsland;
  const RiverpodTableState(
      {this.numOfLines = 5,
      this.numOfIsland = 1,
      this.positionsOfIsland = const <int>{}});
  RiverpodTableState copyWith(
      {int? numOfLines, int? numOfIsland, Set<int>? positionsOfIsland}) {
    return RiverpodTableState(
        numOfLines: numOfLines ?? this.numOfLines,
        numOfIsland: numOfIsland ?? this.numOfIsland,
        positionsOfIsland: positionsOfIsland ?? this.positionsOfIsland);
  }
}

class RiverpodTableStateNotifier extends StateNotifier<RiverpodTableState> {
  RiverpodTableStateNotifier() : super(const RiverpodTableState());

  void onChangeLines(double n) {
    int num = n.toInt();
    state = state.copyWith(numOfLines: num);
  }

  void onChangeIsland(double n) {
    int num = n.toInt();
    Set<int> posIsland = <int>{};
    while (posIsland.length < num) {
      int r = math.Random().nextInt(state.numOfLines * state.numOfLines);
      posIsland.add(r);
    }
    state = state.copyWith(numOfIsland: num, positionsOfIsland: posIsland);
  }
}

final riverpodTableProvider = StateNotifierProvider<RiverpodTableStateNotifier, RiverpodTableState>((ref) {
  return RiverpodTableStateNotifier();
});