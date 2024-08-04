import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false; // Default theme is light mode

  bool get isDarkMode => _isDarkMode;

  void toggleTheme(bool bool) {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
