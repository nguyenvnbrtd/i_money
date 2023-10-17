import 'package:flutter/material.dart';
import 'package:money_controller/core/src/app_colors.dart';

class TransactionType {
  final Color mainColor;
  final Color titleColor;
  final Color textColor;
  final Color moneyColor;
  final IconData icon;

  const TransactionType({required this.mainColor, required this.titleColor, required this.textColor, required this.moneyColor, required this.icon});

  static const income = TransactionType(mainColor: AppColors.green, titleColor: AppColors.greyBlueDark, textColor: AppColors.grey, moneyColor: AppColors.white, icon: Icons.add);
  static const outcome = TransactionType(mainColor: AppColors.red, titleColor: AppColors.greyBlueDark, textColor: AppColors.grey, moneyColor: AppColors.white, icon: Icons.remove);
  static const unknown = TransactionType(mainColor: AppColors.grey700, titleColor: AppColors.greyBlueDark, textColor: AppColors.white, moneyColor: AppColors.white, icon: Icons.info);

  static TransactionType fromNumber(int? value){
    switch (value) {
      case 0:
        return income;
      case 1:
        return outcome;
      default:
        return unknown;
    }
  }

  int get typeNumber {
    switch (this) {
      case income:
        return 1;
      case outcome:
        return 2;
      default:
        return 0;
    }
  }
}
