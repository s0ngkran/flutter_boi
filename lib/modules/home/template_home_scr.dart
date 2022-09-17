import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_service.dart';
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
      body: SizedBox.expand(
        child: RefreshIndicator(
          onRefresh: () async {
            ctl.getBoards();
          },
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                C.rowH(),
                C.textH6('Welcome to my boi'),
                C.rowH(),
                ...content(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> content(BuildContext context) {
    return [];
  }
}
