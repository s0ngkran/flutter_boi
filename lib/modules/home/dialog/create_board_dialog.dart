import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/utils/common.dart';
import '../home_ctl.dart';

dialogCreateBoard() {
  HomeCtl ctl = Get.find();
  const String name = 'บอร์ด';
  // ignore: unnecessary_brace_in_string_interps
  ctl.titleTemplate.text = '${name}ใหม่';
  ctl.descriptionTemplate.text = 'รายละเอียด${name}';
  C.dialog(
    // ignore: unnecessary_brace_in_string_interps
    title: 'เพิ่ม${name}ใหม่',
    content: Form(
      key: ctl.keyFormTemplate,
      child: Column(
        children: <Widget>[
          C.inputForm(
            ctl.titleTemplate,
            // ignore: unnecessary_brace_in_string_interps
            labelText: 'ชื่อ${name}',
            validator: (val) {
              return;
            },
          ),
          C.rowH(),
          C.inputForm(
            ctl.descriptionTemplate,
            // ignore: unnecessary_brace_in_string_interps
            labelText: 'รายละเอียด${name}',
            validator: (val) {
              return;
            },
          )
        ],
      ),
    ),
    actions: [
      C.button('ยืนยัน', () async {
        SSS sta = await ctl.createBoard();
        switch (sta) {
          case SSS.success:
            // refresh
            await ctl.getBoards();
            Get.back();
            break;
          default:
            C.dialogErrorTemplate();
        }
      }),
      C.buttonBackTemplate(),
    ],
  );
}
