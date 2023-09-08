import 'package:riverpod_poc_flutter/data/models/weather_model.dart';

class WeatherState {
  final WeatherModel? weather;
  final String? error;
  final bool isLoading;

  WeatherState({
    this.weather,
    this.error,
    this.isLoading = false,
  });

  factory WeatherState.loading(bool loading) => WeatherState(isLoading: loading);

  factory WeatherState.data(WeatherModel weather) => WeatherState(weather: weather);

  factory WeatherState.error(String error) => WeatherState(error: error);
}
