import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/game_setting.dart';

class GameApp extends StatelessWidget {
  const GameApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Reverpod.")),
        body: Center(
            child: Stack(
          children: const [GameSetting()],
        )));
  }
}
