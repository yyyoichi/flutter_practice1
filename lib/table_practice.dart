import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/grid_table.dart';

class TableApp extends StatelessWidget {
  final int num = 6;
  const TableApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("make table.")
      ),
      body: Container(
        margin: const EdgeInsets.all(25.0),
        child: GridTable(num: num),
        )
    );
  }
}

