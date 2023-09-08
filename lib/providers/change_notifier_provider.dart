import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
