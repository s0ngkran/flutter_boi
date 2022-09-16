import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:simple_animations/stateless_animation/loop_animation.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../shared/constants/colors.dart';
import '../../../shared/utils/common.dart';
import '../../service_screen/staff_profile.dart';
import '../home_ctl.dart';

class StaffScr extends StatelessWidget {
  StaffScr({Key? key}) : super(key: key);

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
    for (int i = 0; i < 4; i++) {
      var a = {
        'name': 'water $i',
        'description': '1 ถัง',
        'price': '35',
        'category': 'water',
        'status': 'success',
      };
      products.add(a);
    }
    return Expanded(
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: C.titleFont('  พนักงาน'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text('ประสบการณ์'),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Icon(FontAwesomeIcons.solidEye),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 10,
                            children: [
                              ...products.map(
                                (e) {
                                  return MyPerson(
                                    status: 'inHouse',
                                    money: '350',
                                    name: 'สงกรานต์',
                                    repeatNum: '7',
                                    onTap: () {
                                      Get.to(StaffProfileScr());
                                    },
                                  );
                                },
                              ),
                              ...products.map(
                                (e) {
                                  return MyPerson(
                                    status: 'waiting',
                                    money: '350',
                                    name: 'สงกรานต์',
                                    repeatNum: '7',
                                    onTap: () {
                                      Get.to(StaffProfileScr());
                                    },
                                  );
                                },
                              ),
                              ...products.map(
                                (e) {
                                  return MyPerson(
                                    status: 'ready',
                                    money: '350',
                                    name: 'สงกรานต์',
                                    repeatNum: '7',
                                    onTap: () {
                                      Get.to(StaffProfileScr());
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      C.rowH(),
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

class MyPerson extends StatelessWidget {
  final String status;
  final String repeatNum;
  final String money;
  final String name;
  final onTap;
  MyPerson({
    Key? key,
    required this.status,
    required this.repeatNum,
    required this.money,
    required this.name,
    required this.onTap,
  }) : super(key: key);
  final double size = 150;
  var activeColor = Colors.yellow;
  var inActiveColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    var color;
    if (status == 'ready') {
      color = CC.grey4;
    } else if (status == 'waiting') {
      color = CC.backgroundColor;
    } else if (status == 'inHouse') {
      color = Colors.green;
    }
    return Padding(
      padding: const EdgeInsets.all(1),
      child: InkWell(
        onTap: onTap,
        // ignore: avoid_unnecessary_containers
        child: Container(
          // color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 120,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.child,
                    size: 40,
                    color: color,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // C.textP('วันนี้ $repeatNum', padding: 0),
                      C.textP(name, padding: 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          C.textP('Q$repeatNum \$$money', padding: 0),
                        ],
                      ),
                    ],
                  ),

                  //// status circle
                  /// text money
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
