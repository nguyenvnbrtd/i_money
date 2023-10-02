import 'dart:ui';

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
    final moneySize = DeviceDimension.screenWidth * 0.3;

    return Container(
      padding: EdgeInsets.all(DeviceDimension.padding / 2),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DeviceDimension.padding),
        color: Colors.white,
        border: Border.all(color: item.type.mainColor, width: 2),
        boxShadow: [AppShadowBox.shadowLight]
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(item.title, style: AppTextStyles.titleMediumW700.copyWith(color: item.type.titleColor))),
              SpaceHorizontal(width: DeviceDimension.padding),
              Container(
                constraints: BoxConstraints(maxWidth: DeviceDimension.screenWidth * 0.5),
                padding: EdgeInsets.symmetric(horizontal: DeviceDimension.padding / 2, vertical: DeviceDimension.padding / 5),
                decoration: BoxDecoration(color: item.type.mainColor.lighter, borderRadius: BorderRadius.circular(DeviceDimension.padding)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(item.type.icon, color: Colors.white),
                    Container(constraints: BoxConstraints(maxWidth: moneySize),child: Text('${UtilsHelper.formatMoney(item.money.toDouble())} đ', style: AppTextStyles.titleMediumW700.copyWith(color: item.type.moneyColor), textAlign: TextAlign.end, overflow: TextOverflow.visible)),
                  ],
                ),
              ),
            ],
          ),
          SpaceVertical(height: DeviceDimension.padding / 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: Text(item.content, style: AppTextStyles.bodyMediumW400.copyWith(color: item.type.textColor))),
              SpaceHorizontal(width: DeviceDimension.padding),
              Text(UtilsHelper.timestampToDateString(item.time, formatTemplate: 'dd/MM/yyyy HH:mm'), style: AppTextStyles.bodyMediumW400.copyWith(color: item.type.textColor)),
            ],
          ),
        ],
      ),
    );
  }
}
