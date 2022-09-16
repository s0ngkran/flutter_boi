import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/utils/common.dart';
import '../../../../shared/utils/validator.dart';
import '../../../../shared/widgets/photo_hero.dart';
import '../../home_ctl.dart';
import 'dialog/del_product_dialog.dart';

class ProductFormScr extends StatelessWidget {
  final HomeCtl ctl = Get.find<HomeCtl>();
  final String? productId;
  final String catId;
  final String? imageUrl;
  final bool isUpdateForm;
  ProductFormScr({
    Key? key,
    required this.isUpdateForm,
    required this.catId,
    this.productId,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() => buildObx(context)),
    );
  }

  Widget buildObx(BuildContext context) {
    return Scaffold(
      appBar: C.appBarSub(
        context,
        (isUpdateForm) ? 'แก้ไขสินค้า' : 'เพิ่มสินค้าใหม่',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            C.rowH(),
            Visibility(
              visible: false,
              child: Text(ctl.dummy.value),
            ),

            ///// example bar
            Hero(
              tag: 'bar ${productId ?? ''}',
              child: Column(
                children: [
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 110,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                MyImage(
                                  onTap: () async {
                                    XFile? file = await ctl.pickImage();
                                    if (file != null) {
                                      ctl.imageFile.value = file;
                                    }
                                  },
                                  imageFile: '${ctl.imageFile.value.path}',
                                  urlPhoto: '$imageUrl',
                                  width: 110,
                                ),
                                Positioned(
                                  right: 4,
                                  top: 4,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 13,
                                    child: Icon(
                                      FontAwesomeIcons.penToSquare,
                                      color: CC.black,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            C.rowW(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ctl.productDisp1_.value,
                                  style: const TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ctl.productName_.value,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(
                                      '${ctl.productDisp2_.value} ${ctl.productPrice_.value} บาท',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 91, 91, 91),
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),

            C.rowH(),

            /// form
            /// form
            /// form
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: ctl.keyFormProduct,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    C.inputForm(
                      ctl.productDisp1,
                      labelText: 'ข้อความ-โปรโมชัน',
                      onChanged: (val) {
                        ctl.productDisp1_.value = val;
                      },
                      validator: (val) {
                        if (GetUtils.isLengthGreaterOrEqual(val, 14))
                          return 'ยาวเกินไป';
                        return null;
                      },
                      padding: C.s,
                    ),
                    C.inputForm(
                      ctl.productName,
                      onChanged: (val) {
                        ctl.productName_.value = val;
                      },
                      labelText: 'ชื่อสินค้า',
                      validator: (val) {
                        if (GetUtils.isLengthGreaterOrEqual(val, 14))
                          return 'ยาวเกินไป';
                        return null;
                      },
                      padding: C.s,
                    ),
                    C.inputForm(
                      ctl.productDisp2,
                      onChanged: (val) {
                        ctl.productDisp2_.value = val;
                      },
                      labelText: 'รายละเอียดสินค้า',
                      validator: (val) {
                        if (GetUtils.isLengthGreaterOrEqual(val, 20))
                          return 'ยาวเกินไป';
                        return null;
                      },
                      padding: C.s,
                    ),
                    C.inputForm(
                      ctl.productPrice,
                      onChanged: (val) {
                        ctl.productPrice_.value = val;
                      },
                      labelText: 'ราคาขาย',
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (val) => V.numberValidator(val),
                      padding: C.s,
                    ),
                    C.inputForm(
                      ctl.productMargin,
                      onChanged: (val) {
                        ctl.productMargin_.value = val;
                      },
                      labelText: 'กำไร',
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (val) {
                        return;
                      },
                      padding: C.s,
                    ),
                  ],
                ),
              ),
            ),

            /// actions
            if (isUpdateForm == false)
              // create form
              Column(
                children: <Widget>[
                  C.button(
                    'เพิ่มสินค้า',
                    () async {
                      /// upload img
                      String? link = await ctl.uploadImage(ctl.imageFile.value);
                      link ??= '';
                      SSS sta = await ctl.createProduct(catId, link);
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
                  ),
                  C.buttonBackTemplate(),
                ],
              ),

            // update form
            if (isUpdateForm == true)
              Column(
                children: [
                  C.button(
                    'ยืนยันแก้ไข',
                    () async {
                      ctl.loading.value = true;

                      /// upload img
                      String? link = await ctl.uploadImage(ctl.imageFile.value);
                      link ??= ctl.imageUrl.value;
                      SSS sta = await ctl.updateProduct(productId!, link);
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
                      ctl.loading.value = false;
                    },
                    width: 300,
                    isLoading: ctl.loading.value,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: C.buttonDel(
                      'ลบ',
                      () {
                        Get.back();
                        dialogDelProduct(productId!);
                      },
                      width: 300,
                    ),
                  ),
                  C.buttonBack(
                    'กลับ',
                    () {
                      Get.back();
                    },
                    width: 300,
                  ),
                ],
              ),
            C.rowH(),
            C.rowH(),
            C.rowH(),
          ],
        ),
      ),
    );
  }

  Widget buttonSelectImage() {
    return C.button(
      'เลือกรูป',
      (ctl.loading.value == false)
          ? () async {
              XFile? file = await ctl.pickImage();
              if (file == null) {
                C.dialogErrorTemplate();
              }
            }
          : null,
    );
  }
}
