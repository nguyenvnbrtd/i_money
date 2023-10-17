import 'package:money_controller/base/models/base_repository.dart';
import 'package:money_controller/models/transaction.dart';

class TransactionRepository extends BaseRepository<Transaction> {
  static const String collectionName = 'Transactions';

  TransactionRepository() : super(collectionName, Transaction());

  @override
  int sort(Transaction a, Transaction b) {
    return (a.time ?? 0).compareTo(b.time ?? 0);
  }
}
