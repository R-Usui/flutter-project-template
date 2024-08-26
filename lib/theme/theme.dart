import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeNotifier() {
    // ====================================================
    // Text Button

    _textButtonTheme = TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 20,
          fontFamily: _fontFamily,
          fontFamilyFallback: _fontFamilyFallback,
        ),
      ),
    );

    // ====================================================
    // Text

    _textTheme = const TextTheme().apply(fontSizeFactor: 2.0);
  }

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
  // Font

  final String _fontFamily = "MPLUSRounded1c";

  final List<String> _fontFamilyFallback = ["Roboto"];

  // ====================================================
  // Text

  late TextTheme _textTheme;

  // ====================================================
  // Text Button

  late TextButtonThemeData _textButtonTheme;

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
        fontFamily: _fontFamily,
        fontFamilyFallback: _fontFamilyFallback,
        textTheme: _textTheme,
        textButtonTheme: _textButtonTheme,
        pageTransitionsTheme: _pageTransitionsTheme,
      );

  ThemeData get darkTheme => ThemeData(
        useMaterial3: _useMaterial3,
        colorScheme: _darkColorScheme,
        fontFamily: _fontFamily,
        fontFamilyFallback: _fontFamilyFallback,
        textTheme: _textTheme,
        textButtonTheme: _textButtonTheme,
        pageTransitionsTheme: _pageTransitionsTheme,
      );
}
