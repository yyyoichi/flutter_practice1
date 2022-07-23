import 'package:flutter/material.dart';

import '../state/gaming.dart';

class HistoryItem extends StatelessWidget {
  final History history;
  final bool isMe;

  const HistoryItem({Key? key, required this.history, required this.isMe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10.0),
                child: const Text("A"),
              ),
              Text(
                history.toString(),
                style: const TextStyle(color: Colors.black, fontSize: 18.0),
              ),
            ],
          )),
      onTap: () {
        debugPrint("onTap called.");
      },
    );
  }
}
