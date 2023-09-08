import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_poc_flutter/providers/simple_provider.dart';

class SimpleProviderExample extends ConsumerWidget {
  const SimpleProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //we consume string provider 
    String name = ref.read(stringProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Provider'),),
      body: Center(
        child: Text(name),
      ),
    );
  }
}
