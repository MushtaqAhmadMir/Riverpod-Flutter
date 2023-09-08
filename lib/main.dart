import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_poc_flutter/screens/home.dart';
import 'package:riverpod_poc_flutter/screens/simple_provider_example.dart';
import 'package:riverpod_poc_flutter/screens/state_provider_example.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: {
      //   '/home':(context) => const HomeScreen(),
      //   '/SimpleProvider':(context) => const SimpleProvider(),
      //   '/StateProvider':(context) => const StateProviderExample(),
      // },

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod State Management'),
        ),
        body: const HomeScreen()
      ),
    );
  }
}
