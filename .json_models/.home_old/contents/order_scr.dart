// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:badges/badges.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';

// import '../../../shared/constants/colors.dart';
// import '../../../shared/utils/common.dart';
// import '../home_ctl.dart';

// class OrderScr extends StatelessWidget {
//   OrderScr({Key? key}) : super(key: key);

//   final HomeCtl ctl = Get.find<HomeCtl>();
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Obx(() => buildObx(context)),
//     );
//   }

//   Widget buildObx(BuildContext context) {
//     var products = [
//       {
//         'name': 'water',
//         'description': '1 ถัง',
//         'price': '35',
//         'category': 'water',
//         'status': 'waiting',
//       },
//       {
//         'name': 'water',
//         'description': '1 ถัง',
//         'price': '35',
//         'category': 'water',
//         'status': 'success',
//       },
//       {
//         'name': 'water',
//         'description': '1 ถัง',
//         'price': '35',
//         'category': 'water',
//         'status': 'success',
//       },
//       {
//         'name': 'water',
//         'description': '1 ถัง',
//         'price': '35',
//         'category': 'water',
//         'status': 'success',
//       },
//       {
//         'name': 'water',
//         'description': '1 ถัง',
//         'price': '35',
//         'category': 'water',
//         'status': 'success',
//       },
//     ];
//     return Expanded(
//       child: Stack(
//         children: [
//           Row(
//             children: [
//               SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 child: Column(
//                   children: [
//                     C.rowH(),
//                     Visibility(
//                       visible: false,
//                       child: Text(ctl.dummy.value),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: C.titleFont('  รายการที่สั่งแล้ว'),
//                         ),
//                         C.rowW(),
//                         Column(
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 if (ctl.cartList.isEmpty) {
//                                   C.dialog(
//                                     title: 'ตะกร้าว่างเปล่า',
//                                     content: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       children: [
//                                         const Text(
//                                           'ไม่มีสินค้าในตะกร้าของคุณ กรุณาเลือกเครื่องดื่มก่อน',
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ],
//                                     ),
//                                     actions: [
//                                       SizedBox(
//                                         width: 200,
//                                         child: C.backButton(),
//                                       ),
//                                     ],
//                                   );
//                                 }
//                                 ctl.goToCart();
//                               },
//                               child: const Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: Text('ดูตะกร้า'),
//                               ),
//                             ),
//                             SizedBox(height: 2),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Expanded(
//                       child: Container(
//                         color: CC.grey1,
//                         width: MediaQuery.of(context).size.width,
//                         child: ListView(
//                           scrollDirection: Axis.vertical,
//                           children: [
//                             ...products.map(
//                               (e) {
//                                 return Column(
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         C.dialog(
//                                             // title: 'แก้แแ',
//                                             // content: Column(
//                                             //   children: [
//                                             //     const Text('คุณต้องการยกเลิกการสั่งรายการนี้ ?'),
//                                             //     C.rowH(),
//                                             //   ],
//                                             // ),
//                                             title: 'เลือกทำรายการ',
//                                             content: Container(),
//                                             actions: [
//                                               SizedBox(
//                                                 width: 200,
//                                                 child: C.button('สั่งเพิ่มอีก 1', () {}),
//                                               ),
//                                               SizedBox(
//                                                 width: 200,
//                                                 child: C.button('สั่งเพิ่มอีก 3', () {}),
//                                               ),
//                                               if (e['status'] == 'waiting')
//                                                 SizedBox(
//                                                   width: 200,
//                                                   child: C.button(
//                                                     'ยกเลิกการสั่ง',
//                                                     () {},
//                                                     color: Colors.red,
//                                                     textColor: Colors.white,
//                                                   ),
//                                                 ),
//                                               SizedBox(
//                                                 width: 200,
//                                                 child: C.buttonWhite('กลับ', () {
//                                                   Get.back();
//                                                 }),
//                                               ),
//                                             ]);
//                                       },
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(16.0),
//                                         child: SizedBox(
//                                           height: 110,
//                                           child: Stack(
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   SizedBox(
//                                                     width: 110,
//                                                     height: 110,
//                                                     child: Stack(
//                                                       children: [
//                                                         if (e['status'] == 'waiting')
//                                                           AnimatedScale(
//                                                             duration: const Duration(milliseconds: 300),
//                                                             scale: ctl.ssscale.value,
//                                                             child: ClipRRect(
//                                                               borderRadius: BorderRadius.circular(8.0),
//                                                               child: SizedBox(
//                                                                 height: 110,
//                                                                 width: 110,
//                                                                 child: Image.asset(
//                                                                   'image/leo/leo2.png',
//                                                                   fit: BoxFit.cover,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
//                                                         else
//                                                           ClipRRect(
//                                                             borderRadius: BorderRadius.circular(8.0),
//                                                             child: SizedBox(
//                                                               height: 110,
//                                                               width: 110,
//                                                               child: Image.asset(
//                                                                 'image/leo/leo2.png',
//                                                                 height: 110,
//                                                                 width: 110,
//                                                                 fit: BoxFit.cover,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         if (e['status'] == 'success')
//                                                           const Positioned(
//                                                             right: 10,
//                                                             bottom: 5,
//                                                             child: SizedBox(
//                                                               width: 40,
//                                                               height: 40,
//                                                               child: Center(
//                                                                 child: CircleAvatar(
//                                                                   backgroundColor: Colors.green,
//                                                                   radius: 20,
//                                                                   // color: Colors.white,
//                                                                   child: CircleAvatar(
//                                                                     backgroundColor: Colors.white,
//                                                                     radius: 15,
//                                                                     child: Icon(
//                                                                       Icons.check_outlined,
//                                                                       color: Colors.green,
//                                                                       size: 30,
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   C.rowW(),
//                                                   Column(
//                                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       Column(
//                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                         children: [
//                                                           Row(
//                                                             children: [
//                                                               // Text(
//                                                               //   'สถานะ - ${e['status']}',
//                                                               //   style: TextStyle(
//                                                               //     color: Color.fromARGB(255, 91, 91, 91),
//                                                               //     // fontWeight: FontWeight.bold,
//                                                               //     fontSize: 17,
//                                                               //   ),
//                                                               // ),
//                                                               if (e['status'] == 'waiting')
//                                                                 AnimatedTextKit(
//                                                                   isRepeatingAnimation: true,
//                                                                   repeatForever: true,
//                                                                   animatedTexts: [
//                                                                     WavyAnimatedText(
//                                                                       'preparing...',
//                                                                       speed: Duration(milliseconds: 100),
//                                                                       textStyle: TextStyle(
//                                                                         fontWeight: FontWeight.bold,
//                                                                         fontSize: 17,
//                                                                         color: Colors.orange,
//                                                                       ),
//                                                                     ),
//                                                                   ],
//                                                                 ),
//                                                             ],
//                                                           ),
//                                                           SizedBox(height: 4),
//                                                           Text(
//                                                             'ลีโอเบียร์',
//                                                             overflow: TextOverflow.ellipsis,
//                                                             style: TextStyle(
//                                                               color: Color.fromARGB(255, 0, 0, 0),
//                                                               fontWeight: FontWeight.bold,
//                                                               fontSize: 20,
//                                                             ),
//                                                           ),
//                                                           Text(
//                                                             'ลีโอ 3 ขวด 199 บาท',
//                                                             style: TextStyle(
//                                                               color: Color.fromARGB(255, 91, 91, 91),
//                                                               // fontWeight: FontWeight.bold,
//                                                               fontSize: 17,
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ],
//                                               ),
//                                               Positioned(
//                                                 bottom: 30,
//                                                 right: 0,
//                                                 child: Card(
//                                                   color: CC.backgroundColor,
//                                                   child: Padding(
//                                                     padding: const EdgeInsets.all(4.0),
//                                                     child: Text(
//                                                       '20',
//                                                       style: TextStyle(
//                                                         fontSize: 20,
//                                                         color: CC.foregroundColor2,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Divider(),
//                                   ],
//                                 );
//                               },
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(16),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(5),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.end,
//                                       children: [
//                                         Text('ยอดรวม',
//                                             style: TextStyle(
//                                               fontSize: 24,
//                                               color: CC.foregroundColor1,
//                                               fontWeight: FontWeight.bold,
//                                             )),
//                                         Text('${ctl.totalBill.value} บาท',
//                                             style: TextStyle(
//                                               fontSize: 18,
//                                               color: CC.foregroundColor1,
//                                             )),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(height: 8),
//                                   InkWell(
//                                     onTap: () {
//                                       C.dialog();
//                                     },
//                                     child: Card(
//                                       color: CC.foregroundColor2,
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.end,
//                                           mainAxisSize: MainAxisSize.min,
//                                           children: [
//                                             SizedBox(width: 8),
//                                             Icon(
//                                               FontAwesomeIcons.share,
//                                               color: CC.white,
//                                             ),
//                                             SizedBox(width: 8),
//                                             Text(
//                                               'แชร์ให้เพื่อน',
//                                               style: TextStyle(
//                                                 fontSize: 16,
//                                                 color: CC.white,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: 120),
//                             C.rowH(),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Positioned(
//             bottom: 16,
//             right: 16 + 4,
//             child: Column(
//               children: [
//                 C.button(
//                   'คิดเงิน',
//                   () {
//                     C.dialog(
//                       title: 'เรียกพนักงาน',
//                       content: Column(
//                         children: <Widget>[
//                           const Text('คุณต้องการเรียกพนักงาน'),
//                           const Text('เพื่อมาคิดเงิน ?'),
//                         ],
//                       ),
//                       actions: [
//                         SizedBox(
//                           width: 200,
//                           child: C.button('ยืนยัน', () {}),
//                         ),
//                         SizedBox(
//                           width: 200,
//                           child: C.buttonWhite('กลับ', () {
//                             Get.back();
//                           }),
//                         ),
//                       ],
//                     );
//                   },
//                   color: CC.foregroundColor3,
//                   textColor: CC.grey,
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
