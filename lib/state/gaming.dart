import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  final int direction;
  final String type;
  final int position;
  History(this.direction, this.type, this.position);
}

class GameNotifier extends StateNotifier<Gaming> {
  GameNotifier() : super(const Gaming());
  void onChangePlayer() {
    state.copyWith(isA: !state.isA, isLoading: !state.isLoading);
  }
}

final gameStateProvider = StateNotifierProvider<GameNotifier, Gaming>((ref) {
  return GameNotifier();
});
