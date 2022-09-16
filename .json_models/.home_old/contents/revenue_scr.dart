import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/utils/common.dart';
import '../home_ctl.dart';
import 'bar_plot_scr.dart';
import 'dart:math' as math;

class RevenueScr extends StatelessWidget {
  RevenueScr({Key? key}) : super(key: key);

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

    var sevenDayData = [];
    for (double i = 0.0; i <= 6 + 8; i++) {
      var a = {
        'day': i.toInt(),
        'revenue': 2000 + 150 * i,
        'margin': 1200.0 + 50 * i,
      };
      sevenDayData.add(a);
    }
    var monthData = [];
    for (double i = 0.0; i <= 30; i++) {
      var a = {
        'day': i.toInt(),
        'revenue': 1000 + 150 * i,
        'margin': 1200.0 + 50 * i,
      };
      monthData.add(a);
    }
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: C.titleFont('ยอดขาย'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          C.dialog(
                            title: 'รายละเอียดเพิ่มเติม',
                            content: Padding(
                              padding: const EdgeInsets.only(
                                left: 100,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    width: 200,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 30,
                                          color: CC.lightYellow,
                                        ),
                                        C.rowW(),
                                        Text('ยอดขาย'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          color: CC.darkYellow,
                                        ),
                                        C.rowW(),
                                        Text('กำไร'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Icon(FontAwesomeIcons.solidEye, color: CC.grey5),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3 + 70,
                          child: MyChart(data: sevenDayData),
                        ),
                        C.button(
                          'เลือกวัน',
                          () async {
                            DateTime? date = await C.getDate(context);
                            print('date $date');
                          },
                        ),
                        // BarChartSample4(
                        //   sevenDayData: ctl.chartData.value as List,
                        // ),
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

class MyChart extends StatelessWidget {
  final data;
  MyChart({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ww = MediaQuery.of(context).size.width;
    var hh = MediaQuery.of(context).size.height / 3;
    var w = ww - 8 * 4 - 2 * 6;
    var val = 100;
    var val2 = 20;
    var c = hh * 0.05;
    // find max val
    var mx = 0.0;
    for (var i = 0; i < data.length; i++) {
      if (data[i]['revenue'] > mx) {
        mx = data[i]['revenue'];
      }
    }
    w = w / data.length;
    var ratio = hh / mx;

    ///// variable

    return Card(
      color: CC.grey1,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ...data.map(
                  (e) => Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 10),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            width: w,
                            color: CC.lightYellow,
                            height: e['revenue'] * ratio - e['margin'] * ratio,
                          ),
                          Positioned(
                            right: -8,
                            top: 10,
                            child: Transform.rotate(
                              angle: -math.pi / 2,
                              child: Text(
                                '${e['revenue'].toInt()}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: CC.grey7,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: w,
                            color: CC.darkYellow,
                            height: e['margin'] * ratio - c,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                        child: Center(
                          child: Text(
                            'M',
                            style: TextStyle(
                              fontSize: 12,
                              color: CC.grey7,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '12 Aug',
                    style: TextStyle(
                      color: CC.grey7,
                    ),
                  ),
                  Text(
                    '24 Aug',
                    style: TextStyle(
                      color: CC.grey7,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
