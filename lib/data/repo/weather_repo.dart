import 'package:riverpod_poc_flutter/data/models/weather_model.dart';

class WeatherRepository {
  Future<WeatherModel> fetchWeather(String cityName) async {
    return Future.delayed(
      const Duration(seconds: 3),
      () => WeatherModel(cityName: cityName, temperature: 33.0),
    );
  }
}
