import 'package:flutter/material.dart';
import 'package:flutter_application_1/state/game_parameter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/prepare.dart';

class GoToGame extends StatelessWidget {
  const GoToGame({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      final num = ref.watch(riverpodTableProvider.select((value) => value.numOfLines));
      final position = ref.watch(riverpodTableProvider.select((value) => value.positionsOfIsland));
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
          child: TextButton(
              child: const Text("next =>"),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/game',
                  arguments: GameParameter(numOfLines: num, positionsOfIsland: position),
                );
              }));
    }));
  }
}
