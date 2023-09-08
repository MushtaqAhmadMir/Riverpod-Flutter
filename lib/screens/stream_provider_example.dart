import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_poc_flutter/providers/stream_provider.dart';

class StreamProviderExample extends ConsumerWidget {
  const StreamProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var asyncValue = ref.watch(numberProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: asyncValue.when(data: (data) {
        return Center(
          child: Text(
            data.toString(),
            style: const TextStyle(fontSize: 28),
          ),
        );
      }, error: (error, st) {
        return Center(
          child: Text(
            asyncValue.toString(),
            style: const TextStyle(fontSize: 28),
          ),
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
