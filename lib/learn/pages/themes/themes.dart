
import 'package:flutter/material.dart';

class Themes{
  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey[900],
      hoverColor: Colors.grey[600],
      foregroundColor: Colors.white,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(),
    primarySwatch: Colors.teal,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.teal[900],
      hoverColor: Colors.teal[600],
      foregroundColor: Colors.white,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}