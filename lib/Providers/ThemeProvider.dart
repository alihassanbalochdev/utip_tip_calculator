
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

// Getter
bool get isDarkMode => _isDarkMode;

// Method to toggle between light and dark mode.
void toggleTheme() {
  _isDarkMode = !_isDarkMode;
  notifyListeners();
}

  ThemeData get currentThem {
    
  return _isDarkMode ? ThemeData.dark() : ThemeData.light();
  }
}