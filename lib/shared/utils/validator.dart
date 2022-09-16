class V {
  static String? numberValidator(String? value) {
    if (value == null) {
      return null;
    }
    final n = num.tryParse(value);
    if (n == null) {
      return '"$value" ตัวเลขไม่ถูกต้อง';
    }
    return null;
  }
}
