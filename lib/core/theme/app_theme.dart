import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color background = Color(0xFF0A0E1A);
  static const Color surface = Color(0xFF131826);
  static const Color surfaceContainerLow = Color(0xFF1A2234);
  static const Color surfaceContainer = Color(0xFF232B40);
  static const Color surfaceContainerHigh = Color(0xFF2D364D);
  static const Color surfaceContainerHighest = Color(0xFF374159);
  static const Color surfaceVariant = Color(0xFF444D66);
  static const Color surfaceDim = Color(0xFF0C111D);

  static const Color primary = Color(0xFF69DAFF);
  static const Color primaryContainer = Color(0xFF00CFFC);
  static const Color primaryDim = Color(0xFF4DB6D8);

  static const Color secondary = Color(0xFFFF6F7C);

  static const Color onSurface = Color(0xFFE2E4F6);
  static const Color onSurfaceVariant = Color(0xFFA7AABB);

  static const Color outlineVariant = Color(0xFF444756); // Ghost Border

  static const Color inverseSurface = Color(0xFFFAF8FF);
  static const Color inverseOnSurface = Color(0xFF515463);

  static const Color surfaceTint = Color(0xFF69DAFF);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        onPrimary: AppColors.background,
        primaryContainer: AppColors.primaryContainer,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        outlineVariant: AppColors.outlineVariant,
        inverseSurface: AppColors.inverseSurface,
        onInverseSurface: AppColors.inverseOnSurface,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.inter(
          fontSize: 92,
          fontWeight: FontWeight.w900,
          color: AppColors.onSurface,
          letterSpacing: -0.02 * 92,
        ),
        headlineLarge: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: AppColors.onSurface,
          letterSpacing: -0.02 * 32,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: AppColors.onSurfaceVariant,
          height: 1.6,
        ),
        labelMedium: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.secondary,
          letterSpacing: 0.1 * 16,
        ),
      ),
      tooltipTheme: const TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.inverseSurface,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        textStyle: TextStyle(color: AppColors.inverseOnSurface),
      ),
    );
  }
}
