import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/components/grid_table.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/riverpod_table.dart';

class RiverpodGrid extends StatelessWidget {
  const RiverpodGrid({Key? key}) : super(key: key);
  @override 
  Widget build (BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      final num = ref.watch(riverpodTableProvider.select((state) => state.numOfLines));
      return GridTable(num: num);
    }));
  }
}