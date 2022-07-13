import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/loading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameApp extends StatelessWidget {
  const GameApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child){
      return Scaffold(
        appBar: AppBar(title: const Text("Reverpod.")),
        body: const Center(
            child: Loading()
        ));
    }); 
  }
}
