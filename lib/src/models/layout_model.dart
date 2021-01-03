import 'package:flutter/material.dart';
import 'package:flutter_pinterest/src/screens/slideshow_screen.dart';

class LayoutModel with ChangeNotifier {

  Widget _currentPage = SlideshowScreen();

  Widget get currentPage => _currentPage;

  set currentPage(Widget value) {
    _currentPage = value;
    notifyListeners();
  }
}