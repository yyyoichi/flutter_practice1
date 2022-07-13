import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/loading.dart';
import 'package:flutter_application_1/pages/game_setting.dart';
import 'package:flutter_application_1/state/game_stage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameApp extends StatelessWidget {
  const GameApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child){
      final stage = ref.watch(gameStageProvider);
      return Scaffold(
        appBar: AppBar(title: const Text("Reverpod.")),
        body: Center(
            child: (stage=="setting") ? const GameSetting() : const Loading()
        ));
    }); 
  }
}
