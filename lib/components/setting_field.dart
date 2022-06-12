import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/game_setting.dart';

class SettingField extends StatelessWidget {
  const SettingField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      final num = ref.watch(riverpodTableProvider.select((state) => state.numOfLines));
      final posIslands = ref.watch(riverpodTableProvider.select((state) => state.positionsOfIsland));
      const sea = Color.fromARGB(255, 130, 132, 156);
      const island = Color.fromARGB(255, 15, 29, 17);
      return GridView.count(
        crossAxisCount: num,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        children: List.generate(num * num, (index) {
          return Container(
            color: posIslands.contains(index) ? island: sea,
            width: 100.0,
            height: 100.0,
          );
        }),
      );
    }));
  }
}
