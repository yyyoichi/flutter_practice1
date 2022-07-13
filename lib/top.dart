import 'package:flutter/material.dart';
import 'package:flutter_application_1/state/prepare.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Top extends StatelessWidget {
  Top({Key? key}) : super(key: key);
  final numOfLines = 5;
  final positionsOfIsland = [7, 16];
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
