import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/go_to_game.dart';
import 'package:flutter_application_1/components/setting_field.dart';
import 'package:flutter_application_1/components/line_num_slider.dart';
import 'package:flutter_application_1/components/island_num_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class GameApp extends StatelessWidget {
  const GameApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: Scaffold(
            appBar: AppBar(title: const Text("Reverpod.")),
            body: Center(
                child: Column(children: [
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.all(25.0),
                      child: const SettingField())),
              const GoToGame(),
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 25.0),
                child: const LineNumSlider(),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 25.0),
                child: const IslandNumSlider(),
              )
            ]))));
  }
}


