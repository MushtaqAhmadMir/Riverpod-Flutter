import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_poc_flutter/providers/state_notifier_provider.dart';

class StateNotifierProviderExample extends ConsumerWidget {
  const StateNotifierProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int counterVal = ref.watch(counterNotifierprovider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifier Provider'),
      ),
      body: Center(
        child: Text(
          counterVal.toString(),
          style: const TextStyle(fontSize: 30),
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
