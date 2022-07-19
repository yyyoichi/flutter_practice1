import 'package:flutter/material.dart';
import 'package:flutter_application_1/state/gaming.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Board extends StatelessWidget {
  const Board({Key? key, required this.numOfLines, required this.posIslands})
      : super(key: key);
  final int numOfLines;
  final Set<int> posIslands;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      const now = Color.fromRGBO(190, 40, 30, 1);
      const sea = Color.fromARGB(255, 131, 134, 172);
      const island = Color.fromRGBO(28, 54, 32, 1);
      final notifier = ref.read(gameStateProvider.notifier);
      final isNowPosition =
          ref.watch(gameStateProvider.select((value) => value.isNowPosition));
      return GridView.count(
        crossAxisCount: numOfLines,
        crossAxisSpacing: 3.0,
        mainAxisSpacing: 3.0,
        children: List.generate(numOfLines * numOfLines, (index) {
          final column = index % numOfLines;
          final row = index ~/ numOfLines;
          final isIaland = posIslands.contains(index);
          return GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (childContext) {
                    return SimpleDialog(
                      title: const Text("action"),
                      children: [
                        SimpleDialogOption(
                          child: const Text("move"),
                          onPressed: () {
                            void action() async {
                              if (isIaland) return;
                              Function? success = await notifier.put(row, column, "move", 1);
                              if (success != null) {
                                success("safe");
                                notifier.changePlayer();
                              }
                            }
                            Navigator.pop(childContext);
                            action();
                          },
                        ),
                        SimpleDialogOption(
                          child: const Text("atack"),
                          onPressed: () {
                            void action() async {
                              if (isIaland) return;
                              Function? success = await notifier.put(row, column, "atack", 1);
                              if (success == null) return;
                              String atackResult =
                                  await notifier.atackResulut(row, column);
                              if (atackResult == "over") {
                                debugPrint("直撃！");
                              } else if (atackResult == "near") {
                                debugPrint("面舵一杯！");
                              } else {
                                debugPrint("ヨーソロー！");
                              }
                              success(atackResult);
                              notifier.changePlayer();
                            }
                            Navigator.pop(childContext);
                            action();
                          },
                        )
                      ],
                    );
                  });
            },
            child: Container(
              color: isNowPosition(row, column)
                  ? now
                  : isIaland
                      ? island
                      : sea,
              width: 50.0,
              height: 50.0,
            ),
          );
        }),
      );
    }));
  }
}
