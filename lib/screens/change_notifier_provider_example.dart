import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_poc_flutter/providers/change_notifier_provider.dart';

class ChangeNotifierProviderExample extends ConsumerWidget {
  const ChangeNotifierProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifier Provider'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          var data = ref.watch(changeNotifierProvider);
          return Center(
            child: Text(
              data.userName.toString(),
              style: const TextStyle(fontSize: 30),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //accessing and mutating the state and notifier
          ref.read(changeNotifierProvider.notifier).changeUserName();
        },
        child: const Icon(Icons.change_circle),
      ),
    );
  }
}
