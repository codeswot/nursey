import 'package:nursey/configs/configs.dart';

class DateFormats {
  static DateFormat ddMMMyyyy = DateFormat('dd MMM yyyy');
  static DateFormat dddDdMMM = DateFormat('E dd MMM');
  static DateFormat mmm = DateFormat('MMM');
}

class TimeFormats {
  static DateFormat hHmmss = DateFormat('HH:mm:ss');
  static DateFormat hhmmssaaa = DateFormat('hh:mm:ss aaa');
}

class DateTimeFormats {
  static DateFormat dddDdMMMHHmm = DateFormat('E dd MMM on HH:mm');
}

class NumberFormats {
  static NumberFormat format_00 = NumberFormat('00');
  static NumberFormat format_0000 = NumberFormat('0000');
  static NumberFormat money = NumberFormat('\$#,###,##0.00');
  static NumberFormat percentage = NumberFormat('#,###,##0.00%');
}
