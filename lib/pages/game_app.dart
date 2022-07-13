import 'package:flutter/material.dart';
import 'package:flutter_application_1/state/game_parameter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameApp extends StatelessWidget {
  const GameApp({Key? key, this.args = const GameParameter(), }) : super(key: key);
  final GameParameter args;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Scaffold(
          appBar: AppBar(title: const Text("Reverpod.")),
          body: Center(
              child: Column(
            children: [
              Text(args.numOfLines.toString()),
              Text(args.positionsOfIsland.join(", "))
            ],
          )));
    });
  }
}
