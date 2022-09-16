import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/utils/common.dart';
import 'login_ctl.dart';

class RegisterScr extends StatelessWidget {
  RegisterScr({
    Key? key,
    required this.ctl,
  }) : super(key: key);
  final LoginCtl ctl;
  final keyScroll = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: C.appBar(
          context,
          'สมัครสมาชิก',
          showBackButton: true,
        ),
        body: SingleChildScrollView(
          key: keyScroll,
          child: Column(
            children: <Widget>[
              Text(ctl.dummy.value),
              // const Text('text'),
              Form(
                key: ctl.keyFormRegister,
                child: Padding(
                  padding: const EdgeInsets.all(C.p),
                  child: Column(
                    children: <Widget>[
                      C.inputForm(
                        ctl.inviteLink,
                        labelText: 'รหัสเชิญ',
                        validator: (val) {
                          return null;
                        },
                        padding: C.p,
                      ),
                      C.inputForm(
                        ctl.email,
                        labelText: 'อีเมล',
                        validator: (val) {
                          if (!GetUtils.isEmail(val)) return 'อีเมลไม่ถูกต้อง';
                          return null;
                        },
                        padding: C.p,
                      ),
                      C.inputForm(
                        ctl.username,
                        labelText: 'ชื่อบัญชี',
                        validator: (val) {
                          return;
                        },
                        padding: C.p,
                      ),
                      C.inputForm(
                        ctl.password1,
                        labelText: 'รหัสผ่าน',
                        obscureText: true,
                        validator: (val) {
                          return;
                        },
                        padding: C.p,
                      ),
                      C.inputForm(
                        ctl.password2,
                        labelText: 'ยืนยันรหัสผ่าน',
                        obscureText: true,
                        validator: (val) {
                          return;
                        },
                        padding: C.p,
                      ),
                      // C.inputForm(
                      //   ctl.password2,
                      //   labelText: 'ที่อยู่',
                      //   obscureText: true,
                      //   validator: (val) {
                      //     return;
                      //   },
                      //   padding: C.p,
                      // ),
                      // C.inputForm(
                      //   ctl.password2,
                      //   labelText: 'Facebook',
                      //   obscureText: true,
                      //   validator: (val) {
                      //     return;
                      //   },
                      //   padding: C.p,
                      // ),
                      // C.inputForm(
                      //   ctl.password2,
                      //   labelText: 'Instagram',
                      //   obscureText: true,
                      //   validator: (val) {
                      //     return;
                      //   },
                      //   padding: C.p,
                      // ),
                      // C.inputForm(
                      //   ctl.password2,
                      //   labelText: 'Line',
                      //   obscureText: true,
                      //   validator: (val) {
                      //     return;
                      //   },
                      //   padding: C.p,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.all(C.p),
                          //   child: C.button('ขอรหัสเชิญ', () {
                          //     C.dialog(
                          //       title: 'ขอรับรหัสเชิญได้ ฟรี!',
                          //       content: const Text(
                          //         'คุณสามารถใช้แอปนี้ฟรีได้ 2 เดือน\nโดยไม่มีค่าใช้จ่ายใดๆ\n-ไม่ต้องมีอุปกรณ์\n-ไม่มีค่าแรกเข้า\n\nติดต่อเพื่อขอรับได้ทาง\n${C.adminPhone}\n${C.adminOnline}',
                          //       ),
                          //     );
                          //   }),
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(C.p),
                            child: C.button('register', () async {
                              // SSS status = await ctl.register();
                              // // SSS status = await ctl.test_register();
                              // switch (status) {
                              //   case SSS.success:
                              //     // auto login
                              //     Get.back();
                              //     break;
                              //   case SSS.emailError:
                              //     C.dialogError('ไม่สามารถใช้อีเมลนี้ได้');
                              //     break;
                              //   case SSS.nameError:
                              //     C.dialogError('ไม่สามารถใช้ชื่อบัญชีนี้ได้');
                              //     break;
                              //   case SSS.passwordError:
                              //     C.dialogError(
                              //         'รหัสผ่านอาจไม่ตรงกัน หรือสั้นเกินกว่า 8 ตัวอักษร หรือสามารถเดาได้ง่ายเกินไป');
                              //     break;
                              //   default:
                              //     C.dialogError('สมัครสมาชิกไม่สำเร็จ');
                              // }
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // C.buttonTest('auto register', () {
              //   ctl.testRegister();
              // })
            ],
          ),
        ));
  }
}
