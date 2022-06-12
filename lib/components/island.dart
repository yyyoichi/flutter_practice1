import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/game_setting.dart';

class Island extends StatelessWidget {
  const Island({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      final num = ref.watch(riverpodTableProvider.select((state) => state.numOfLines));
      return GridView.count(
        crossAxisCount: num,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        children: List.generate(num * num, (index) {
          return Container(
            color: const Color(0xFF000FF0),
            width: 100.0,
            height: 100.0,
          );
        }),
      );
    }));
  }
}
