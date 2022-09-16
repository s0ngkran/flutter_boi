import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../generated_model/login_res/login_res.dart';
import '../../shared/constants/colors.dart';
import '../../shared/utils/common.dart';
import 'contents/branch/branch_scr.dart';
import 'contents/change_password_scr.dart';
import 'contents/invite_scr.dart';
import 'contents/profile_scr.dart';
import 'contents/revenue_scr.dart';
import 'contents/staff_scr.dart';
import 'contents/table_scr.dart';
import 'home_ctl.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

// ignore: must_be_immutable
class HomeScr extends StatelessWidget {
  // @override
  // HomeCtl get ctl {
  //   // print('in get ctl argument:${Get.arguments}');
  //   // var providedCtl = Get.arguments;
  //   // if (providedCtl == null) {
  //   //   return GetInstance().find<HomeCtl>(tag: tag);
  //   // } else {
  //   //   return providedCtl;
  //   // }
  //   return GetInstance().find<HomeCtl>(tag: tag);
  // }

  HomeCtl? homeCtl;
  HomeScr({
    Key? key,
    this.homeCtl,
  }) : super(key: key);

  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        } else {
          return true;
        }
      },
      child: Obx(() => buildObx(context)),
    );
  }

  buildObx(context) {
    var text = {
      const Locale('th', 'us'): {
        0: 'เกี่ยวกับ',
        1: 'สิทธิพิเศษ',
        2: 'ข่าวสาร',
        3: 'แจ้งเตือน',
        4: 'ติดต่อ',
      },
      const Locale('en', 'us'): {
        0: 'About',
        1: 'Previlege',
        2: 'Update',
        3: 'Notify',
        4: 'Contact',
      },
    };
    // var pageName = text[Get.locale] as Map;
    homeCtl ??= Get.find<HomeCtl>();
    HomeCtl ctl = homeCtl ?? HomeCtl();
    LoginRes? profile = Get.arguments;
    ctl.profileData.value = profile!;
    ctl.fetchBranchs();
    return Scaffold(
        key: ctl.homeScaffoldKey,
        drawer: SafeArea(
          top: false,
          bottom: false,
          child: C.drawer(ctl),
        ),
        // bottomNavigationBar: bottomBar(context, ctl),
        // FAB
        // FAB
        // FAB
        // FAB
        // FAB
        floatingActionButton: MyFAB(isDialOpen: isDialOpen),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        // appBar
        // appBar
        // appBar
        // appBar
        // appBar
        appBar: C.appBar(
          context,
          null,
        ),
        body: Column(
          children: <Widget>[
            // Text('level ${ctl.profileData.value.data?.tokenAuth?.user?.level ?? 0}'),
            if (ctl.page.value == Pages.staff) StaffScr(),
            if (ctl.page.value == Pages.table) TableScr(),
            if (ctl.page.value == Pages.revenue) RevenueScr(),
            if (ctl.page.value == Pages.invite) InviteScr(),
            if (ctl.page.value == Pages.branch) BranchScr(),
            if (ctl.page.value == Pages.changePassword) ChangePasswordScr(),
            if (ctl.page.value == Pages.profile) ProfileScr(),
          ],
        ));
  }
}

class MyFAB extends StatelessWidget {
  final isDialOpen;
  HomeCtl ctl = Get.find<HomeCtl>();
  MyFAB({
    Key? key,
    required this.isDialOpen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var level = ctl.profileData.value.data?.tokenAuth?.user?.level ?? 0;
    return SpeedDial(
      foregroundColor: CC.foregroundColor2,
      backgroundColor: CC.backgroundColor,
      // onPressed: () {
      //   C.dialog();
      // },
      // child: const Text('+',
      //     style: TextStyle(
      //       fontSize: 37,
      //     )),
      animatedIcon: AnimatedIcons.view_list,
      openCloseDial: isDialOpen,
      // icon: FontAwesomeIcons.bullhorn,
      // activeIcon: FontAwesomeIcons.chevronUp,
      overlayColor: Colors.grey,
      overlayOpacity: 0.5,
      spacing: 8,
      spaceBetweenChildren: 15,
      closeManually: true,
      // childMargin: EdgeInsets.all(32.0),
      children: [
        /// manager view
        if (level >= LevelUser.manager) ...[
          SpeedDialChild(
              child: const Icon(FontAwesomeIcons.brandsFontAwesome),
              label: 'ตั้งค่า สาขา',
              onTap: () {
                isDialOpen.value = false;
                ctl.page.value = Pages.branch;
                // Get.to(RandomScr());
              }),
          SpeedDialChild(
              child: const Icon(FontAwesomeIcons.userPlus),
              label: 'เชิญพนักงาน',
              onTap: () {
                isDialOpen.value = false;
                ctl.page.value = Pages.invite;
                // Get.to(RandomScr());
              }),
          SpeedDialChild(
              child: const Icon(FontAwesomeIcons.users),
              label: 'พนักงาน',
              onTap: () {
                isDialOpen.value = false;
                ctl.page.value = Pages.staff;
                // Get.to(RandomScr());
              }),
          SpeedDialChild(
              child: const Icon(FontAwesomeIcons.dollarSign),
              label: 'ยอดขาย',
              onTap: () {
                isDialOpen.value = false;
                ctl.page.value = Pages.revenue;
                // Get.to(RandomScr());
              }),
        ],

        /// staff view
        SpeedDialChild(
            child: const Icon(FontAwesomeIcons.chair),
            label: 'โต๊ะ',
            onTap: () {
              isDialOpen.value = false;
              ctl.page.value = Pages.table;
              // Get.to(RandomScr());
            }),
      ],
    );
  }
}
