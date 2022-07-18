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
      const sea = Color.fromARGB(255, 131, 134, 172);
      const island = Color.fromARGB(255, 28, 54, 32);
      final notifier = ref.watch(gameStateProvider.notifier);
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
                debugPrint("置けない!");
                return;
              }
              final flag = await notifier.canPut(row, column, 1);
              debugPrint(flag ? "置ける！" : "置けない!");
              if (flag) {
                notifier.put(row, column, 1);
              }
            },
            child: Container(
              color: isIaland ? island : sea,
              width: 50.0,
              height: 50.0,
            ),
          );
        }),
      );
    }));
  }
}
