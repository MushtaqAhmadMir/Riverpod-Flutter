import 'package:flutter_riverpod/flutter_riverpod.dart';

//provider with modifier autodispose
final weatherProvider = FutureProvider.autoDispose<String>(
  (ref) => fetchWeather(),
);
//provider with modifier family
final weatherProviderFamily = FutureProvider.family<String, String>(
  (ref, city) => fetchWeatherFamily(city),
);

Future<String> fetchWeather() async {
  return await Future.delayed(
    const Duration(seconds: 3),
    () => '32°',
  );
}

//modifier family
Future<String> fetchWeatherFamily(String city) async {
  return await Future.delayed(
    const Duration(seconds: 3),
    () => '$city temp is 32°',
  );
}
