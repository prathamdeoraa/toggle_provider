import 'package:flutter/material.dart';

class SliderProvider with ChangeNotifier {
  double _value = 10.0;

  double get value => _value;

  void setOpacitySlider(BuildContext context, double newValue) {
    // Theme.brightnessOf(context).

    _value = newValue;
    notifyListeners();

    
  }
}
