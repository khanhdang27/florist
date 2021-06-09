import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String format({String pattern = 'dd/MM/yyyy'}) {
    return DateFormat(pattern).format(this);
  }
}