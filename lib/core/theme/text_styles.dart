import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

abstract final class AppTextStyles {
  static TextStyle dmSans({
    double weight = 400,
    double fontSize = 14,
    Color color = AppColors.textPrimary,
    double height = 1.25,
    double letterSpacing = 0,
  }) => GoogleFonts.dmSans(
    fontWeight: _toFontWeight(weight),
    fontSize: fontSize,
    color: color,
    height: height,
    letterSpacing: letterSpacing,
  );

  static TextStyle barlowCondensed({
    double weight = 700,
    double fontSize = 16,
    Color color = Colors.white,
    double height = 1.10,
    double letterSpacing = 0,
  }) => GoogleFonts.barlowCondensed(
    fontWeight: _toFontWeight(weight),
    fontSize: fontSize,
    color: color,
    height: height,
    letterSpacing: letterSpacing,
  );

  static FontWeight _toFontWeight(double weight) {
    if (weight >= 900) return FontWeight.w900;
    if (weight >= 800) return FontWeight.w800;
    if (weight >= 700) return FontWeight.w700;
    if (weight >= 600) return FontWeight.w600;
    if (weight >= 500) return FontWeight.w500;
    if (weight >= 400) return FontWeight.w400;
    if (weight >= 300) return FontWeight.w300;
    return FontWeight.w400;
  }

  static TextStyle get priceValue => barlowCondensed(weight: 700, fontSize: 40);

  static TextStyle get priceSymbol =>
      barlowCondensed(weight: 800, fontSize: 28);

  static TextStyle get companyName => dmSans(weight: 550, fontSize: 16);

  static TextStyle get pageTitleDMSans => GoogleFonts.dmSans(
    textStyle: const TextStyle(fontVariations: [FontVariation('wght', 450)]),
    fontSize: 14,
    color: AppColors.textPrimary.withValues(alpha: 0.72),
    height: 1.25,
    letterSpacing: 0,
  );

  static TextStyle get annualReturnLabel => GoogleFonts.dmSans(
    textStyle: const TextStyle(fontVariations: [FontVariation('wght', 450)]),
    fontSize: 14,
    color: AppColors.textSecondary,
    height: 1.25,
    letterSpacing: 0,
  );

  static TextStyle get annualReturnLarge =>
      barlowCondensed(weight: 700, fontSize: 28);

  static TextStyle get annualReturnSup =>
      barlowCondensed(weight: 900, fontSize: 14);

  static const TextStyle avgVolLabel = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle get avgVolValue => GoogleFonts.dmSans(
    textStyle: const TextStyle(fontVariations: [FontVariation('wght', 550)]),
    fontSize: 14,
    color: AppColors.textPrimary,
    height: 1.25,
    letterSpacing: 0,
  );

  static TextStyle get metricLabel => GoogleFonts.dmSans(
    textStyle: const TextStyle(fontVariations: [FontVariation('wght', 450)]),
    fontSize: 14,
    color: AppColors.textSecondary,
    height: 1.25,
    letterSpacing: 0,
  );

  static TextStyle get metricValue => GoogleFonts.dmSans(
    textStyle: const TextStyle(fontVariations: [FontVariation('wght', 550)]),
    fontSize: 14,
    color: AppColors.textPrimary,
    height: 1.25,
    letterSpacing: 0,
  );

  static TextStyle get autoInvestTitle =>
      barlowCondensed(weight: 700, fontSize: 22);

  static const TextStyle tabInactive = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    letterSpacing: 0.1,
  );
}
