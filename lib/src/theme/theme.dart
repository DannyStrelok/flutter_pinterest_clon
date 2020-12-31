import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme;

  ThemeChanger(int theme) {
    switch(theme) {
      case 1:
        {
          _darkTheme = false;
          _customTheme = false;
          _currentTheme = ThemeData.light();
        }
        break;
      case 2:
        {
          _darkTheme = true;
          _customTheme = false;
          _currentTheme = ThemeData.dark();
        }
        break;
      case 3:
        {
          _darkTheme = false;
          _customTheme = true;
        }
        break;
      default: {
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
      }

    }
  }

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    _customTheme = false;
    if(value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  bool get customTheme => _customTheme;

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;
    if(value) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  ThemeData get currentTheme => _currentTheme;



}