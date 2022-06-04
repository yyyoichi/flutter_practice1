import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/grid_table.dart';

class TableApp extends StatefulWidget {
  const TableApp({Key? key}) : super(key: key);
  @override
  State<TableApp> createState() => _TableAppState();
}

class _TableAppState extends State<TableApp> {
  double _num = 6;
  void _changeNumOfRow(double n) {
    setState(() {
      _num = n;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("make table.")),
        body: Center(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(25.0),
                child: GridTable(num: _num.toInt()),
              )),
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 25.0),
                // height: 40.0,
                child: Slider(
                  label: '$_num',
                  min: 5,
                  max: 10,
                  value: _num,
                  divisions: 10,
                  onChanged: _changeNumOfRow,
                ),
              )
            ],
          ),
        ));
  }
}
