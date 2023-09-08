import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_poc_flutter/providers/state_notifier_provider.dart';

class StateNotifierProviderExample extends ConsumerWidget {
  const StateNotifierProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int counterVal = ref.watch(counterNotifierprovider);
    final weatherState = ref.watch(weatherNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifier Provider'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              counterVal.toString(),
              style: const TextStyle(fontSize: 30),
            ),
            if (weatherState.weather != null) ...{
              Text(
                'Weather in ${weatherState.weather!.cityName}: ${weatherState.weather!.temperature}°C',
              )
            },
            if (weatherState.isLoading) ...{const CircularProgressIndicator()},
            if (weatherState.error != null) ...{
              Text('Error: ${weatherState.error}')
            },
            ElevatedButton(
              onPressed: () {
                const cityName = 'Banglore';
                ref
                    .read(weatherNotifierProvider.notifier)
                    .fetchWeather(cityName);
              },
              child: const Text('Fetch Weather'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //accessing and imutating/replacing the state and notifier
          ref.read(counterNotifierprovider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
