import 'package:flutter/material.dart';
import 'package:money_controller/core/utils/dimension.dart';

class AppDecoration {

  static primary(Color backgroundColor) => boxDecorationRadius(DeviceDimension.padding, backgroundColor);

  static BoxDecoration boxDecorationRadius(double borderRadiusValue, Color colors) {
    return BoxDecoration(borderRadius: BorderRadius.circular(borderRadiusValue), color: colors);
  }
}