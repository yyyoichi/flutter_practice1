import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/empty_app_bar.dart';
import '../components/go_to_game.dart';
import '../components/island_num_slider.dart';
import '../components/line_num_slider.dart';
import '../components/setting_field.dart';

class GameSetting extends StatelessWidget {
  const GameSetting({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: Scaffold(
            appBar: const EmptyAppBar(),
            body: Center(
                child: Column(children: [
              Container(
                  margin: const EdgeInsets.all(5.0),
                  child: const Expanded(child: SettingField())),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
                child: const LineNumSlider(),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
                child: const IslandNumSlider(),
              ),
              const GoToGame(),
            ]))));
  }
}
