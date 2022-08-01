import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/history_item.dart';
import 'package:flutter_application_1/state/gaming.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EndGame extends StatelessWidget {
  const EndGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final ended = ref.watch(gameStateProvider.select((value) => value.ended));
      final histories =
          ref.watch(gameStateProvider.select((value) => value.histories));
      return ended
          ? DecoratedBox(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const _Winner(),
                      TextButton(
                          child: const Text("TOP =>"),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/',
                            );
                          }),
                      Expanded(
                          child: ListView.builder(
                        shrinkWrap: false, // <- added
                        primary: false,
                        itemExtent: 50.0,
                        itemCount: histories.length,
                        itemBuilder: (context, index) {
                          History history = histories[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 1.0, horizontal: 2.0),
                            height: 10.0,
                            child: HistoryItem(history: history, isMe: true, isGrey: index%2 == 0),
                          );
                        },
                      ))
                    ]),
              ))
          : const SizedBox.shrink();
    });
  }
}

class _Winner extends StatelessWidget {
  const _Winner({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      final notifier = ref.read(gameStateProvider.notifier);
      String? winner = notifier.getWinner();
      if (winner == null) {
        return const Text("Error");
      }
      return Text("$winner is win!!",
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 45));
    }));
  }
}
