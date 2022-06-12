import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod_table.dart';

class RiverpodSlider extends StatelessWidget {
  const RiverpodSlider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      final notifier = ref.read(riverpodTableProvider.notifier);
      final num = ref.watch(riverpodTableProvider.select((value) => value.numOfLines));
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
          child: Slider(
            label: '数',
            min: 4,
            max: 9,
            value: num.toDouble(),
            divisions: 5,
            onChanged: notifier.onChangeIsland,
          ));
    }));
  }
}
