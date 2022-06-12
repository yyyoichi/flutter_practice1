import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../game_setting.dart';

class LineNumSlider extends StatelessWidget {
  const LineNumSlider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      final notifier = ref.read(riverpodTableProvider.notifier);
      final num = ref.watch(riverpodTableProvider.select((value) => value.numOfLines));
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: Slider(
            label: 'フィールド: $num',
            min: 4,
            max: 9,
            value: num.toDouble(),
            divisions: 5,
            onChanged: notifier.onChangeLines,
          ));
    }));
  }
}