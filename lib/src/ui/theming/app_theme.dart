import 'package:flutter/material.dart';

abstract class AppTheme {
  ColorScheme get colorScheme;

  TextTheme get textTheme;

  ThemeData get theme => ThemeData(
        colorScheme: colorScheme,
        textTheme: textTheme,
        useMaterial3: true,
      );
}
