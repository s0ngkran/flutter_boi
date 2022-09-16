import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:badges/badges.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_boi/modules/home/contents/branch/category_scr.dart';
import 'package:my_boi/modules/home/contents/branch/service_scr.dart';
import 'package:my_boi/modules/home/contents/branch/zone_scr.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:flutter/services.dart';
import '../../../../generated_model/branchs_res/branch.dart';
import '../../../../shared/constants/colors.dart';
import '../../../../shared/services/storage_service.dart';
import '../../../../shared/utils/common.dart';
import '../../home_ctl.dart';
import 'component.dart';

class BranchScr extends StatelessWidget {
  BranchScr({Key? key}) : super(key: key);

  final HomeCtl ctl = Get.find<HomeCtl>();
  final keyScroll = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() => buildObx(context)),
    );
  }

  Widget buildObx(BuildContext context) {
    var activeColor = CC.backgroundColor;
    var inActiveColor = CC.grey;
    var staffs = ctl.staffs.value.data?.staffs;
    var nChainManager = staffs?.where(
      (e) => e.level == LevelUser.chainManager,
    );
    var nManager = staffs?.where(
      (e) => e.level == LevelUser.manager,
    );
    var nCashier = staffs?.where(
      (e) => e.level == LevelUser.cashier,
    );
    var nBackStaff = staffs?.where(
      (e) => e.level == LevelUser.backStaff,
    );
    var nFrontStaff = staffs?.where(
      (e) => e.level == LevelUser.frontStaff,
    );

    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Scrollbar(
              child: SingleChildScrollView(
                key: keyScroll,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: false,
                      child: Text('${ctl.dummy.value} ${ctl.branchs.value}'),
                    ),

                    ////// branchs
                    ////// branchs
                    ////// branchs
                    ////// branchs
                    ////// branchs
                    Container(
                      color: CC.grey2,
                      child: Column(
                        children: [
                          C.rowH(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 70,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                C.rowW(),
                                ...(ctl.branchs.value.data?.branchs ?? []).map(
                                  (e) => BranchButton(
                                    isActive: ctl.branchContainer.value == e.id,
                                    title: e.name ?? '--',
                                    onTap: () {
                                      ctl.branchContainer.value = e.id ?? '';
                                    },
                                  ),
                                ),
                                C.rowW(),
                                C.buttonAdd(() {
                                  ctl.branchName.text = 'สาขาใหม่';
                                  C.dialog(
                                    title: 'สร้างสาขาใหม่',
                                    content: Form(
                                      key: ctl.keyFormNewBranch,
                                      child: Column(
                                        children: <Widget>[
                                          C.inputForm(ctl.branchName, labelText: 'ชื่อสาขาใหม่', validator: (val) {
                                            return;
                                          }),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      C.button('ยืนยัน', () async {
                                        SSS status = await ctl.createBranch();
                                        switch (status) {
                                          case SSS.success:
                                            Get.back();
                                            break;
                                          default:
                                            C.dialogError('สร้างสาขาใหม่ ไม่สำเร็จ');
                                        }
                                      })
                                    ],
                                  );
                                }),
                                C.rowW(),
                                C.rowW(),
                                C.rowW(),
                              ],
                            ),
                          ),
                          C.rowH(),
                        ],
                      ),
                    ),

                    ///// this branch
                    ///// this branch
                    ///// this branch
                    ///// this branch
                    ///// this branch
                    ...(ctl.branchs.value.data?.branchs ?? []).map(
                      (branch) {
                        return Visibility(
                          visible: branch.id == ctl.branchContainer.value,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ///// branch detail
                              ///// branch detail
                              ///// branch detail

                              /// product
                              /// product
                              /// product
                              /// product
                              C.rowH(),
                              C.card(
                                backgroundWidget: [
                                  const MyIcon(
                                    iconData: FontAwesomeIcons.beerMugEmpty,
                                  ),
                                ],
                                padContent: 0,
                                child: InkWell(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          C.rowW(),
                                          Hero(
                                            tag: 'all products',
                                            child: C.textH6('สินค้าทั้งหมด'),
                                          ),
                                          C.editIcon(),
                                        ],
                                      ),
                                      //// category
                                      //// category
                                      //// category
                                      ...(branch.categorySet ?? []).map(
                                        (cat) => C.textP('     - ${cat.name} (${cat.productSet?.length ?? 0})'),
                                      ),
                                      C.rowH(),
                                    ],
                                  ),
                                  onTap: () {
                                    ctl.setBranch(branch.id!);
                                    ctl.setFirstCategoryId();
                                    ctl.orderEditing.value = false;
                                    // Get.to(
                                    //   CategoryProductScr(),
                                    // );
                                    Get.to(CategoryScr());
                                  },
                                ),
                              ),

                              /// staff
                              /// staff
                              /// staff
                              C.card(
                                backgroundWidget: [
                                  const MyIcon(
                                    iconData: FontAwesomeIcons.child,
                                  ),
                                ],
                                padContent: 0,
                                child: InkWell(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              C.rowW(),
                                              Hero(
                                                tag: 'staff title',
                                                child: C.textH6('พนักงานทั้งหมด'),
                                              ),
                                              C.editIcon(),
                                            ],
                                          ),
                                          if ((nChainManager?.length ?? 0) > 0) C.textP('     ${LevelUser.wordChainManager} (${nChainManager?.length})'),
                                          if ((nManager?.length ?? 0) > 0) C.textP('     ${LevelUser.wordManager} (${nManager?.length})'),
                                          if ((nCashier?.length ?? 0) > 0) C.textP('     ${LevelUser.wordCashier} (${nCashier?.length})'),
                                          if ((nBackStaff?.length ?? 0) > 0) C.textP('     ${LevelUser.wordBackStaff} (${nBackStaff?.length})'),
                                          if ((nFrontStaff?.length ?? 0) > 0) C.textP('     ${LevelUser.wordFrontStaff} (${nFrontStaff?.length})'),
                                          C.rowH(),
                                          // ...(ctl.staffs.value.data?.staffs ?? []).map(
                                          //   (staff) => C.textP(
                                          //     '     ${staff.nickname}',
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onTap: () async {
                                    await ctl.setBranch(branch.id!);
                                    Get.to(
                                      ZoneScr(),
                                    );
                                  },
                                ),
                              ),

                              /// zone
                              /// zone
                              /// zone
                              C.card(
                                backgroundWidget: [
                                  const MyIcon(
                                    iconData: FontAwesomeIcons.chair,
                                  ),
                                ],
                                padContent: 0,
                                child: InkWell(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              C.rowW(),
                                              C.textH6('โต๊ะทั้งหมด'),
                                              C.editIcon(),
                                            ],
                                          ),
                                          ...(branch.zoneSet ?? []).map(
                                            (zone) => Visibility(
                                              visible: zone.isActive == true,
                                              child: C.textP('     ${zone.name} (${zone.tableSet?.length ?? 0})'),
                                            ),
                                          ),
                                          C.rowH(),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onTap: () async {
                                    await ctl.setBranch(branch.id!);
                                    Get.to(
                                      ZoneScr(),
                                    );
                                  },
                                ),
                              ),

                              /// services
                              /// services
                              /// services
                              /// services
                              C.card(
                                backgroundWidget: [
                                  const MyIcon(
                                    iconData: FontAwesomeIcons.bellConcierge,
                                  ),
                                ],
                                padContent: 0,
                                child: InkWell(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                C.rowW(),
                                                Hero(
                                                  tag: 'all services',
                                                  child: C.textH6('บริการเสริมทั้งหมด'),
                                                ),
                                                C.editIcon(),
                                              ],
                                            ),
                                            ...(branch.serviceSet ?? []).map(
                                              (ser) => C.textP('     ${ser.name}'),
                                            ),
                                            C.rowH(),
                                          ],
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      ctl.setBranch(branch.id!);
                                      Get.to(ServiceScr());
                                    }),
                              ),

                              //// template
                              //// template
                              //// template
                              //// template
                              C.card(
                                backgroundWidget: [
                                  const MyIcon(
                                    iconData: FontAwesomeIcons.clipboardList,
                                  ),
                                ],
                                padContent: 0,
                                child: InkWell(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              C.rowW(),
                                              C.textH6('แม่แบบทั้งหมด'),
                                              C.editIcon(),
                                            ],
                                          ),
                                          C.textP('     eeeee'),
                                          C.rowH(),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    print('template');
                                  },
                                ),
                              ),

                              /// actions button for this branch
                              /// actions button for this branch
                              /// actions button for this branch
                              ...[
                                // rename branch
                                // rename branch
                                C.button('เปลี่ยนชื่อสาขา', () async {
                                  C.dialog(
                                      title: 'เปลี่ยนชื่อสาขา',
                                      content: Form(
                                        key: ctl.keyFormRenameBranch,
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Text('ชื่อเดิม: ${branch.name}'),
                                            ),
                                            C.inputForm(ctl.branchNameRename, labelText: 'ชื่อใหม่', validator: (val) {
                                              return;
                                            }),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        C.button('ยืนยัน', () async {
                                          // SSS status = await ctl.renameBranch(branch.id!);
                                          SSS status = await ctl.renameBranch(branch.id!);
                                          switch (status) {
                                            case SSS.success:
                                              Get.back();
                                              break;
                                            default:
                                              C.dialogError('ไม่สำเร็จ ลบสาขาไม่สำเร็จ');
                                          }
                                        }),
                                        C.buttonBack('กลับ', () {
                                          Get.back();
                                        })
                                      ]);
                                }),
                                C.rowH(),

                                //// del this branch
                                //// del this branch
                                C.buttonDel('ลบสาขานี้', () async {
                                  C.dialog(
                                    title: 'ลบสาขานี้',
                                    content: Column(
                                      children: <Widget>[
                                        Text('คุณต้องการลบ "${branch.name}" ?'),
                                      ],
                                    ),
                                    actions: [
                                      C.buttonDel('ยืนยัน', () async {
                                        SSS status = await ctl.deleteBranch(branch.id!);
                                        switch (status) {
                                          case SSS.success:
                                            Get.back();
                                            break;
                                          default:
                                            C.dialogError('ไม่สำเร็จ ลบสาขาไม่สำเร็จ');
                                        }
                                      }),
                                      C.rowH(),
                                      C.buttonBackTemplate(),
                                    ],
                                  );
                                }),
                              ],

                              /// rename this branch
                            ],
                          ),
                        );
                      },
                    ),
                    C.rowH(),
                    C.rowH(),
                    C.rowH(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
