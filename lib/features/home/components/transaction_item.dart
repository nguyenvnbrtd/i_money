import 'package:flutter/material.dart';
import 'package:money_controller/core/src/app_box_shadow.dart';
import 'package:money_controller/core/src/app_text_styles.dart';
import 'package:money_controller/core/utils/dimension.dart';
import 'package:money_controller/core/utils/utils_helper.dart';
import 'package:money_controller/extension/color_extension.dart';
import 'package:money_controller/models/transaction.dart';
import 'package:money_controller/widgets/stateless/spacer.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key, required this.item});

  final Transaction item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(DeviceDimension.padding / 2),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DeviceDimension.padding),
        color: item.type.mainColor.lighter.lighter,
        boxShadow: [AppShadowBox.shadowLight],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(item.title, style: AppTextStyles.titleMediumW700.copyWith(color: item.type.titleColor))),
              const SpaceHorizontal(),
              Icon(item.type.icon, color: item.type.mainColor.darker),
              Text(item.money, style: AppTextStyles.titleMediumW700.copyWith(color: item.type.moneyColor), textAlign: TextAlign.end),
            ],
          ),
          SpaceVertical(height: DeviceDimension.padding / 2),
          Row(
            children: [
              Expanded(child: Text(item.content, style: AppTextStyles.bodyMediumW400.copyWith(color: item.type.textColor))),
              Text(UtilsHelper.timestampToDateString(item.time, formatTemplate: 'hh:mm a'), style: AppTextStyles.bodyMediumW400.copyWith(color: item.type.textColor)),
            ],
          ),
        ],
      ),
    );
  }
}
