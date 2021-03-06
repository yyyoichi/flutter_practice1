import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/prepare.dart';

class SettingField extends StatelessWidget {
  const SettingField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      final num =
          ref.watch(riverpodTableProvider.select((state) => state.numOfLines));
      final posIslands = ref.watch(
          riverpodTableProvider.select((state) => state.positionsOfIsland));
      const sea = Color.fromARGB(255, 131, 134, 172);
      const island = Color.fromARGB(255, 28, 54, 32);
      return GridView.count(
        crossAxisCount: num,
        crossAxisSpacing: 3.0,
        mainAxisSpacing: 3.0,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(num * num, (index) {
          return Container(
            color: posIslands.contains(index) ? island : sea,
            width: 100.0,
            height: 100.0,
          );
        }),
      );
    }));
  }
}
