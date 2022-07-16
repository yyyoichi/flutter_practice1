import 'package:flutter/cupertino.dart';
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
      return GridView.count(
        crossAxisCount: numOfLines,
        crossAxisSpacing: 3.0,
        mainAxisSpacing: 3.0,
        children: List.generate(numOfLines * numOfLines, (index) {
          return Container(
            color: posIslands.contains(index) ? island : sea,
            width: 50.0,
            height: 50.0,
          );
        }),
      );
    }));
  }
}
