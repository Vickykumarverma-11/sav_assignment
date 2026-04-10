import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color primary = Color(0xFF166534);
  static const Color primaryMedium = Color(0xFF16A34A);

  static const Color greenDark = Color(0xFF1F3822);
  static const Color greenDeep = Color(0xFF295139);
  static const Color greenMid = Color(0xFF437A61);
  static const Color greenLight = Color(0xFF5B9A74);

  static const Color background = Color(0xFFF0F4F2);
  static const Color cardSurface = Color(0xFFFFFFFF);
  static const Color cardGraphArea = Color(0xFFF8FAF9);
  static const Color cardBack = Color(0xFFE8ECEB);
  static const Color badgeBackground = Color(0xFFF2F8F5);
  static const Color buttonSurfaceTop = Color(0xFFFAFAFA);
  static const Color buttonSurfaceBottom = Color(0xFFF0F0F0);

  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textDark = Color(0xFF1F1F1F);

  static const Color divider = Color(0xFFE2E8F0);
  static const Color cardBackBorder = Color(0xFFDDE1E0);
  static const Color iconBorder = Color(0xFFE2E4E3);
  static const Color dividerFaded = Color(0xFFCDD0D5);
  static const Color dotGrid = Color(0xFFCBD5C9);

  static const Color chartBarLight = Color(0xFF8BBF9F);
  static const Color chartBarDark = Color(0xFF2D6B4A);

  static const Color autoInvestDark = Color(0xFF2C2354);
  static const Color autoInvestPrimary = Color(0xFF6447A8);
  static const Color autoInvestMid = Color(0xFF7863BA);
  static const Color autoInvestLight = Color(0xFFB8AEE8);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1F3822), Color(0xFF437A61), Color(0xFF5B9A74)],
    stops: [0.20, 0.80, 1.0],
  );

  static const LinearGradient graphGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF5B9A74), Color(0xFF437A61), Color(0xFF295139)],
    stops: [0.0163, 0.518, 1.0],
  );

  static const LinearGradient borderGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x2E1F1F1F), Color(0x0A1F1F1F)],
  );

  static const LinearGradient cardBorderGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x1F1F1F1F), Color(0x051F1F1F)],
  );
}
