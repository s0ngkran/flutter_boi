import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/common.dart';
import 'dialog_confirm_delete.dart';

dialogUpdateTable(String id, String oldTitle) {
  var ctl = Get.find();
  const String name = 'โต๊ะ';
  ctl.tableName.text = oldTitle;
  C.dialog(
    title: 'แก้ไข $name',
    content: Form(
      key: ctl.keyFormTable,
      child: Column(
        children: <Widget>[
          C.inputForm(
            ctl.tableName,
            labelText: 'ชื่อ$name',
            validator: (val) {
              return;
            },
          )
        ],
      ),
    ),
    actions: [
      ///
      C.button('ยืนยัน', () async {
        SSS sta = await ctl.updateTable(id);
        switch (sta) {
          case SSS.success:
            String id = ctl.branch.value.id!;
            await ctl.fetchBranchs();
            await ctl.setBranch(id);
            Get.back();
            break;
          default:
            C.dialogErrorTemplate();
        }
      }),

      ///
      C.buttonDel(
        // ignore: unnecessary_brace_in_string_interps
        'ลบ${name}นี้',
        () async {
          Get.back();
          dialogConfirm(
            () async {
              SSS sta = await ctl.delTable(id);
              switch (sta) {
                case SSS.success:
                  String id = ctl.branch.value.id!;
                  await ctl.fetchBranchs();
                  await ctl.setBranch(id);
                  Get.back();
                  break;
                default:
                  C.dialogErrorTemplate();
              }
            },
          );
        },
      ),

      ///
      C.buttonBackTemplate(),
    ],
  );
}
