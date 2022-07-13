import 'package:flutter/material.dart';
import 'package:flutter_application_1/state/game_parameter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameApp extends StatelessWidget {
  const GameApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as GameParameter;
    // final int numOfLines = args.numOfLines;
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
