import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:image_picker/image_picker.dart';

import '../../app_config/app_const.dart';
import '../../app_service.dart';
import '../../routes/app_pages.dart';
import '../constants/colors.dart';
import '../utils/common.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({
    Key? key,
  }) : super(key: key);

  AppService app = Get.find<AppService>();
  GlobalKey keyListView = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.7;
    // UiPerson? user = app.profileData.value;
    GoogleSignInAccount? user = app.googleUser?.value;
    return SizedBox(
      width: width,
      child: Drawer(
        // backgroundColor: CC.grey2,
        child: ListView(
          key: keyListView,
          padding: const EdgeInsets.only(top: 0.0),
          // child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: CC.primary,
                // image: const DecorationImage(
                //   image: AssetImage('images/design2/header-bg/header-bg.jpg'),
                //   fit: BoxFit.fill,
                // ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Text(
                              AppConst.name,
                              style: TextStyle(
                                color: CC.onPrimary,
                                fontSize: 19 * 2,
                              ),
                            ),
                            // Text(
                            //   'PRIVILEGE',
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //     fontSize: 24 * 1.3,
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // if (user.id != '' && false)
            //   ListTile(
            //     tileColor: CC.grey2,
            //     title: Text(
            //       '${user.firstName} ${user.lastName} level(${user.level})',
            //       style: TextStyle(
            //         fontSize: C.h4,
            //         color: CC.onBackground,
            //       ),
            //     ),
            //   ),
            // DrawerTile(
            //   title: '?????????????????????',
            //   onTap: () {},
            // ),
            // if (ctl.profileData.value.firstName != null && ctl.profileData.value.lastName != null)
            // DrawerTile(
            //   icon: const FaIcon(FontAwesomeIcons.house),
            //   title: text['home'],
            //   onTap: () {
            //     ctl.page.value = Pages.home;
            //     ctl.homeScaffoldKey.currentState!.openEndDrawer();
            //     Get.toNamed(
            //       Routes.home,
            //       arguments: ctl,
            //     );
            //   },
            // ),
            // DrawerTile(
            //   icon: const Icon(FontAwesomeIcons.user),
            //   title: text['profile'],
            //   onTap: () {
            //     ctl.page.value = Pages.profile;
            //     ctl.homeScaffoldKey.currentState!.openEndDrawer();
            //     Get.toNamed(
            //       Routes.home,
            //       arguments: ctl,
            //     );
            //   },
            // ),
            if (user != null)
              ListTile(
                leading: GoogleUserCircleAvatar(
                  identity: user,
                ),
                title: Text(user.displayName ?? ''),
                subtitle: Text(user.email),
              ),
            DrawerTile(
              icon: const Icon(FontAwesomeIcons.house),
              title: '????????????????????????',
              onTap: () async {
                // HomeCtl ctl = Get.find<HomeCtl>();
                // ctl.page.value = Pages.profile;
                // ctl.profileData.value = await SS.profile(BB.read);
                // ctl.imageFile.value = XFile('');
                // app.homeScaffoldKey.value.currentState!.openEndDrawer();
                await Get.toNamed(Routes.home);
                Get.back();
              },
            ),
            // DrawerTile(
            //   icon: const Icon(
            //     FontAwesomeIcons.user,
            //     // color: Colors.grey,
            //   ),
            //   title: '???????????????????????????????????????',
            //   onTap: () async {
            //     Get.back();
            //     // C.dialogError('?????????????????????????????????????????????????????????');
            //     // await Get.toNamed(Routes.settingProfile);
            //     // Get.back();
            //   },
            // ),
            // DrawerTile(
            //   icon: const Icon(
            //     FontAwesomeIcons.user,
            //     color: Colors.red,
            //   ),
            //   title: 'toggle staff | manager',
            //   onTap: () async {
            //     if (app.profileData.value.level == LevelStaff.manager) {
            //       app.profileData.value = UiPerson(id: 'xx', level: LevelStaff.frontStaff);
            //       Get.back();
            //       C.dialogInfo('now you are frontStaff');
            //     } else {
            //       app.profileData.value = UiPerson(id: 'xx', level: LevelStaff.manager);
            //       Get.back();
            //       C.dialogInfo('now you are manager');
            //     }
            //     // C.dialogError('?????????????????????????????????????????????????????????');
            //     // await Get.toNamed(Routes.settingProfile);
            //     // Get.back();
            //   },
            // ),

            // //// open
            // //// open
            // //// open
            // DrawerTile(
            //   icon: const Icon(
            //     FontAwesomeIcons.store,
            //   ),
            //   title: '?????????????????????????????????',
            //   onTap: () async {
            //     await Get.toNamed(Routes.settingBranch);
            //     Get.back();
            //   },
            // ),
            // //// open
            // //// open
            // //// open
            // ///
            // ///
            // ///
            // DrawerTile(
            //   icon: const Icon(
            //     FontAwesomeIcons.productHunt,
            //     color: Colors.grey,
            //   ),
            //   title: '??????????????????????????????????????? dummy',
            //   onTap: () async {
            //     // C.dialogError('?????????????????????????????????????????????????????????');
            //     // Get.to(() => MenuScr());
            //     // await Get.toNamed(Routes.settingProfile);
            //     // Get.back();
            //   },
            // ),
            // DrawerTile(
            //   icon: const Icon(
            //     FontAwesomeIcons.productHunt,
            //     color: Colors.grey,
            //   ),
            //   title: '???????????????????????????????????????',
            //   onTap: () async {
            //     C.dialogError('?????????????????????????????????????????????????????????');
            //     // await Get.toNamed(Routes.settingProfile);
            //     // Get.back();
            //   },
            // ),

            // DrawerTile(
            //   icon: const Icon(
            //     FontAwesomeIcons.chair,
            //     color: Colors.grey,
            //   ),
            //   title: '?????????????????????????????????',
            //   onTap: () async {
            //     C.dialogError('?????????????????????????????????????????????????????????');
            //     // await Get.toNamed(Routes.settingProfile);
            //     // Get.back();
            //   },
            // ),

            // DrawerTile(
            //   icon: const Icon(
            //     FontAwesomeIcons.usersGear,
            //     color: Colors.grey,
            //   ),
            //   title: '??????????????????????????????????????????',
            //   onTap: () async {
            //     C.dialogError('?????????????????????????????????????????????????????????');
            //     // await Get.toNamed(Routes.settingStaff);
            //     // Get.back();
            //   },
            // ),
            // DrawerTile(
            //   icon: const Icon(
            //     FontAwesomeIcons.usersGear,
            //     color: Colors.grey,
            //   ),
            //   title: '??????????????????????????????????????????',
            //   onTap: () async {
            //     C.dialogError('?????????????????????????????????????????????????????????');
            //     // await Get.toNamed(Routes.settingStaff);
            //     // Get.back();
            //   },
            // ),
            // // C.rowH(),
            // // C.rowH(),
            // // SizedBox(height: MediaQuery.of(context).size.height - 480),
            // DrawerTile(
            //   icon: const Icon(FontAwesomeIcons.rightFromBracket),
            //   title: '??????????????????????????????',
            //   onTap: () {
            //     C.dialog(
            //       title: "??????????????????????????????",
            //       content: const Text(
            //         "???????????????????????????????????????????????????????????? ?",
            //       ),
            //       actions: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             TextButton(
            //               onPressed: () {
            //                 Get.back();
            //               },
            //               child: const Text(
            //                 '????????????',
            //               ),
            //             ),
            //             C.rowW(),
            //             ElevatedButton(
            //               onPressed: () async {
            //                 /// logout
            //                 /// logout
            //                 /// logout
            //                 /// logout

            //                 Get.toNamed(Routes.login);
            //               },
            //               child: const Text('??????????????????????????????'),
            //             )
            //           ],
            //         ),
            //       ],
            //     );
            //   },
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Get.toNamed(Routes.uiTestPage);
            //   },
            //   child: const Text('UI test page'),
            // ),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Icon? icon;
  const DrawerTile({
    Key? key,
    required this.title,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.zero,
      // shape: RoundedRectangleBorder(
      //   side: BorderSide(
      //     color: CColor.gold,
      //   ),
      // ),
      child: ListTile(
        tileColor: CC.background,
        leading: IconTheme(
          data: IconThemeData(color: CC.primary),
          child: icon!,
        ),
        // tileColor: CColor.darkBlue,
        // textColor: CColor.gold,
        // hoverColor: CColor.gold,
        title: Text(
          title,
          style: TextStyle(
            color: CC.onBackground,
            fontSize: C.pp,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
