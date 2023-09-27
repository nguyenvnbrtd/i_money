import 'package:flutter/material.dart';
import 'package:money_controller/core/utils/dimension.dart';
import 'package:money_controller/features/home/components/transaction_item.dart';
import 'package:money_controller/models/constant_values/transaction_type.dart';
import 'package:money_controller/models/transaction.dart';
import 'package:money_controller/widgets/base_screen/origin_screen.dart';
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
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: '2052505'),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: '2052505'),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.outcome, money: '2052505'),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: '2052505'),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.outcome, money: '2052505'),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: '2052505'),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.outcome, money: '2052505'),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: '2052505'),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.outcome, money: '2052505'),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: '2052505'),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.outcome, money: '2052505'),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: '2052505'),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.outcome, money: '2052505'),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: '2052505'),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.outcome, money: '2052505'),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: '2052505'),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.outcome, money: '2052505'),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: '2052505'),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.outcome, money: '2052505'),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.income, money: '2052505'),
      Transaction.now(title: 'tessas', content: 'nashsadj', type: TransactionType.outcome, money: '2052505'),
    ];

    return OriginScreen(
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
    );
  }
}
