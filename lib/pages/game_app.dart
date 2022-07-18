import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/empty_app_bar.dart';
import 'package:flutter_application_1/components/game/board.dart';
import 'package:flutter_application_1/components/game/to_next_player.dart';
import 'package:flutter_application_1/state/game_parameter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameApp extends StatelessWidget {
  const GameApp({
    Key? key,
    this.args = const GameParameter(),
  }) : super(key: key);
  final GameParameter args;
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: Scaffold(
            appBar: const EmptyAppBar(),
            body: Stack(children: [
              Column(children: [
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Board(
                          numOfLines: args.numOfLines,
                          posIslands: args.positionsOfIsland,
                        ))),
              ]),
              const ToNextPlayer()
            ])));
  }
}
