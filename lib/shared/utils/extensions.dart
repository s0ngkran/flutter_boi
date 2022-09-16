part of my_common;

extension MyDateTime on DateTime {
  String str(String? format) =>
      DateFormat(format ?? 'yyyy-MM-dd kk:mm').format(this);
  String format(String? format) =>
      DateFormat(format ?? 'yyyy-MM-dd kk:mm').format(this);
}

extension MyNumber on double {
  String get n => NumberFormat.decimalPattern().format(this);
}

extension MyString on String {
  String keep(int right) =>
      padRight(right).substring(0, right).replaceAll(' ', '');
}
