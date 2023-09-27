import 'package:flutter/material.dart';
import 'package:money_controller/core/src/app_colors.dart';

class AppShadowBox {
  static BoxShadow boxShadowPrimary = boxShadow(AppColors.primaryText.withOpacity(0.8), 1, 4);
  static BoxShadow shadowLight = boxShadow(AppColors.black.withOpacity(0.3), 0, 3, const Offset(0, 2));
  static BoxShadow shadowSuperLight = boxShadow(AppColors.grey.withOpacity(0.2), -0.5, 0.5, const Offset(0, 1.5));

  static BoxShadow boxShadow(Color colors, double spreadRadius, double blurRadius, [Offset? offset = const Offset(0, 0)]) {
    return BoxShadow(color: colors, spreadRadius: spreadRadius, blurRadius: blurRadius, offset: offset!);
  }
}
