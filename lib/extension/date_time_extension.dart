import 'dart:core';

extension DateFormats on DateTime{
  int get timestamp =>  (millisecondsSinceEpoch / 1000).round();
}