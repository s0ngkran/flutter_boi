import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared/utils/common.dart';
import '../../../home_ctl.dart';

dialogCreateZone() {
  HomeCtl ctl = Get.find();
  ctl.zoneName.text = 'โซนใหม่';
  C.dialog(
    title: 'สร้างโซนใหม่',
    content: Form(
      key: ctl.keyFormZone,
      child: Column(
        children: <Widget>[
          C.inputForm(
            ctl.zoneName,
            labelText: 'ชื่อโซน',
            validator: (val) {
              return;
            },
          )
        ],
      ),
    ),
    actions: [
      C.button('ยืนยัน', () async {
        SSS sta = await ctl.createZone();
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
