import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared/utils/common.dart';
import '../../../home_ctl.dart';

dialogDelProduct(String productId) {
  HomeCtl ctl = Get.find();
  C.dialog(
    title: 'ลบสินค้านี้',
    content: const Text('คุณต้องการลบสินค้าชิ้นนี้ ?'),
    actions: [
      Column(
        children: [
          C.buttonDel('ยืนยัน', () async {
            SSS sta = await ctl.delProduct(productId, isActive: false);
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: C.buttonBack('กลับ', () {
              Get.back();
            }),
          ),
        ],
      )
    ],
  );
}
