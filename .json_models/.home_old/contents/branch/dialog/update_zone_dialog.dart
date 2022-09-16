import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_boi/modules/home/contents/branch/dialog/sure_dialog.dart';

import '../../../../../shared/utils/common.dart';
import '../../../home_ctl.dart';

dialogUpdateZone(String zoneId, String zoneName) {
  HomeCtl ctl = Get.find();
  ctl.zoneName.text = zoneName;
  C.dialog(
    title: 'เปลี่ยนชื่อโซน',
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
      ///
      C.button('ยืนยัน', () async {
        SSS sta = await ctl.updateZone(zoneId);
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
        'ลบโซนนี้',
        () async {
          Get.back();
          dialogSure(
            () async {
              SSS sta = await ctl.delZone(zoneId);
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
