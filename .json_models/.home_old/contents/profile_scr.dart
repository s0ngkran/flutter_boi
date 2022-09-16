import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_boi/shared/widgets/photo_hero.dart';
import 'package:simple_shadow/simple_shadow.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/utils/common.dart';
import '../home_ctl.dart';

class ProfileScr extends StatelessWidget {
  ProfileScr({Key? key}) : super(key: key);

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
    var user = ctl.profileData.value.data?.tokenAuth?.user;
    return Expanded(
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Form(
                  key: ctl.keyFormChangePassword,
                  child: Column(
                    children: <Widget>[
                      C.rowH(),
                      Visibility(
                        visible: false,
                        child: Text(ctl.dummy.value),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: C.titleFont('ข้อมูลส่วนตัว'),
                      ),
                      C.rowH(),
                      MyImage(
                        onTap: () async {
                          XFile? file = await ctl.pickImage();
                          if (file != null) {
                            ctl.imageFile.value = file;
                          }
                        },
                        imageFile: ctl.imageFile.value.path,
                        urlPhoto:
                            '${ctl.profileData.value.data?.tokenAuth?.user?.profileImageUrl}',
                        width: 110,
                      ),
                      C.rowH(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '${user?.firstName ?? ''} ${user?.lastName ?? ''}'),
                              Text('ที่อยู่ ${user?.address ?? '-'}'),
                              Text('อีเมล ${user?.email ?? '-'}'),
                              const Divider(),
                              Text('Facebook ${user?.facebook ?? '-'}'),
                              Text('Instagram ${user?.ig ?? '-'}'),
                              Text('Line ${user?.line ?? '-'}'),
                            ],
                          ),
                        ),
                      ),
                      C.button('แก้ไข', () async {
                        /// edit profile
                        /// upload img
                        String? link =
                            await ctl.uploadImage(ctl.imageFile.value);
                        link ??= ctl.profileData.value.data?.tokenAuth?.user
                                ?.profileImageUrl ??
                            '';
                        // SSS sta = await ctl.updateProduct(productId!, link);
                        // switch (sta) {
                        //   case SSS.success:
                        //     String id = ctl.branch.value.id!;
                        //     await ctl.fetchBranchs();
                        //     await ctl.setBranch(id);
                        //     Get.back();

                        //     break;
                        //   default:
                        //     C.dialogErrorTemplate();
                        // }
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
