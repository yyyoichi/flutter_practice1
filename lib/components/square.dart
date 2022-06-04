import 'package:flutter/material.dart';

class Squeare extends StatelessWidget {
  const Squeare({Key? key, this.counter}) : super(key: key);
  final int? counter;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF000FF0),
      width: 100.0,
      height: 100.0,
      child: Text(counter.toString()),
    );
  }
}
