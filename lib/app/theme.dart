import 'package:flutter/material.dart';

ThemeData _themeFactory({bool isDark = false}) {
  var theme = isDark ? ThemeData.dark() : ThemeData.light();
  const primaryColor = Color(0xffff525d);
  const onPrimaryColor = Colors.white;
  const secondaryColor = Color(0xff4760e9);
  final backgroundColor = isDark ? Colors.black : Colors.white;
  final onBackgroundColor = isDark ? Colors.white : Colors.black;
  theme = theme.copyWith(
    colorScheme: ColorScheme(
      primary: primaryColor,
      secondary: secondaryColor,
      onPrimary: onPrimaryColor,
      onError: onBackgroundColor,
      error: backgroundColor,
      onBackground: onBackgroundColor,
      background: backgroundColor,
      onSurface: onBackgroundColor,
      onSecondary: secondaryColor,
      brightness: isDark ? Brightness.dark : Brightness.light,
      surface: backgroundColor,
    ),
    indicatorColor: secondaryColor,
  );

  theme = theme.copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    toggleableActiveColor: theme.colorScheme.secondary,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: theme.textTheme.headline5
          ?.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
      iconTheme: IconThemeData(color: theme.colorScheme.onBackground),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: theme.colorScheme.onSurface,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.all(8),
      isDense: true,
      border: InputBorder.none,
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(),
    textButtonTheme: const TextButtonThemeData(),
  );

  return theme;
}

final lightTheme = _themeFactory();
final darkTheme = _themeFactory(isDark: true);
