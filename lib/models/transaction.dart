import 'package:money_controller/base/models/base_model.dart';
import 'package:money_controller/core/utils/utils_helper.dart';
import 'package:money_controller/extension/date_time_extension.dart';
import 'package:money_controller/models/constant_values/transaction_type.dart';

class Transaction extends BaseModel<Transaction> {
  String? _title;
  String? _content;
  int? _money;
  int? _time;
  TransactionType? _type;


  String get title => _title ?? '';

  set title(String value) {
    _title = value;
  }


  String get content => _content ?? '';

  set content(String value) {
    _content = value;
  }

  int get money => _money ?? 0;

  set money(int value) {
    _money = value;
  }

  int get time => _time ?? DateTime.now().timestamp;

  set time(int value) {
    _time = value;
  }

  TransactionType get type => _type ?? TransactionType.unknown;

  set type(TransactionType value) {
    _type = value;
  }

  Transaction({String? id}) : super(id: id);

  Transaction.fromJson(dynamic json) {
    id = UtilsHelper.getJsonValue(json, ['id']);
    title = UtilsHelper.getJsonValue(json, ['title']);
    content = UtilsHelper.getJsonValue(json, ['content']);
    money = UtilsHelper.getJsonValue(json, ['money']);
    time = UtilsHelper.getJsonValue(json, ['time']);
    type = TransactionType.fromNumber(UtilsHelper.getJsonValue(json, ['type']));
  }

  @override
  Transaction copyWith({Transaction? data}) {
    return Transaction(id: data?.id ?? id);
  }

  @override
  Transaction fromJson(json) {
    return Transaction.fromJson(json);
  }

  @override
  Transaction init() {
    return Transaction();
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};

    map['id'] = id;
    map['title'] = title;
    map['content'] = content;
    map['money'] = money;
    map['time'] = time;
    map['type'] = type.typeNumber;

    return map;
  }

  @override
  List<Object?> get props => [id, title, content, time, money, type];
}
