import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/components/square.dart';

class GridTable extends StatelessWidget {
  final int num;
  const GridTable({Key? key, required this.num}) : super(key: key);
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: num,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 4.0,
      children: List.generate(num * num, (index){
        return const Squeare(counter: 0);
      }),
    );
  }
}
