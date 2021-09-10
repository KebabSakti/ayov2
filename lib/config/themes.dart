import 'package:flutter/material.dart';

class Themes {
  final light = ThemeData(
    fontFamily: 'Montserrat',
    brightness: Brightness.light,
    primarySwatch: Colors.green,
    primaryColor: Colors.green,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    dividerColor: Colors.grey[100],
    hintColor: Colors.grey[400],
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      hintStyle: TextStyle(fontSize: 12),
    ),
    chipTheme: ChipThemeData.fromDefaults(
      primaryColor: Colors.grey[600],
      secondaryColor: Colors.green,
      labelStyle: TextStyle(fontSize: 12),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: Colors.grey[100],
      primary: Colors.red,
      primaryVariant: Colors.amber,
      secondary: Colors.white,
      secondaryVariant: Colors.grey[100],
      onSecondary: Colors.grey[400],
    ),
  );
}
