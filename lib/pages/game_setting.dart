import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/go_to_game.dart';
import '../components/island_num_slider.dart';
import '../components/line_num_slider.dart';
import '../components/setting_field.dart';

class GameSetting extends StatelessWidget {
  const GameSetting({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: Column(children: [
      Expanded(
          child: Container(
              margin: const EdgeInsets.all(25.0), child: const SettingField())),
      const GoToGame(),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
        child: const LineNumSlider(),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
        child: const IslandNumSlider(),
      )
    ]));
  }
}