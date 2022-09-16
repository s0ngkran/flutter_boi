import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_boi/modules/home/contents/branch/product_form_scr.dart';

import '../../../../generated_model/branchs_res/branch.dart';
import '../../../../shared/constants/colors.dart';
import '../../../../shared/utils/common.dart';
import '../../../../shared/widgets/photo_hero.dart';
import '../../home_ctl.dart';

class CategoryScr extends StatelessWidget {
  final HomeCtl ctl = Get.find<HomeCtl>();
  var keyListView = GlobalKey();
  CategoryScr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() => buildObx(context)),
    );
  }

  Widget buildObx(BuildContext context) {
    var branch = ctl.branch.value;
    var categories = branch.categorySet;
    return Scaffold(
      appBar: C.appBarSub(
        context,
        '${branch.name}',
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      C.rowH(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Hero(

                              tag: 'all products',
                              child: C.textH6('  สินค้าทั้งหมด'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              ctl.orderEditing.value = !ctl.orderEditing.value;
                            },
                            child: Card(
                              color: (ctl.orderEditing.value) ? CC.aColor : CC.iColor,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('แก้ไขลำดับ'),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 70,
                        child: ListView(
                          key: keyListView,
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            const SizedBox(width: 16),
                            ...(categories ?? []).map(
                              (e) => Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InkWell(
                                  child: Card(
                                    color: (ctl.selectedCategoryId.value == e.id && !ctl.orderEditing.value) ? CC.foregroundColor0 : CC.backgroundColor,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                        ),
                                        child: Row(
                                          children: [
                                            if (ctl.orderEditing.value)
                                              InkWell(
                                                onTap: () {
                                                  ctl.categoryOrderUp();
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    FontAwesomeIcons.chevronLeft,
                                                    color: CC.foregroundColor1,
                                                  ),
                                                ),
                                              ),
                                            Text(e.name ?? '',
                                                style: TextStyle(
                                                  color: (ctl.selectedCategoryId.value == e.id && !ctl.orderEditing.value) ? Colors.white : CC.foregroundColor2,
                                                )),
                                            if (ctl.orderEditing.value)
                                              InkWell(
                                                onTap: () {
                                                  ctl.categoryOrderDown();
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    FontAwesomeIcons.chevronRight,
                                                    color: CC.foregroundColor1,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: (ctl.orderEditing.value)
                                      ? null
                                      : () {
                                          ctl.selectedCategoryId.value = e.id ?? '';
                                        },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: C.buttonAdd(() {
                                ctl.categoryName.text = 'หมวดหมู่ใหม่';
                                C.dialog(
                                  title: 'เพิ่มหมวดหมู่ใหม่',
                                  content: Form(
                                    key: ctl.keyFormCreateCategory,
                                    child: Column(
                                      children: <Widget>[
                                        C.inputForm(
                                          ctl.categoryName,
                                          labelText: 'ชื่อหมวดหมู่',
                                          validator: (val) {
                                            return;
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    C.button('เพิ่ม', () async {
                                      SSS status = await ctl.createCategory(branch.id!);
                                      switch (status) {
                                        case SSS.success:
                                          await ctl.fetchBranchs();
                                          await ctl.setBranch(branch.id!);

                                          /// focus on current new category
                                          ctl.selectedCategoryId.value = ctl.outputId.value;
                                          Get.back();
                                          break;

                                        default:
                                          C.dialogError('ไม่สำเร็จ');
                                      }
                                      // ctl.setBranch(branch.id!);
                                    }),
                                    C.buttonBackTemplate(),
                                  ],
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: CC.grey1,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              C.rowH(),
                              ...(categories ?? []).map(
                                (cat) => Visibility(
                                  visible: cat.id == ctl.selectedCategoryId.value,
                                  child: Column(
                                    children: [
                                      /// rename

                                      C.button(
                                        'เปลี่ยนชื่อ หมวดหมู่',
                                        () {
                                          ctl.categoryNameRename.text = '${cat.name}';
                                          C.dialog(
                                              title: 'เปลี่ยนชื่อ หมวดหมู่',
                                              content: Form(
                                                key: ctl.keyFormRenameCategory,
                                                child: Column(
                                                  children: <Widget>[
                                                    C.inputForm(
                                                      ctl.categoryNameRename,
                                                      labelText: 'ชื่อหมวดหมู่',
                                                      validator: (val) {
                                                        return;
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                C.button(
                                                  'ยืนยัน',
                                                  () async {
                                                    SSS status = await ctl.renameCategory(cat.id!);
                                                    switch (status) {
                                                      case SSS.success:
                                                        await ctl.fetchBranchs();
                                                        await ctl.setBranch(branch.id!);
                                                        ctl.categoryNameRename.text = '';
                                                        Get.back();
                                                        break;
                                                      default:
                                                        C.dialogError('เปลี่ยนชื่อไม่สำเร็จ');
                                                    }
                                                  },
                                                ),
                                                C.buttonBack('กลับ', () {
                                                  Get.back();
                                                })
                                              ]);
                                        },
                                        width: 300,
                                        color: CC.grey2,
                                      ),
                                      C.rowH(),
                                      C.buttonDel(
                                        'ลบหมวดหมู่นี้',
                                        () async {
                                          C.dialog(
                                            title: 'ลบหมวดหมู่',
                                            content: Column(
                                              children: <Widget>[
                                                Text('คุณต้องการลบหมวดหมู่ ${cat.name}'),
                                              ],
                                            ),
                                            actions: [
                                              C.buttonDel('ยืนยัน', () async {
                                                cat.productSet = [];
                                                SSS sta = await ctl.deleteCategory(cat.id!);
                                                switch (sta) {
                                                  case SSS.success:
                                                    await ctl.fetchBranchs();
                                                    await ctl.setBranch(branch.id!);
                                                    await ctl.setFirstCategoryId();
                                                    Get.back();
                                                    break;
                                                  default:
                                                    C.dialogError('ไม่สำเร็จ');
                                                }
                                              }),
                                              C.rowH(),
                                              C.buttonBackTemplate(),
                                            ],
                                          );
                                        },
                                        width: 300,
                                      ),
                                      //// products
                                      //// products
                                      //// products
                                      //// products

                                      if (ctl.selectedCategoryId.value != '')
                                        ...(cat.productSet ?? []).map(
                                          (prod) {
                                            return Hero(
                                              tag: 'bar ${prod.id}',
                                              child: Column(
                                                children: [
                                                  InkWell(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: SizedBox(
                                                        height: 110,
                                                        child: Row(
                                                          children: [
                                                            MyImage(
                                                              urlPhoto: prod.imageUrl ?? '',
                                                              onTap: null,
                                                              width: 110,
                                                              imageFile: '',
                                                            ),
                                                            C.rowW(),
                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  '${prod.displayLine1}',
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
                                                                      '${prod.name}',
                                                                      overflow: TextOverflow.ellipsis,
                                                                      style: TextStyle(
                                                                        color: Color.fromARGB(255, 0, 0, 0),
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 24,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      '${prod.displayLine2} ${prod.price} บาท',
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
                                                    onTap: () {
                                                      //// to update form
                                                      //// to update form
                                                      //// to update form
                                                      ctl.orderNum.value = 1;
                                                      ctl.productName.text = prod.name ?? '';
                                                      ctl.productDisp1.text = prod.displayLine1 ?? '-';
                                                      ctl.productDisp2.text = prod.displayLine2 ?? '-';
                                                      ctl.productPrice.text = prod.price.toString();
                                                      ctl.productMargin.text = prod.margin.toString();
                                                      ctl.productName_.value = prod.name ?? '';
                                                      ctl.productDisp1_.value = prod.displayLine1 ?? '-';
                                                      ctl.productDisp2_.value = prod.displayLine2 ?? '-';
                                                      ctl.productPrice_.value = prod.price.toString();
                                                      ctl.productMargin_.value = prod.margin.toString();
                                                      ctl.imageUrl.value = prod.imageUrl ?? '';
                                                      ctl.imageFile.value = XFile('');
                                                      Get.to(
                                                        ProductFormScr(
                                                          isUpdateForm: true,
                                                          catId: cat.id!,
                                                          productId: prod.id!,
                                                          imageUrl: prod.imageUrl ?? '',
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  Divider(),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      C.rowH(),
                                      Hero(
                                        tag: 'add button',
                                        child: C.buttonAdd(() {
                                          ctl.orderNum.value = 1;
                                          ctl.productName.text = 'สินค้าใหม่';
                                          ctl.productDisp1.text = 'ยอดฮิต';
                                          ctl.productDisp2.text = 'สินค้าใหม่ 3 ขวด';
                                          ctl.productPrice.text = '9999';
                                          ctl.productMargin.text = '9999';
                                          ctl.productName_.value = 'สินค้าใหม่';
                                          ctl.productDisp1_.value = 'ยอดฮิต';
                                          ctl.productDisp2_.value = 'สินค้าใหม่ 3 ขวด';
                                          ctl.productPrice_.value = '9999';
                                          ctl.productMargin_.value = '9999';
                                          ctl.imageUrl.value = '';
                                          ctl.imageFile.value = XFile('');
                                          Get.to(
                                            ProductFormScr(
                                              isUpdateForm: false,
                                              catId: cat.id!,
                                            ),
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              C.rowH(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
