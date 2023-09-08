import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_poc_flutter/providers/future_provider.dart';

class FutureProviderExample extends ConsumerWidget {
  const FutureProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Column(
        children: [
          ref.watch(weatherProvider).when(
            data: (data) {
              return Center(
                child: Text(
                  data,
                  style: const TextStyle(fontSize: 28),
                ),
              );
            },
            error: (error, stacktrace) {
              return const Center(
                child: Text('Error'),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          //provider with family
          ref.watch(weatherProviderFamily('Banglore')).when(
            data: (data) {
              return Center(
                child: Text(
                  data,
                  style: const TextStyle(fontSize: 28),
                ),
              );
            },
            error: (error, stacktrace) {
              return const Center(
                child: Text('Error'),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
