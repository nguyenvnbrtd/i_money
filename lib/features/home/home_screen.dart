import 'package:flutter/material.dart';
import 'package:money_controller/core/src/app_colors.dart';
import 'package:money_controller/core/src/app_text_styles.dart';
import 'package:money_controller/core/utils/dimension.dart';
import 'package:money_controller/core/utils/utils_helper.dart';
import 'package:money_controller/extension/color_extension.dart';
import 'package:money_controller/features/home/components/total.dart';
import 'package:money_controller/features/home/components/transaction_item.dart';
import 'package:money_controller/models/constant_values/transaction_type.dart';
import 'package:money_controller/models/transaction.dart';
import 'package:money_controller/widgets/base_screen/origin_screen.dart';
import 'package:money_controller/widgets/stateless/base_tap_widget.dart';
import 'package:money_controller/widgets/stateless/spacer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final items = <Transaction>[
      Transaction.now(title: 'tesaksjd klajsldkj alskdalksdlmas dasd assas', content: 'nashsadja sdas;d ;asm,d;a,sd;a,sd;s asd asdasd s', type: TransactionType.income, money: 213),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: 2052505),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.outcome, money: 2052505),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: 2052505),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.outcome, money: 2052505),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: 2052505),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.outcome, money: 2052505),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: 2052505),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.outcome, money: 2052505),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: 2052505),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.outcome, money: 2052505),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: 2052505),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.outcome, money: 2052505),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: 2052505),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.outcome, money: 2052505),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: 2052505),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.outcome, money: 2052505),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: 2052505),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.outcome, money: 2052505),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: 2052505),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.outcome, money: 2052505),
    ];

    return OriginScreen(
      backgroundColor: AppColors.white,
      child: Column(
        children: [
          Builder(builder: (context) {
            final income = '${UtilsHelper.formatMoney(_getTotal(TransactionType.income, items))} đ';
            final outcome = '${UtilsHelper.formatMoney(_getTotal(TransactionType.outcome, items))} đ';

            final inHeight = UtilsHelper.getTextHeight(text: income, textStyle: AppTextStyles.titleMediumW700, maxWidthOfWidget: DeviceDimension.screenWidth * 0.425);
            final outHeight = UtilsHelper.getTextHeight(text: outcome, textStyle: AppTextStyles.titleMediumW700, maxWidthOfWidget: DeviceDimension.screenWidth * 0.425);

            return Container(
              width: DeviceDimension.screenWidth,
              height: (inHeight > outHeight ? inHeight : outHeight) + DeviceDimension.padding * 4,
              margin: EdgeInsets.all(DeviceDimension.padding),
              child: Row(
                children: [
                  Expanded(child: Total(title: 'Income', type: TransactionType.income, transactions: items, total: income)),
                  SpaceHorizontal(width: DeviceDimension.padding),
                  Expanded(child: Total(title: 'Expenses', type: TransactionType.outcome, transactions: items, total: outcome)),
                ],
              ),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BaseTapWidget(
                onTap: () {
                  print('object');
                },
                child: Container(
                  color: AppColors.blue300,
                  height: 100,
                  width: 100,
                  child: Text('statistical'),
                ),
              ),
              BaseTapWidget(
                onTap: () {
                  print('object');
                },
                child: Container(
                  color: AppColors.blue300,
                  height: 100,
                  width: 100,
                  child: Text('add new'),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(DeviceDimension.padding),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return TransactionItem(item: items[index]);
              },
              separatorBuilder: (context, index) {
                return SpaceVertical(height: DeviceDimension.padding);
              },
            ),
          ),
        ],
      ),
    );
  }

  double _getTotal(TransactionType income, List<Transaction> items) {
    return items.where((element) => element.type == income).fold(0, (sum, item) => sum + item.money).toDouble();
  }
}