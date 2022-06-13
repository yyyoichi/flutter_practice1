import 'package:flutter/material.dart';
import 'package:flutter_application_1/game_setting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: Scaffold(
            appBar: AppBar(title: const Text("Reverpod.")),
            body: Consumer(builder: ((context, ref, child) {
              final num = ref
                  .watch(riverpodTableProvider
                      .select((state) => state.positionsOfIsland))
                  .length;
              return Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  child: Text('$num'));
            }))));
  }
}
