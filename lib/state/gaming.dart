import 'package:flutter/cupertino.dart';

@immutable
class Gaming {
  final bool isA;
  final bool isLoading;
  final List<History> histories;

  const Gaming(
      {this.isA = true,
      this.isLoading = false,
      this.histories = const <History>[]});

  Gaming copyWith({bool? isA, bool? isLoading, List<History>? histories}) {
    return Gaming(
        isA: isA ?? this.isA,
        isLoading: isLoading ?? this.isLoading,
        histories: histories ?? this.histories);
  }
}

class History {
  final int direction ;
  final String type;
  final int position;
  History(this.direction, this.type, this.position);
}