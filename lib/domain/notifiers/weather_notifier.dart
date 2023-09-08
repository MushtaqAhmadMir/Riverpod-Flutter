import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_poc_flutter/data/repo/weather_repo.dart';
import 'package:riverpod_poc_flutter/domain/state/weather_state.dart';

class WeatherNotifier extends StateNotifier<WeatherState> {
  final WeatherRepository _repository;

  WeatherNotifier(this._repository) : super(WeatherState.loading(false));

  Future<void> fetchWeather(String cityName) async {
    state = WeatherState.loading(true);
    try {
      final weather = await _repository.fetchWeather(cityName);
      state = WeatherState.data(weather);
    } catch (e) {
      state = WeatherState.error('Failed to fetch weather data');
    }
  }
}
