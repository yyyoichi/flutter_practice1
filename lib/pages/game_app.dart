import 'package:flutter/material.dart';
import 'package:flutter_application_1/state/game_parameter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameApp extends StatelessWidget {
  const GameApp({
    Key? key,
    this.args = const GameParameter(),
  }) : super(key: key);
  final GameParameter args;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final num = args.numOfLines;
      final posIslands = args.positionsOfIsland;
      const sea = Color.fromARGB(255, 131, 134, 172);
      const island = Color.fromARGB(255, 28, 54, 32);
      return Scaffold(
          appBar: AppBar(title: const Text("Reverpod.")),
          body: Center(
              child: Column(
            children: [
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      child: GridView.count(
                        crossAxisCount: num,
                        crossAxisSpacing: 3.0,
                        mainAxisSpacing: 3.0,
                        children: List.generate(num * num, (index) {
                          return Container(
                            color: posIslands.contains(index) ? island : sea,
                            width: 50.0,
                            height: 50.0,
                          );
                        }),
                      )))
            ],
          )));
    });
  }
}
