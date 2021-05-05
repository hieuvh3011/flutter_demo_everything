import 'package:flutter/material.dart';

class CounterStoreMigration extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

  void decrement() {
    if (counter != 0) {
      counter--;
      notifyListeners();
    }
  }
}
