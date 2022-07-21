import 'package:flutter/material.dart';
import 'package:flutter_application_1/state/gaming.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameHistory extends StatelessWidget {
  const GameHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      // final isA = ref.watch(gameStateProvider.select((value) => value.isA));
      final histories =
          ref.watch(gameStateProvider.select((value) => value.histories));

      return ListView.builder(
          itemCount: histories.length,
          itemBuilder: (context, index) {
            History history = histories[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
              height: 10.0,
              child: Row(children: [
                Text(history.position.getA1Notation()),
                Text(history.direction.toString())
              ]),
            );
          });
    }));
  }
}
