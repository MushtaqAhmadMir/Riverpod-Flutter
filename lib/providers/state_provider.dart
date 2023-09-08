import 'package:flutter_riverpod/flutter_riverpod.dart';

final stringStateProvider = StateProvider<String>((ref) => 'Hello i am State Provider');

//using autodispose will not save/cache state , it will create new state on each render, removing autodispose will cache the state
final intStateProvider = StateProvider.autoDispose<int>((ref) => 0);