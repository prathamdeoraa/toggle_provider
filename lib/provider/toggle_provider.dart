import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ToggleProvider with ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  void setTheme() {
    _isDark = !isDark;
    notifyListeners();
  }

  ThemeMode get currentTheme => _isDark ? ThemeMode.dark : ThemeMode.light;
}
