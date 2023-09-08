import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterNotifierprovider = StateNotifierProvider<CounterNotifier,int>( //notifier and state type
  (ref) => CounterNotifier(),
);

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0); //0 is initial state
  void increment() {
    state = state + 1; //replacing old state using new , handling immutable
  }
}
