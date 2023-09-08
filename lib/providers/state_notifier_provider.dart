import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_poc_flutter/data/repo/weather_repo.dart';
import 'package:riverpod_poc_flutter/domain/notifiers/weather_notifier.dart';
import 'package:riverpod_poc_flutter/domain/state/weather_state.dart';

final counterNotifierprovider = StateNotifierProvider<CounterNotifier,int>( //notifier and state type
  (ref) => CounterNotifier(),
);


//
final weatherRepositoryProvider = Provider<WeatherRepository>((ref) => WeatherRepository());
final weatherNotifierProvider = StateNotifierProvider<WeatherNotifier, WeatherState>(
  (ref) => WeatherNotifier(ref.read(weatherRepositoryProvider)),
);

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0); //0 is initial state
  void increment() {
    state = state + 1; //replacing old state using new , handling immutable
  }
}
