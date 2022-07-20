import 'package:flutter/material.dart';
import 'package:flutter_application_1/state/gaming.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EndGame extends StatelessWidget {
  const EndGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final ended = ref.watch(gameStateProvider.select((value) => value.ended));
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
                          })
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
