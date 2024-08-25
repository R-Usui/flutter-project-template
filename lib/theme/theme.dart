import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';

class ThemeNotifier extends ChangeNotifier {
  // ====================================================
  //Material version
  bool _useMaterial3 = true;

  bool get useMaterial3 => _useMaterial3;

  void setUseMaterial3(bool value) {
    _useMaterial3 = value;
    notifyListeners();
  }

  // ====================================================
  // Color

  Color _colorSchemeSeed = Colors.purple;

  Color get colorSchemeSeed => _colorSchemeSeed;

  void setColorSchemeSeed(Color value) {
    _colorSchemeSeed = value;
    notifyListeners();
  }

  ColorScheme get _lightColorScheme => ColorScheme.fromSeed(
        seedColor: colorSchemeSeed,
        brightness: Brightness.light,
      );

  ColorScheme get _darkColorScheme => ColorScheme.fromSeed(
        seedColor: colorSchemeSeed,
        brightness: Brightness.dark,
      );

  // ====================================================
  // Page Transition

  final _pageTransitionsTheme = const PageTransitionsTheme();

  // ====================================================
  // Text Button

  final _textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
    ),
  );

  // ====================================================
  // Theme Mode

  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode value) {
    _themeMode = value;
    notifyListeners();
  }

  // ====================================================
  // Theme & Dark Theme

  ThemeData get theme => ThemeData(
        useMaterial3: _useMaterial3,
        colorScheme: _lightColorScheme,
        fontFamily: null, //should be added in the future
        textButtonTheme: _textButtonTheme,
        pageTransitionsTheme: _pageTransitionsTheme,
      );

  ThemeData get darkTheme => ThemeData(
        useMaterial3: _useMaterial3,
        colorScheme: _darkColorScheme,
        fontFamily: null, //should be added in the future
        textButtonTheme: _textButtonTheme,
        pageTransitionsTheme: _pageTransitionsTheme,
      );
}
