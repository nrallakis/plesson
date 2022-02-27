import 'package:intl/intl.dart';

extension DateX on int {
  String toHourMinutesFormat() {
    return DateFormat(DateFormat.HOUR_MINUTE).format(DateTime.fromMillisecondsSinceEpoch(this));
  }
}