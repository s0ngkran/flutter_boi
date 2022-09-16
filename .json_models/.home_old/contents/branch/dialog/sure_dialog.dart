import 'package:flutter/material.dart';

import '../../../../../shared/utils/common.dart';

dialogSure(onTap) {
  C.dialog(
      title: 'กำลังลบ',
      content: Column(
        children: const <Widget>[
          Text('คุณต้องการยืนยันที่จะลบ ?'),
        ],
      ),
      actions: [
        C.buttonDel('ยืนยัน', onTap),
        C.buttonBackTemplate(),
      ]);
}
