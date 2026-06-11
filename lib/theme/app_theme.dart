import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryGold = Color(0xFFD4AF37);
  static const Color secondaryRed = Color(0xFF8B0000);
  static const Color surfaceCream = Color(0xFFFFFDD0);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryGold,
        primary: primaryGold,
        secondary: secondaryRed,
        surface: surfaceCream,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: primaryGold,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: secondaryRed,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      // FIX: Define TextTheme manually instead of using .mountainsOfChristmasTextTheme()
      textTheme: TextTheme(
        headlineMedium: GoogleFonts.mountainsOfChristmas(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
        bodyLarge: GoogleFonts.lato(fontSize: 20, fontStyle: FontStyle.italic),
        // You can add other styles here as needed, e.g.:
        bodyMedium: GoogleFonts.lato(),
      ),
    );
  }
}
