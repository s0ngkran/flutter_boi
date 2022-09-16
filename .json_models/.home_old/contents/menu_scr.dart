import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/constants/colors.dart';
import '../../../shared/utils/common.dart';
import '../home_ctl.dart';

class MenuScr extends StatelessWidget {
  MenuScr({Key? key}) : super(key: key);

  final HomeCtl ctl = Get.find<HomeCtl>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() => buildObx(context)),
    );
  }

  Widget buildObx(BuildContext context) {
    var category = [
      {'name': 'beer'},
      {'name': 'drink'},
      {'name': 'water'},
      {'name': 'beer'},
      {'name': 'drink'},
      {'name': 'water'},
      {'name': 'beer'},
      {'name': 'drink'},
      {'name': 'water'},
      {'name': 'beer'},
      {'name': 'drink'},
      {'name': 'water'},
      {'name': 'beer'},
      {'name': 'drink'},
    ];
    var products = [
      {
        'name': 'water',
        'description': '1 ถัง',
        'price': '35',
        'category': 'water',
      },
      {
        'name': 'water',
        'description': '1 ถัง',
        'price': '35',
        'category': 'water',
      },
      {
        'name': 'water',
        'description': '1 ถัง',
        'price': '35',
        'category': 'water',
      },
      {
        'name': 'water',
        'description': '1 ถัง',
        'price': '35',
        'category': 'beer',
      },
      {
        'name': 'water',
        'description': '1 ถัง',
        'price': '35',
        'category': 'beer',
      },
      {
        'name': 'water',
        'description': '1 ถัง',
        'price': '35',
        'category': 'beer',
      },
      {
        'name': 'water',
        'description': '1 ถัง',
        'price': '35',
        'category': 'beer',
      },
      {
        'name': 'water',
        'description': '1 ถัง',
        'price': '35',
        'category': 'beer',
      },
      {
        'name': 'water',
        'description': '1 ถัง',
        'price': '35',
        'category': 'drink',
      },
    ];
    return Expanded(
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                C.rowH(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: C.titleFont('  สั่งเครื่องดื่ม'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      const SizedBox(width: 16),
                      ...category.map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                            child: Card(
                              color: (ctl.selectedCategoryId.value == e['name'])
                                  ? CC.foregroundColor0
                                  : CC.backgroundColor,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: Text(e['name'] ?? '',
                                      style: TextStyle(
                                        color: (ctl.selectedCategoryId.value ==
                                                e['name'])
                                            ? Colors.white
                                            : CC.foregroundColor2,
                                      )),
                                ),
                              ),
                            ),
                            onTap: () {
                              ctl.selectedCategoryId.value = e['name'] ?? '';
                            },
                          ),
                        ),
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
                        ...products.map(
                          (e) {
                            if (ctl.selectedCategoryId.value == e['category']) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      ctl.orderNum.value = 1;
                                      C.dialog(
                                        title: e['name'],
                                        content: Column(
                                          children: <Widget>[
                                            Text(e['description'] ?? '---'),
                                          ],
                                        ),
                                        actions: [
                                          SizedBox(
                                            width: 200,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                C.button(
                                                  '-',
                                                  () {
                                                    ctl.orderNum.value -= 1;
                                                  },
                                                ),
                                                Expanded(
                                                  child: Obx(() {
                                                    return Center(
                                                        child: Text(
                                                            '${ctl.orderNum.value}',
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            )));
                                                  }),
                                                ),
                                                C.button(
                                                  '+',
                                                  () {
                                                    ctl.orderNum.value += 1;
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          // C.rowH(),
                                          SizedBox(
                                            width: 200,
                                            child: C.button('ใส่ตะกร้า', () {
                                              /// dummy add to cart
                                              var id = '232';
                                              // ctl.addCartItem(id);
                                              Get.back();
                                            }),
                                          ),
                                          SizedBox(
                                            width: 200,
                                            child: C.buttonWhite('กลับ', () {
                                              Get.back();
                                            }),
                                          ),
                                        ],
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 110,
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: SizedBox(
                                                height: 110,
                                                width: 110,
                                                child: Image.asset(
                                                  'image/leo/leo2.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            C.rowW(),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'ยอดฮิต',
                                                  style: TextStyle(
                                                    color: Colors.orange,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'ลีโอเบียร์',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 24,
                                                      ),
                                                    ),
                                                    Text(
                                                      'ลีโอ 3 ขวด 199 บาท',
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 91, 91, 91),
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
                              );
                            }
                            return Container();
                          },
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
    );
  }
}
