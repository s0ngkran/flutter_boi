import 'package:flutter/material.dart';

import '../utils/common.dart';

dialogConfirm(onTap) {
  const String name = 'สินค้า';
  C.dialog(
    // ignore: unnecessary_brace_in_string_interps
    title: 'กำลังลบ${name}',
    content: Column(
      children: const <Widget>[
        // ignore: unnecessary_brace_in_string_interps
        Text('คุณต้องการยืนยันที่จะลบ${name} ?'),
      ],
    ),
    actions: [
      C.buttonDel('ยืนยัน', onTap),
      C.buttonBackTemplate(),
    ],
  );
}
