import 'package:flutter/cupertino.dart';
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
      const island = Color.fromARGB(255, 28, 54, 32);
      final notifier = ref.watch(gameStateProvider.notifier);
      final isNowPosition = ref.watch(gameStateProvider.select((value) => value.isNowPosition));
      return GridView.count(
        crossAxisCount: numOfLines,
        crossAxisSpacing: 3.0,
        mainAxisSpacing: 3.0,
        children: List.generate(numOfLines * numOfLines, (index) {
          final column = index % numOfLines;
          final row = index ~/ numOfLines;
          final isIaland = posIslands.contains(index);
          return GestureDetector(
            onTap: () async {
              if (isIaland) {
                //島はタップ無効
                return;
              }
              bool result = await notifier.put(row, column, 1);
              if (result) {
                notifier.changePlayer();
              } else {
                debugPrint("\t 置けない場所です!");
              }
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
