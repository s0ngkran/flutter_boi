import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:simple_animations/stateless_animation/mirror_animation.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../app_service.dart';
import '../../routes/app_pages.dart';
import '../../shared/constants/colors.dart';
import '../../shared/utils/common.dart';
import '../../shared/utils/my_view.dart';
import '../../shared/widgets/my_drawer.dart';
import 'home_ctl.dart';

// ignore: must_be_immutable
class TemplateHomeScr extends View<HomeCtl> {
  TemplateHomeScr(this.title, {Key? key}) : super(key: key);
  final String title;

  GlobalKey keyScroll = GlobalKey();
  List<Widget> content(BuildContext context) {
    return [];
  }

  AppService app = Get.find();
  @override
  Widget buildObx(BuildContext context) {

    return Scaffold(
      appBar: C.appBar(
        context,
        title,
        backgroundColor: app.isStaffOnline.value ? CC.primary : CC.primaryDisabled,
        // switchValue: app.isStaffOnline.value,
        // onSwitchTap: (v) async {
        //   if (v) {
        //     await app.startPing();
        //   } else {
        //     await app.stopPing();
        //   }
        // },
      ),
      // bottomNavigationBar: BottomNav(),
      drawer: MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  <Widget>[
          const Text('Welcome to my boi'),
          ...content(context),
        ],
      ),
    );
  }
}
