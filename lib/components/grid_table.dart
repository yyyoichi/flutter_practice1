import 'package:flutter/cupertino.dart';
class GridTable extends StatelessWidget {
  const GridTable({Key? key, required this.num}) : super(key: key);
  final int num;
  @override
  Widget build(BuildContext context) {
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
  }
}
