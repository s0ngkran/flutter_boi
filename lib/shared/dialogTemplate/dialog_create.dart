import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/common.dart';

dialogCreate() {
  var ctl = Get.find();
  const String name = 'บริการ';
  // ignore: unnecessary_brace_in_string_interps
  ctl.serviceName.text = '${name}ใหม่';
  C.dialog(
    // ignore: unnecessary_brace_in_string_interps
    title: 'เพิ่ม${name}ใหม่',
    content: Form(
      key: ctl.keyFormService,
      child: Column(
        children: <Widget>[
          C.inputForm(
            ctl.serviceName,
            // ignore: unnecessary_brace_in_string_interps
            labelText: 'ชื่อ${name}',
            validator: (val) {
              return;
            },
          )
        ],
      ),
    ),
    actions: [
      C.button('ยืนยัน', () async {
        String branchId = ctl.branch.value.id!;
        SSS sta = await ctl.createService(branchId);
        switch (sta) {
          case SSS.success:
            await ctl.fetchBranchs();
            await ctl.setBranch(branchId);
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
