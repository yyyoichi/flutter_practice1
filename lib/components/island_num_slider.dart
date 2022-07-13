import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/prepare.dart';


class IslandNumSlider extends StatelessWidget {
  const IslandNumSlider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      final notifier = ref.read(riverpodTableProvider.notifier);
      final maxIsland = ref.watch(riverpodTableProvider.select((state) => state.maxOfIsland));
      final num = ref.watch(riverpodTableProvider.select((state) => state.positionsOfIsland)).length;
      return Slider(
        label: '島の数: $num',
        min: 0,
        max: maxIsland.toDouble(),
        value: num.toDouble(),
        divisions: maxIsland.toInt(),
        onChanged: notifier.onChangeIsland,
      );
    }));
  }
}
