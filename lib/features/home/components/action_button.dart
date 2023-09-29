import 'package:flutter/material.dart';
import 'package:money_controller/core/src/app_colors.dart';
import 'package:money_controller/core/src/app_text_styles.dart';
import 'package:money_controller/core/utils/dimension.dart';
import 'package:money_controller/widgets/stateless/base_tap_widget.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BaseTapWidget(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: DeviceDimension.padding, vertical: DeviceDimension.padding / 2),
        constraints: BoxConstraints(minWidth: DeviceDimension.verticalSize(150)),
        decoration: BoxDecoration(
          color: AppColors.blue300,
          borderRadius: BorderRadius.circular(DeviceDimension.padding)
        ),
        alignment: Alignment.center,
        child: Text(label, style: AppTextStyles.titleMediumW700.copyWith(color: Colors.white)),
      ),
    );
  }
}
