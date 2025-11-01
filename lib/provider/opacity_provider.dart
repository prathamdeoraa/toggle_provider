import 'package:flutter/foundation.dart';

class OpacityProvider with ChangeNotifier {
  double _opacity = 0.5;
  double get opacity => _opacity;

  void setOpacity(double value) {
    _opacity = value;
    notifyListeners();
  }
}
