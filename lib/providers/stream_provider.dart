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
