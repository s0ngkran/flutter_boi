import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_boi/modules/home/contents/branch/dialog/sure_dialog.dart';

import '../../../../../shared/utils/common.dart';
import '../../../home_ctl.dart';

dialogUpdateTable(String id, String tableName) {
  HomeCtl ctl = Get.find();
  ctl.tableName.text = tableName;
  C.dialog(
    title: 'เปลี่ยนชื่อโต๊ะ',
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
        'ลบโต๊ะนี้',
        () async {
          Get.back();
          dialogSure(
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
