import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFFC107); // Amarillo dorado
  static const Color accent = Color(0xFFFFA000); // Amarillo oscuro (botones)
  static const Color lightYellow = Color(0xFFFFECB3); // Fondo hero
  static const Color darkBrown = Color(0xFF795548); // Footer
  static const Color textPrimary = Colors.black87;
  static const Color textLight = Colors.white;
}

class AppTextStyles {
  //Hero Section
  static const TextStyle headline = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(221, 255, 255, 255),
  );

  static const TextStyle subhead = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(221, 255, 255, 255),
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static const TextStyle whiteHeadline = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textLight,
  );

  static const TextStyle whiteBody = TextStyle(
    fontSize: 16,
    color: AppColors.textLight,
  );
  static TextStyle get logo => const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 1.2,
  );

  static TextStyle get navItem => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.8,
  );

  //info card
  static const TextStyle textcard = TextStyle(
    fontSize: 25,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle descard = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );
  static const TextStyle titlecard = TextStyle(
    fontSize: 18,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.bold,
  );
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}
