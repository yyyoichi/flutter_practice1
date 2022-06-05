import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      {required this.numOfLines,
      required this.numOfIsland,
      required this.positionsOfIsland});
  RiverpodTableState copyWith(
      {int? numOfLines, int? numOfIsland, List<int>? positionsOfIsland}) {
    return RiverpodTableState(
      numOfLines: numOfLines ?? this.numOfLines,
      numOfIsland: numOfIsland ?? this.numOfIsland,
      positionsOfIsland: positionsOfIsland ?? this.positionsOfIsland);
  }
}
