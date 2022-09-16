import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_boi/modules/home/contents/branch/dialog/sure_dialog.dart';

import '../../../../../shared/utils/common.dart';
import '../../../home_ctl.dart';

dialogUpdateService(String id, String name) {
  HomeCtl ctl = Get.find();
  ctl.serviceName.text = name;
  C.dialog(
    title: 'เปลี่ยนชื่อบริการ',
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
      ///
      C.button('ยืนยัน', () async {
        SSS sta = await ctl.updateService(id);
        switch (sta) {
          case SSS.success:
            String branchId = ctl.branch.value.id!;
            await ctl.fetchBranchs();
            await ctl.setBranch(branchId);
            Get.back();
            break;
          default:
            C.dialogErrorTemplate();
        }
      }),

      ///
      C.buttonDel(
        'ลบบริการนี้',
        () async {
          Get.back();
          dialogSure(
            () async {
              SSS sta = await ctl.delService(id);
              switch (sta) {
                case SSS.success:
                  String branchId = ctl.branch.value.id!;
                  await ctl.fetchBranchs();
                  await ctl.setBranch(branchId);
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
