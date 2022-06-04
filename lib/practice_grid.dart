import 'package:flutter/material.dart';
// import 'package:flutter_application_1/components/square.dart';

class PracticeGrid extends StatefulWidget {
  const PracticeGrid({Key? key}) : super(key: key);
  @override
  State<PracticeGrid> createState() => MyGrid();
}

class MyGrid extends State<PracticeGrid> {
  int click = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid"),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        children: List.generate(9, (index) {
          return Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(color: Colors.green),
              alignment: Alignment.center,
              child: GridTile(
                  footer: Center(
                    child: Text(
                      '$click $index',
                    ),
                  ),
                  child: const Text("aaaa")));
        }),
      ),
    );
  }
}
