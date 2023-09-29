import 'package:flutter/material.dart';
import 'package:money_controller/core/src/app_text_styles.dart';
import 'package:money_controller/core/utils/dimension.dart';
import 'package:money_controller/models/constant_values/transaction_type.dart';
import 'package:money_controller/models/transaction.dart';
import 'package:money_controller/widgets/stateless/spacer.dart';

class Total extends StatelessWidget {
  const Total({super.key, required this.title, required this.type, required this.transactions, required this.total});

  final TransactionType type;
  final List<Transaction> transactions;
  final String title;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.all(DeviceDimension.padding),
      decoration: BoxDecoration(
        color: type.mainColor,
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(DeviceDimension.padding * 2),
      ),
      child: Column(
        children: [
          Text(title, style: AppTextStyles.titleMediumW700.copyWith(color: Colors.white)),
          SpaceVertical(height: DeviceDimension.padding / 2),
          Expanded(child: Text(total, style: AppTextStyles.titleMediumW700.copyWith(color: Colors.white))),
        ],
      ),
    );
  }
}
