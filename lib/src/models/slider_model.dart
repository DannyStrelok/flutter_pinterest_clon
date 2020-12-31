import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {

  double _currentPage = 0;

  double get currentPage => this._currentPage;

  set currentPage(double value) {
    this._currentPage = value;
    notifyListeners();
  }

}