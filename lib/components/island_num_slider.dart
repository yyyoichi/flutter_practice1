import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../game_setting.dart';

class IslandNumSlider extends StatelessWidget {
  const IslandNumSlider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      final notifier = ref.read(riverpodTableProvider.notifier);
      final num = ref.watch(riverpodTableProvider.select((value) => value.numOfIsland));
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          // child: Text('$num aaa'));
          child: Slider(
            label: '島の数: $num',
            min: 0,
            max: 10,
            value: num.toDouble(),
            divisions: 10,
            // onChanged: notifier.onChangeLines,
            onChanged: notifier.onChangeIsland,
          ));
    }));
  }
}