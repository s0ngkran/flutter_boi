import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared/utils/common.dart';
import '../../../home_ctl.dart';

dialogCreateTable(String zoneId) {
  HomeCtl ctl = Get.find();
  ctl.tableName.text = 'โต๊ะใหม่';
  C.dialog(
    title: 'เพิ่มโต๊ะใหม่',
    content: Form(
      key: ctl.keyFormTable,
      child: Column(
        children: <Widget>[
          C.inputForm(
            ctl.tableName,
            labelText: 'ชื่อโต๊ะ',
            validator: (val) {
              return;
            },
          )
        ],
      ),
    ),
    actions: [
      C.button('ยืนยัน', () async {
        SSS sta = await ctl.createTable(zoneId);
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
      C.buttonBackTemplate(),
    ],
  );
}
