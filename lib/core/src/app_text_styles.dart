import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_controller/core/src/app_colors.dart';

/// Never be use
class AppTextStyles {
  //Default is weight 500
  static TextStyle bodySmall = textStyleManrope(AppColors.primaryText, 12);
  static TextStyle bodyMedium = textStyleManrope(AppColors.primaryText, 14);
  static TextStyle bodyLarge = textStyleManrope(AppColors.primaryText, 16);
  static TextStyle titleMedium = textStyleManrope(AppColors.primaryText, 18);
  static TextStyle titleLarge = textStyleManrope(AppColors.primaryText, 20);
  static TextStyle displaySmall = textStyleManrope(AppColors.primaryText, 28);
  static TextStyle displayLarge = textStyleManrope(AppColors.primaryText, 32);
  static TextStyle displaySuper = textStyleManrope(AppColors.primaryText, 42);

  static TextStyle bodySmallW400 = textStyleManrope(AppColors.primaryText, 12, FontWeight.w400);
  static TextStyle bodyMediumW400 = textStyleManrope(AppColors.primaryText, 14, FontWeight.w400);
  static TextStyle bodyLargeW400 = textStyleManrope(AppColors.primaryText, 16, FontWeight.w400);
  static TextStyle titleMediumW400 = textStyleManrope(AppColors.primaryText, 18, FontWeight.w400);
  static TextStyle titleLargeW400 = textStyleManrope(AppColors.primaryText, 20, FontWeight.w400);
  static TextStyle displaySmallW400 = textStyleManrope(AppColors.primaryText, 28, FontWeight.w400);
  static TextStyle displayLargeW400 = textStyleManrope(AppColors.primaryText, 32, FontWeight.w400);
  static TextStyle displaySuperW400 = textStyleManrope(AppColors.primaryText, 42, FontWeight.w400);

  static TextStyle bodySmallW600 = textStyleManrope(AppColors.primaryText, 12, FontWeight.w600);
  static TextStyle bodyMediumW600 = textStyleManrope(AppColors.primaryText, 14, FontWeight.w600);
  static TextStyle bodyLargeW600 = textStyleManrope(AppColors.primaryText, 16, FontWeight.w600);
  static TextStyle titleMediumW600 = textStyleManrope(AppColors.primaryText, 18, FontWeight.w600);
  static TextStyle titleLargeW600 = textStyleManrope(AppColors.primaryText, 20, FontWeight.w600);
  static TextStyle displaySmallW600 = textStyleManrope(AppColors.primaryText, 28, FontWeight.w600);
  static TextStyle displayLargeW600 = textStyleManrope(AppColors.primaryText, 32, FontWeight.w600);
  static TextStyle displaySuperW600 = textStyleManrope(AppColors.primaryText, 42, FontWeight.w600);

  static TextStyle bodySmallW700 = textStyleManrope(AppColors.primaryText, 12, FontWeight.w700);
  static TextStyle bodyMediumW700 = textStyleManrope(AppColors.primaryText, 14, FontWeight.w700);
  static TextStyle bodyLargeW700 = textStyleManrope(AppColors.primaryText, 16, FontWeight.w700);
  static TextStyle titleMediumW700 = textStyleManrope(AppColors.primaryText, 18, FontWeight.w700);
  static TextStyle titleLargeW700 = textStyleManrope(AppColors.primaryText, 20, FontWeight.w700);
  static TextStyle displaySmallW700 = textStyleManrope(AppColors.primaryText, 28, FontWeight.w700);
  static TextStyle displayLargeW700 = textStyleManrope(AppColors.primaryText, 32, FontWeight.w700);
  static TextStyle displaySuperW700 = textStyleManrope(AppColors.primaryText, 42, FontWeight.w700);

  static TextStyle displaySearch = textStyleManrope(const Color(0xFFFDA758), 16, FontWeight.normal);

  static TextStyle textStyleManrope(Color color, double fontSize, [FontWeight fontWe = FontWeight.w500,FontStyle fontStyle = FontStyle
      .normal]) {
    return textStyle(color, fontSize, GoogleFonts.manrope().fontFamily, fontWe,fontStyle);
  }

  static TextStyle textStyleInter(Color color, double fontSize, [FontWeight fontWe = FontWeight.w500,FontStyle fontStyle = FontStyle
      .normal]) {
    return textStyle(color, fontSize, GoogleFonts.inter().fontFamily, fontWe,fontStyle);
  }

  static TextStyle textStyle(Color color, double fontSize, String? fontFamily, [FontWeight fontWe = FontWeight.w500,FontStyle fontStyle = FontStyle
      .normal]) {
    return TextStyle(fontFamily: fontFamily, color: color, fontSize: fontSize, fontWeight: fontWe,fontStyle: fontStyle);
  }
}
