import 'package:flutter/material.dart';
import 'package:flutter_application_1/state/gaming.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToNextPlayer extends StatelessWidget {
  const ToNextPlayer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      final isLoading =
          ref.watch(gameStateProvider.select((value) => value.isLoading));
      return isLoading
          ? Expanded(
              child: DecoratedBox(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255)),
                  // margin:
                  //     const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [_NextPlayer(), _ToNext()]),
                  )))
          : const SizedBox.shrink();
    }));
  }
}

class _NextPlayer extends StatelessWidget {
  const _NextPlayer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      final isA = ref.watch(gameStateProvider.select((value) => value.isA));
      return Text(isA ? "Next...A" : "Next...B",
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 45));
    }));
  }
}

class _ToNext extends StatelessWidget {
  const _ToNext({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      final notifier = ref.read(gameStateProvider.notifier);
      return TextButton(
        onPressed: notifier.closeLoading,
        child: const Text("次へ"),
      );
    }));
  }
}
