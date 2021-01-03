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
          _currentTheme = ThemeData.light().copyWith(
            accentColor: Colors.pink
          );
        }
        break;
      case 2:
        {
          _darkTheme = true;
          _customTheme = false;
          _currentTheme = ThemeData.dark().copyWith(
            accentColor: Colors.pink,
          );
        }
        break;
      case 3:
        {
          _darkTheme = false;
          _customTheme = true;
          _currentTheme = ThemeData.dark().copyWith(
              accentColor: Color(0XFF48A0EB),
              primaryColorLight: Colors.white,
              scaffoldBackgroundColor: Color(0XFF16202B),
              textTheme: TextTheme(
                  bodyText1: TextStyle(color: Colors.white)
              )
          );
        }
        break;
      default: {
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(
            accentColor: Colors.pink
        );
      }

    }
  }

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    _customTheme = false;
    if(value) {
      _currentTheme = ThemeData.dark().copyWith(
          accentColor: Colors.pink
      );
    } else {
      _currentTheme = ThemeData.light().copyWith(
          accentColor: Colors.pink
      );
    }
    notifyListeners();
  }

  bool get customTheme => _customTheme;

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;
    if(value) {
      _currentTheme = ThemeData.dark().copyWith(
        accentColor: Color(0XFF48A0EB),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0XFF16202B),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white)
        )
      );
    } else {
      _currentTheme = ThemeData.light().copyWith(
          accentColor: Colors.pink
      );
    }
    notifyListeners();
  }

  ThemeData get currentTheme => _currentTheme;

}