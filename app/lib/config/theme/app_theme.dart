import 'package:flutter/material.dart';

const colorList = <Color>[
  Color(0xFF2F9BFF),
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
      : assert(selectedColor >= 0, 'El color seleccionado debe ser mayor a 0.'),
        assert(selectedColor < colorList.length,
            'El color seleccionado debe ser igual o menor a ${colorList.length - 1}.');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      primaryColor: colorList[selectedColor],
      colorScheme:
          ColorScheme.fromSwatch().copyWith(primary: colorList[selectedColor]),
      fontFamily: 'Jost',
      scaffoldBackgroundColor: colorList[selectedColor],
      appBarTheme: const AppBarTheme());

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode);
}
