import 'package:flutter/material.dart';

class SliderProvider extends ChangeNotifier {
  RangeValues _rangeValues = const RangeValues(0.0, 100.0);

  void changedRangeValues({
    required RangeValues rangeValues,
  }) {
    _rangeValues = rangeValues;
    notifyListeners();
  }

  RangeValues get rangeValues => _rangeValues;
}
