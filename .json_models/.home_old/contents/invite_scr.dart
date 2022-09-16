import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:flutter/services.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/utils/common.dart';
import '../../service_screen/staff_profile.dart';
import '../home_ctl.dart';

class InviteScr extends StatelessWidget {
  InviteScr({Key? key}) : super(key: key);

  final HomeCtl ctl = Get.find<HomeCtl>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() => buildObx(context)),
    );
  }

  Widget buildObx(BuildContext context) {
    var products = [];
    for (int i = 0; i < 20; i++) {
      var a = {
        'name': 'water $i',
        'description': '1 ถัง',
        'price': '35',
        'category': 'water',
        'status': 'success',
      };
      products.add(a);
    }

    var level = [
      [
        '800',
        'เจ้าของร้าน',
      ],
      [
        '700',
        'ผู้จัดการฝ่าย',
      ],
      [
        '600',
        'ผู้จัดการสาขา',
      ],
      [
        '500',
        'พนักงานเก็บเงิน',
      ],
      [
        '420',
        'พนักงานหลังร้าน',
      ],
      [
        '410',
        'พนักงานหน้าร้าน',
      ],
    ];
    var activeColor = CC.backgroundColor;
    var inActiveColor = CC.grey;
    return Expanded(
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  C.rowH(),
                  Visibility(
                    visible: false,
                    child: Text(ctl.dummy.value),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      C.textH1('  เพิ่มพนักงาน'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text('-'),
                            // Padding(
                            //   padding: const EdgeInsets.all(8),
                            //   child: Icon(FontAwesomeIcons.solidEye),
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: C.textH2('เลือกสาขา'),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 40,
                                  child: Wrap(
                                    alignment: WrapAlignment.center,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: <Widget>[
                                      ...(ctl.branchs.value.data?.branchs ?? [])
                                          .map(
                                        (branch) => InkWell(
                                          onTap: () {
                                            ctl.branchId.value = branch.id!;
                                          },
                                          child: Card(
                                            child: ListTile(
                                              selected:
                                                  ctl.branchId.value == branch,
                                              tileColor: CC.iColor,
                                              selectedTileColor: CC.aColor,
                                              title: C.textP(branch.name!),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: C.textH2('เลือกระดับ'),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 40,
                                  child: Column(
                                    // alignment: WrapAlignment.center,
                                    // crossAxisAlignment: WrapCrossAlignment.center,
                                    children: <Widget>[
                                      ...level.map(
                                        (e) => InkWell(
                                          onTap: () {
                                            ctl.levelId.value = e[0];
                                          },
                                          child: Card(
                                            child: ListTile(
                                              selected:
                                                  ctl.levelId.value == e[0],
                                              selectedTileColor: CC.aColor,
                                              tileColor: CC.iColor,
                                              title: C.textP(e[1]),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      C.button(
                        'สร้างการเชิญ',
                        () {
                          C.dialog(
                            title: 'สำเร็จ',
                            content: Column(
                              children: const <Widget>[
                                Text(
                                    'รหัสในการเชิญพนักงาน\nของคุณคือ\n\neuththeutheu\n\nคัดลอกรหัสนี้\nแล้วส่งให้พนักงานของคุณ'),
                              ],
                            ),
                            actions: [
                              Column(
                                children: [
                                  C.button('คัดลอก', () {
                                    // copy to clipboard
                                    //
                                    Clipboard.setData(ClipboardData(
                                        text: "${ctl.invite_code}"));
                                    Get.back();
                                  }, width: 200),
                                ],
                              )
                            ],
                          );
                        },
                        width: 200,
                      ),
                    ],
                  ),
                  C.rowH(),
                  C.rowH(),
                  C.rowH(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
