import 'package:flutter/material.dart';

class AppBarController extends ChangeNotifier {
  double offset = 0.0;

  void setOffset(double value) {
    offset = value;
    notifyListeners();
  }

  double getOffset() => offset;
}
