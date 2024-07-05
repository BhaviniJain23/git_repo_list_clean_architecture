import 'package:flutter/material.dart';

abstract class AppTheme {
  static final theme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      useMaterial3: false,
      appBarTheme: const AppBarTheme(color: Colors.black, elevation: 0));
}
