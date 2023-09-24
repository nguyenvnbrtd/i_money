import 'package:encrypt/encrypt.dart';

class Constants {
  Constants._();

  /// AES key
  static final AES_KEY = Key.fromUtf8('Md5Pz94WwlVdF0vHMaqd3IAfKEjnIdfz');
  static final AES_INITIALIZATION_VECTOR = IV.fromUtf8('484E6248C68E8283');

  static const DATE_TIME_FORMAT = 'dd-MM-yyyy HH:mm:ss';
  static const DATE_FORMAT = 'dd-MM-yyyy';
  static const TIME_FORMAT = 'HH:mm:ss';
  static const HOUR_MINUTES_FORMAT = 'HH:mm';

  /// firebase key

  /// seats
  /// List<String>.generate(24, (index) => '');
  static const defaultSeats = [
    '', '', '', '',
    '', '', '', '',
    '', '', '', '',
    '', '', '', '',
    '', '', '', '',
    '', '', '', '',
  ];
}
