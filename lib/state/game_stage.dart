import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameStageProvider = StateNotifierProvider<StageNotifier, String>((ref) {
  return StageNotifier(ref);
});

class StageNotifier extends StateNotifier<String> {
  StageNotifier(this.ref) : super("setting");
  final Ref ref;
  void start() {
    state = "start";
  }
  void end() {
    state = "end";
  }
}