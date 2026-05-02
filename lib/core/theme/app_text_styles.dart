import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle h1 = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: 32 * -0.04,
    height: 1.1,
    color: AppColors.onBackground,
  );

  static TextStyle h2 = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: 24 * -0.03,
    height: 1.2,
    color: AppColors.onBackground,
  );

  static TextStyle h3 = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 20 * -0.02,
    height: 1.2,
    color: AppColors.onBackground,
  );

  static TextStyle bodyLg = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 16 * -0.01,
    height: 1.5,
    color: AppColors.onBackground,
  );

  static TextStyle bodyMd = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.5,
    color: AppColors.onBackground,
  );

  static TextStyle labelCaps = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 11 * 0.05,
    color: AppColors.onBackground,
  );

  static TextStyle statValue = GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: 28 * -0.02,
    height: 1.0,
    color: AppColors.onBackground,
  );

  static TextStyle monoKey = GoogleFonts.sourceCodePro(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.onBackground,
  );
}
