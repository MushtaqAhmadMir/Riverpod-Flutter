import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_poc_flutter/providers/state_provider.dart';

class StateProviderExample extends ConsumerWidget {
  const StateProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var stringValue = ref.watch(stringStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(stringValue),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(intStateProvider.notifier).state++;
        },
      ),
      body: Consumer(
        builder: (context, ref, child) {
          var value = ref.watch(intStateProvider);
          return Center(
            child: Text(
              value.toString(),
              style: const TextStyle(fontSize: 28),
            ),
          );
        },
      ),
    );
  }
}
