import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared/utils/common.dart';
import '../../../home_ctl.dart';

dialogCreateService() {
  HomeCtl ctl = Get.find();
  ctl.serviceName.text = 'บริการใหม่';
  C.dialog(
    title: 'เพิ่มบริการใหม่',
    content: Form(
      key: ctl.keyFormService,
      child: Column(
        children: <Widget>[
          C.inputForm(
            ctl.serviceName,
            labelText: 'ชื่อบริการ',
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
