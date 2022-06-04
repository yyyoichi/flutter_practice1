import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/components/square.dart';
class GridTable extends StatefulWidget {
  final int num;
  const GridTable({Key? key, required this.num}) : super(key: key);
  @override
  State<GridTable> createState() => _GridTableState();
}
class _GridTableState extends State<GridTable> {
  //statefullにするところ間違えた。
  //また使うかもしれないから放置。
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: widget.num,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 4.0,
      children: List.generate(widget.num * widget.num, (index){
        return const Squeare(counter: 0);
      }),
    );
  }
}
