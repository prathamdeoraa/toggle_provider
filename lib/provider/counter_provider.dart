import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }

  DateTime _noww = DateTime.now();
  DateTime get noww => _noww;

  void datetime() {
    _noww = DateTime.now();
    notifyListeners();
  }
}
