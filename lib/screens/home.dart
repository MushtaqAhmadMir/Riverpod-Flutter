import 'package:flutter/material.dart';
import 'package:riverpod_poc_flutter/screens/change_notifier_provider_example.dart';
import 'package:riverpod_poc_flutter/screens/future_provider_example.dart';
import 'package:riverpod_poc_flutter/screens/simple_provider_example.dart';
import 'package:riverpod_poc_flutter/screens/state_notifier_provider_example.dart';
import 'package:riverpod_poc_flutter/screens/state_provider_example.dart';
import 'package:riverpod_poc_flutter/screens/stream_provider_example.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SimpleProviderExample(),
                ),
              );
            },
            child: const Text('Simple Provider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StateProviderExample(),
                ),
              );
            },
            child: const Text('State Provider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FutureProviderExample(),
                ),
              );
            },
            child: const Text('Future Provider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StreamProviderExample(),
                ),
              );
            },
            child: const Text('Stream Provider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StateNotifierProviderExample(),
                ),
              );
            },
            child: const Text('StateNotifier Provider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChangeNotifierProviderExample(),
                ),
              );
            },
            child: const Text('ChangeNotifer Provider'),
          ),
        ],
      ),
    );
  }
}
