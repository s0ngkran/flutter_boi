import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      floatingActionButton: FloatingActionButton(
        foregroundColor: CC.onPrimary,
        child: const Icon(FontAwesomeIcons.arrowsRotate),
        onPressed: () async {
          await ctl.getBoards();
        },
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              C.rowH(),
              C.textH6('Welcome to my checklist'),
              C.rowH(),
              ...content(context),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> content(BuildContext context) {
    return [];
  }
}
