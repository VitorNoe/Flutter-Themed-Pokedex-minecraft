import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get pixelatedTheme {
    return ThemeData(
      primaryColor: Colors.green[700], // Dark Green
      hintColor: Colors.grey[700], // Dark gray for accent
      scaffoldBackgroundColor: Colors.grey[900], // Almost black background
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.green[900], // Very dark green
        foregroundColor: Colors.white, // White text
        titleTextStyle: TextStyle(
          fontFamily: 'Minecraftia', // Pixelated font (will need to be added)
          fontSize: 24,
          color: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Minecraftia',
          fontSize: 32,
          color: Colors.white,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Minecraftia',
          fontSize: 28,
          color: Colors.white,
        ),
        displaySmall: TextStyle(
          fontFamily: 'Minecraftia',
          fontSize: 24,
          color: Colors.white,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Minecraftia',
          fontSize: 20,
          color: Colors.white,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Minecraftia',
          fontSize: 18,
          color: Colors.white,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Minecraftia',
          fontSize: 16,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Minecraftia',
          fontSize: 14,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Minecraftia',
          fontSize: 12,
          color: Colors.white,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Minecraftia',
          fontSize: 14,
          color: Colors.white,
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.green[700], // Green buttons
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0), // Squared corners
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[700], // Button background color
          foregroundColor: Colors.white, // Button text color
          textStyle: TextStyle(
            fontFamily: 'Minecraftia',
            fontSize: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0), // Squared corners
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[800],
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.grey[400]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.0), // Squared corners
          borderSide: BorderSide(color: Colors.green[700]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.0), // Squared corners
          borderSide: BorderSide(color: Colors.green[700]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.0), // Squared corners
          borderSide: BorderSide(color: Colors.green[400]!, width: 2),
        ),
      ),
      // Add more theme customizations as needed
    );
  }
}

