import 'package:flutter/material.dart';

ThemeData _themeFactory({bool isDark = false}) => ThemeData(
      colorSchemeSeed: Colors.green,
      useMaterial3: false,
      brightness: isDark ? Brightness.dark : Brightness.light,
    );

final lightTheme = _themeFactory();
final darkTheme = _themeFactory(isDark: true);
