import 'package:flutter/material.dart';

const primaryColor = Color(0xFF2F9BFF);
const primaryyColor = Color(0xFF4d3a87);

class AppTheme {
  final bool isDarkMode;

  AppTheme({this.isDarkMode = false});

  ThemeData getTheme() => ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      useMaterial3: true,
      colorScheme: getColorScheme(isDarkMode),
      fontFamily: 'Jost',
      scaffoldBackgroundColor:
          isDarkMode ? const Color.fromARGB(255, 23, 23, 24) : Colors.white,
      appBarTheme: const AppBarTheme());

  ColorScheme getColorScheme(bool isDarkMode) {
    if (isDarkMode) {
      return const ColorScheme.dark(
          primary: primaryyColor,
          secondary: Color.fromARGB(255, 45, 37, 69),
          onPrimary: Colors.white,
          onBackground: Colors.black,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          background: Colors.black);
    }
    return const ColorScheme.light(
        primary: primaryColor,
        secondary: Colors.white,
        onBackground: Colors.black,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: primaryColor,
        background: Colors.white);
  }

  AppTheme copyWith({bool? isDarkMode}) =>
      AppTheme(isDarkMode: isDarkMode ?? this.isDarkMode);
}
