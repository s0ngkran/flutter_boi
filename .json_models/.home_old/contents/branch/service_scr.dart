import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_boi/modules/home/contents/branch/dialog/update_zone_dialog.dart';

import '../../../../generated_model/branchs_res/branch.dart';
import '../../../../generated_model/branchs_res/table_set.dart';
import '../../../../shared/constants/colors.dart';
import '../../../../shared/utils/common.dart';
import '../../../service_screen/table_profile.dart';
import '../../../widgets/table_widget.dart';
import '../../home_ctl.dart';
import 'dialog/create_service_dialog.dart';
import 'dialog/create_table_dialog.dart';
import 'dialog/create_zone_dialog.dart';
import 'dialog/update_service_dialog.dart';
import 'dialog/update_table_dialog.dart';

class ServiceScr extends StatelessWidget {
  final HomeCtl ctl = Get.find<HomeCtl>();
  ServiceScr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() => buildObx(context)),
    );
  }

  Widget buildObx(BuildContext context) {
    var branch = ctl.branch.value;
    var categories = branch.categorySet;
    var staffs = [
      {'name': 'sk'},
      {'name': 'sk'},
      {'name': 'sk'},
      {'name': 'sk'},
      {'name': 'sk'},
    ];
    return Scaffold(
      appBar: C.appBarSub(
        context,
        '${branch.name}',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Visibility(
              visible: false,
              child: Text(ctl.dummy.value),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: 'all services',
                    child: C.textH6('บริการเสริมทั้งหมด'),
                  ),
                  ...(ctl.branch.value.serviceSet ?? []).map(
                    (service) => Padding(
                      padding: const EdgeInsets.all(1),
                      child: Card(
                        child: ListTile(
                            title: Text(service.name ?? '-'),
                            trailing: const Icon(FontAwesomeIcons.penToSquare),
                            tileColor: CC.grey1,
                            onTap: () {
                              dialogUpdateService(service.id!, service.name!);
                            }),
                      ),
                    ),
                  ),
                  C.buttonAdd(() {
                    dialogCreateService();
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
