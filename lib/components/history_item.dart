import 'package:flutter/material.dart';

import '../state/gaming.dart';

class HistoryItem extends StatelessWidget {
  final History history;
  final bool isMe;

  const HistoryItem({Key? key, required this.history, required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
          child: isMe ? _me(context) : _they(context)),
      onTap: () {
        debugPrint("onTap called.");
      },
    );
  }

  Widget _me(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Text(
              history.direction.toString(),
              style: const TextStyle(fontSize: 30.0),
            )),
        Expanded(
            flex: 4,
            child: Text(
              history.type,
              style: const TextStyle(fontSize: 30.0),
            )),
        Expanded(
            flex: 3,
            child: Text(
              history.position.getA1Notation(),
              style: const TextStyle(color: Colors.black, fontSize: 30.0),
            )),
        Expanded(
            flex: 2,
            child: Text(
              history.type == "atack" ? history.result : "",
              style: const TextStyle(color: Colors.black, fontSize: 30.0),
            ))
      ],
    );
  }

  Widget _they(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Text(
              history.direction.toString(),
              style: const TextStyle(fontSize: 30.0),
            )),
        Expanded(
            flex: 4,
            child: Text(
              history.type,
              style: const TextStyle(fontSize: 30.0),
            )),
        Expanded(
            flex: 3,
            child: Text(
              history.type == "move" ? "" : history.position.getA1Notation(),
              style: const TextStyle(color: Colors.black, fontSize: 30.0),
            )),
        Expanded(
            flex: 2,
            child: Text(
              history.type == "atack" ? history.result : "",
              style: const TextStyle(color: Colors.black, fontSize: 30.0),
            ))
      ],
    );
  }
}
