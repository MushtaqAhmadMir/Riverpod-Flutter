## Author

- Mushtaq Ahmad
  - Email: mushtaq11917632@gmail.com
  - GitHub: [github.com/mushtaqahmadmir](https://github.com/mushtaqahmadmir)
  - Date: [08-09-2023]

# All the providers of Riverpod State Management
# riverpod_poc_flutter

# About
Riverpod is a state management library for Flutter, developed by the creator of the Provider package, Remi Rousselet. It's designed to provide a more powerful and flexible way to manage state and dependencies in Flutter applications. Riverpod is built on the Provider pattern and offers several advantages
# Providers:
1. Provider
2. StateProvider
3. FutureProvider
4. StreamProvider
5. StateNotifierProvider
6. ChangeNotifierProvider

# Modifiers:
1. autoDispose
2. family


# Provider:

# When to Use:
 Use the Provider when you want to create a simple, read-only value or object. It's a basic provider that does not manage state changes or mutations. This is suitable for non-reactive data or data that doesn't change frequently.

# Differences:
 It's the simplest form of provider and is primarily for exposing data or objects. It doesn't handle state changes or updates. Once created, the value remains constant.

# How it works?
```
final stringProvider = Provider<String>((ref) => 'Hello i am string Provider');
final intProvider = Provider<int>((ref) => 12) 
```
```
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
```



# StateProvider:

# When to Use:
 Use the StateProvider when you need to manage and modify a piece of mutable state. It's designed for managing simple, locally scoped state within a widget tree.

# Differences:
 Unlike the basic Provider, the StateProvider allows you to read and update the state within your widget tree. It's typically used for localized state changes, such as toggling a UI element.
# How it works?
```
 final intStateProvider = StateProvider.autoDispose<int>((ref) => 0);
```

 ```

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

 ```

# FutureProvider:

# When to Use:
 Use the FutureProvider when you want to expose a value that will be available in the future, such as the result of an asynchronous operation (e.g., an API call). This provider simplifies handling async data.

# Differences:
 It's designed to handle asynchronous operations and provides a convenient way to work with data that isn't immediately available.

# How it works?
```
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
```

```
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
```

# StreamProvider:

# When to Use:
 Use the StreamProvider when you want to expose a continuous stream of data, such as real-time updates from a database or server. It's suitable for scenarios where data can change over time.

# Differences:
 It works with streams and allows you to reactively update your UI as new data arrives.

 # How it works?
 ```
 import 'package:flutter_riverpod/flutter_riverpod.dart';
//using autodispose will not save/cache state , it will create new state on each render, removing autodispose will cache the state
final numberProvider = StreamProvider.autoDispose<int>(
  (ref) => fetchNumbers(),
);

Stream<int> fetchNumbers() {
  return Stream.periodic(
    const Duration(seconds: 1),
    (number) => number,
  ).take(20);
}
 ```

# StateNotifierProvider:

# When to Use:
 Use the StateNotifierProvider when you need a more structured and organized way to manage complex state. It's ideal for scenarios where your state management logic becomes intricate.

# Differences:
 It uses a custom state management class that extends StateNotifier to handle state changes. This provides better encapsulation and organization of state management code.

 # How it works?
 ```
 final counterNotifierprovider = StateNotifierProvider<CounterNotifier,int>( //notifier and state type
  (ref) => CounterNotifier(),
);


class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0); //0 is initial state
  void increment() {
    state = state + 1; //replacing old state using new , handling immutable
  }
}
 ```

 ```
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
        child: Column(
          children: [
            Text(
              counterVal.toString(),
              style: const TextStyle(fontSize: 30),
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

 ```

# ChangeNotifierProvider:

# When to Use:
 Use the ChangeNotifierProvider when you are working with classes that implement the ChangeNotifier mixin, often used with Provider or Consumer.

# Differences:
 It's similar to StateProvider but specifically designed for classes that use Flutter's ChangeNotifier mechanism for notifying listeners about state changes. It integrates well with Flutter's built-in Provider widget.

 # How it Works

```
final changeNotifierProvider = ChangeNotifierProvider<User>(
  (ref) => User(),
);

class User extends ChangeNotifier {
  String userName = 'Mushtaq';

  void changeUserName() {
    userName = 'Coding with Mushtaq';
    //notifying all the listeners/consumers that state has changed
    notifyListeners();
  }
}
```

```
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

```


In summary, the choice of which provider to use depends on your specific use case and requirements. Here's a general guideline:

Use [Provider] for exposing read-only data or objects.
Use [StateProvider] for managing simple, local state within a widget tree.
Use [FutureProvider] for working with asynchronous operations.
Use [StreamProvider] for handling continuous data streams.
Use [StateNotifierProvider] for organized state management in more complex scenarios.
Use [ChangeNotifierProvider] when working with classes that use Flutter's ChangeNotifier mechanism.
You can also combine these providers to create more complex state management solutions as your app's needs evolve.

--------------------------------Modifiers-------------------------------------------------
# autoDispose:
# Purpose: 
The autoDispose modifier is used to specify whether a provider should automatically dispose of its value when it is no longer being used. When a provider is set to auto-dispose, it will automatically clean up its resources when no longer needed, typically when all subscribers have been removed.

# When to Use:
Use autoDispose for providers that manage resources that should be released when they are no longer in use.
Useful for managing resources like network connections, timers, or database connections to prevent resource leaks.

# How it works

```
//provider with modifier autodispose
final weatherProvider = FutureProvider.autoDispose<String>(
  (ref) => fetchWeather(),
);

```


# family:
# Purpose:  
The family modifier is used to create a family of providers with a common name and differentiated by a parameter. It allows you to create multiple instances of a provider with varying values based on a parameter.

# When to Use:

Use family when you need to create multiple instances of a provider that share the same logic but differ in some parameters.
Useful for scenarios like creating a provider for each item in a list, each with its own unique data.

# How to use
```
//provider with modifier family
final weatherProviderFamily = FutureProvider.family<String, String>(
  (ref, city) => fetchWeatherFamily(city),
);
```




