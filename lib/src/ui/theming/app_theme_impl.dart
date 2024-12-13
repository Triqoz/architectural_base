import 'package:flutter/material.dart';

import 'app_theme.dart';

/// Concrete implementation of [AppTheme].
class AppThemeImpl extends AppTheme {
  @override
  ColorScheme get colorScheme => ColorScheme.fromSeed(
        seedColor: const Color(0xFF000000),
      );

  @override
  TextTheme get textTheme => TextTheme(
        bodyMedium: TextStyle(
          color: colorScheme.primary,
        ),
      );

  /// Constructs a new [AppThemeImpl].
  AppThemeImpl();
}
