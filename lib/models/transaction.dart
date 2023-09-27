import 'package:money_controller/extension/date_time_extension.dart';
import 'package:money_controller/models/constant_values/transaction_type.dart';

class Transaction {
  final String title;
  final String content;
  final String money;
  final int time;
  final TransactionType type;

  const Transaction({required this.title, required this.content, required this.money, required this.time, required this.type});

  factory Transaction.now({required String title, required String content, required String money, required TransactionType type}) {
    return Transaction(title: title, content: content, money: money, type: type, time: DateTime.now().timestamp);
  }
}
