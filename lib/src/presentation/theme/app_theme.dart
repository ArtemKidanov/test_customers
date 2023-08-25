import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get getAppTheme => ThemeData(
        textTheme: _getTextTheme,
      );

  TextTheme get _getTextTheme => const TextTheme(
        bodyMedium: TextStyle(
          fontSize: 20,
        ),
      );
}
