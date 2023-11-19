import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData themeData({
    required bool isDarkTheme,
    required BuildContext context,
  }) {
    return isDarkTheme
        ? ThemeData() // DarkTheme
        : ThemeData();// LightThem
  }
}
