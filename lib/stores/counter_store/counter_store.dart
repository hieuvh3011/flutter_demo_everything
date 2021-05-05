import 'package:flutter/material.dart';

class CounterStore extends ChangeNotifier {
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
