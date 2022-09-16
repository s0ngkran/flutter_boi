import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
// import 'package:flutter_animator/widgets/attention_seekers/flash.dart';
// import 'package:flutter_animator/widgets/specials/cross_fade_a_b.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';
import '../../../generated_model/branchs_res/table_set.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/utils/common.dart';
import '../../service_screen/table_profile.dart';
import '../../widgets/table_widget.dart';
import '../home_ctl.dart';

import 'package:simple_animations/simple_animations.dart';
import 'dart:math';

class TableScr extends StatelessWidget {
  TableScr({Key? key}) : super(key: key);

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
    var tables = [
      {
        'name': '1',
        'status': 'ready',
      },
      {
        'name': '2',
        'status': 'waiting',
      },
      {
        'name': '3',
        'status': 'waiting',
      },
      {
        'name': '4',
        'status': 'inHouse',
      },
      {
        'name': '1',
        'status': 'waiting',
      },
      {
        'name': '1',
        'status': 'inHouse',
      },
      {
        'name': '12',
        'status': 'ready',
      },
    ];

    var zones = [
      {
        'name': 'zone1',
        'tables': tables,
      },
      {
        'name': 'zone2',
        'tables': tables,
      },
      {
        'name': 'zone3',
        'tables': tables,
      },
      {
        'name': 'zone4',
        'tables': tables,
      },
    ];
    var staffs = [
      {
        'name': 'songkran',
      },
      {
        'name': 'songkran',
      },
      {
        'name': 'songkran',
      },
      {
        'name': 'songkran',
      },
      {
        'name': 'songkran',
      },
      {
        'name': 'songkran',
      },
      {
        'name': 'songkran',
      },
    ];
    var activeColor = CC.backgroundColor;
    var inActiveColor = CC.grey;
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
                C.rowH(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: C.titleFont('พนักงานว่าง'),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    /// staff
                                    ...staffs.map(
                                      (e) => SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: Column(
                                          children: [
                                            CircleAvatar(),
                                            Text(e['name'] ?? ''),
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
                        ...zones.map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: C.titleFont('Zone ${e['name']}'),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Wrap(
                                      alignment: WrapAlignment.start,
                                      children: <Widget>[
                                        /// staff
                                        ...staffs.map(
                                          (e) => SizedBox(
                                            width: 80,
                                            height: 80,
                                            child: Column(
                                              children: [
                                                CircleAvatar(),
                                                Text(e['name'] ?? ''),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Wrap(
                                      children: <Widget>[
                                        /// status
                                        /// ready   -> white
                                        /// waiting -> yellow
                                        /// inHouse -> green
                                        if (e['tables'] != null)
                                          ...(e['tables'] as List).map(
                                            (j) => MyTable(
                                                status: j['status'],
                                                title: '${j['name']}',
                                                price: '670',
                                                onTap: () {
                                                  Get.to(TableProfileScr(
                                                    table:
                                                        TableSet(name: 'dummy'),
                                                  ));
                                                }),
                                          ),
                                        MyTable(
                                          status: 'add',
                                          price: '+',
                                          color: CC.white,
                                          onTap: () {
                                            C.dialog();
                                          },
                                          title: '',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 150,
                        ),
                      ],
                    ),
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
  final bool isWorking;
  final String repeatNum;
  final String money;
  final String name;
  final onTap;
  MyPerson({
    Key? key,
    required this.isWorking,
    required this.repeatNum,
    required this.money,
    required this.name,
    required this.onTap,
  }) : super(key: key);
  final double size = 100;
  var activeColor = Colors.yellow;
  var inActiveColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    var filterColor = isWorking ? activeColor : inActiveColor;
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            children: [
              SimpleShadow(
                sigma: 2,
                color: filterColor,
                child: Image.asset('assets/images/component/person_white.png',
                    width: size),
              ),
              Positioned(
                left: 8,
                top: 8,
                child: Text(repeatNum,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Positioned(
                left: 33,
                top: 8,
                child: CircleAvatar(
                  backgroundColor: filterColor,
                  radius: 8,
                ),
              ),
              Positioned(
                right: 16 + 8,
                top: size / 2,
                child: Row(
                  children: [
                    Text('\$ $money',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              Positioned(
                bottom: 16,
                left: 4,
                child: Text(name,
                    style: TextStyle(
                      fontSize: 16,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
