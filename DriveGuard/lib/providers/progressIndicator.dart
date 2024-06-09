import 'package:riverpod/riverpod.dart';

// Step 1: Define a class that extends StateNotifier
class ProgressIndicatorProvider extends StateNotifier<bool> {
  ProgressIndicatorProvider() : super(false); // Initial value

  // Step 2: Implement methods to update the boolean variable
  void toggle(bool value) {
    state = value;
  }
}

final progressProvider = StateNotifierProvider<ProgressIndicatorProvider, bool>(
  (ref) {
    return ProgressIndicatorProvider();
  },
);
