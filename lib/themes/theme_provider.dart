import 'package:flutter/material.dart';
import 'package:test_project/themes/dark_mode.dart';
import 'package:test_project/themes/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightmode; // Default theme

  ThemeData get themeData => _themeData;

  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightmode) {
      _themeData = darkmode; // Switch to dark mode
    } else {
      _themeData = lightmode; // Switch to light mode
    }
    notifyListeners();
  }
}