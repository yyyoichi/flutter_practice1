import 'package:flutter/material.dart';
import 'package:flutter_application_1/state/game_stage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoToGame extends StatelessWidget {
  const GoToGame({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      final notifier = ref.read(gameStageProvider.notifier);
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
          child: TextButton(
              child: const Text("next =>"),
              onPressed: () {
                notifier.start();
              }));
    }));
  }
}
