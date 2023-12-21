import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {

  // light theme data
  ThemeData _lightThemeData;
  // dart theme data
  ThemeData _darkThemeData;
  // theme mode: system , light, dart
  ThemeMode? _themeMode;

  ThemeProvider(this._lightThemeData, this._darkThemeData, this._themeMode);

  getTheme() => _lightThemeData;

  getDarkTheme() => _darkThemeData;

  getThemeMode() => _themeMode;

  setThemeColorScheme(ColorScheme colorScheme) {
    _lightThemeData = _lightThemeData.copyWith(colorScheme: colorScheme);
    notifyListeners();
  }

  setDarkColorScheme(ColorScheme colorScheme) {
    _darkThemeData = _darkThemeData.copyWith(colorScheme: colorScheme);
    notifyListeners();
  }

  setThemeMode(ThemeMode? mode) {
    _themeMode = mode;
    notifyListeners();
  }
}