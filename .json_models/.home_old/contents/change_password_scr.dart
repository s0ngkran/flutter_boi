import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/utils/common.dart';
import '../home_ctl.dart';

class ChangePasswordScr extends StatelessWidget {
  ChangePasswordScr({Key? key}) : super(key: key);

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

    var branchs = [
      'สาขา1',
      'สาขา2',
      'สาขา3',
      'สาขา4',
    ];
    var level = [
      'level 200 - manager',
      'level 400 - front staff',
      'level 500 - back staff',
      'level 500 - back staff',
      'level 500 - back staff',
      'level 500 - back staff',
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: C.titleFont('เปลี่ยนรหัสผ่าน'),
                ),
                Form(
                  key: ctl.keyFormChangePassword,
                  child: Column(
                    children: <Widget>[
                      C.inputForm(
                        ctl.oldPassword,
                        obscureText: true,
                        labelText: 'รหัสผ่านเดิม',
                        validator: (val) {
                          return null;
                        },
                        padding: C.p,
                      ),
                      C.inputForm(
                        ctl.newPassword1,
                        obscureText: true,
                        labelText: 'รหัสผ่านใหม่',
                        validator: (val) {
                          return null;
                        },
                        padding: C.p,
                      ),
                      C.inputForm(
                        ctl.newPassword2,
                        obscureText: true,
                        labelText: 'ยืนยันรหัสผ่านใหม่',
                        validator: (val) {
                          return null;
                        },
                        padding: C.p,
                      ),
                      C.button(
                        'เปลี่ยนรหัสผ่าน',
                        () async {
                          // change password
                          SSS status = await ctl.changePassword();
                          // SSS status = await ctl.testChangePassword();
                          switch (status) {
                            case SSS.success:
                              C.dialog(
                                title: 'สำเร็จ',
                                content:
                                    const Text('คุณเปลี่ยนรหัสผ่านสำเร็จแล้ว'),
                              );
                              break;
                            default:
                              C.dialogError(
                                  'คุณเปลี่ยนรหัสผ่านไม่สำเร็จ\nโปรดลองอีกครั้ง');
                          }
                        },
                        width: 200,
                      ),
                      C.testButton('auto  fill change password', () {
                        ctl.autoFillChangePassword();
                      })
                    ],
                  ),
                )
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
