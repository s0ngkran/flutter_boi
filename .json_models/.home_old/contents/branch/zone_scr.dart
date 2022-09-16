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
import 'dialog/create_table_dialog.dart';
import 'dialog/create_zone_dialog.dart';
import 'dialog/update_table_dialog.dart';

class ZoneScr extends StatelessWidget {
  final HomeCtl ctl = Get.find<HomeCtl>();
  ZoneScr({
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
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Visibility(
                          visible: false,
                          child: Text(ctl.dummy.value),
                        ),

                        /// free staffs
                        /// free staffs
                        /// free staffs
                        /// free staffs
                        /// free staffs
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Hero(
                                      tag: 'staff title',
                                      child: C.titleFont('พนักงานว่าง'),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    /// staffs
                                    /// staffs
                                    /// staffs
                                    /// staffs
                                    ...staffs.map(
                                      (e) => SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: Column(
                                          children: [
                                            const CircleAvatar(),
                                            Text(e['name'] ?? ''),
                                          ],
                                        ),
                                      ),
                                    ),

                                    /// add staff
                                    /// add staff
                                    /// add staff
                                    /// add staff
                                    C.buttonAdd(() {
                                      ctl.page.value = Pages.invite;
                                      Get.back();
                                    })
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        //// zone set
                        //// zone set
                        //// zone set
                        //// zone set
                        //// zone set
                        ...(branch.zoneSet ?? []).map(
                          (zone) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                //// zone title
                                //// zone title
                                //// zone title
                                //// zone title
                                InkWell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: C.titleFont('${zone.name} (โซน)'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              FontAwesomeIcons.penToSquare,
                                              color: CC.foregroundColor1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      dialogUpdateZone(zone.id!, zone.name!);
                                    }),

                                //// staffs
                                //// staffs
                                //// staffs
                                //// staffs
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Wrap(
                                    alignment: WrapAlignment.start,
                                    children: <Widget>[
                                      /// staff
                                      ...staffs.map(
                                        (e) => SizedBox(
                                          width: 80,
                                          height: 80,
                                          child: Column(
                                            children: [
                                              const CircleAvatar(),
                                              Text(e['name'] ?? ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                ///// table set
                                ///// table set
                                ///// table set
                                ///// table set
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Wrap(
                                    children: <Widget>[
                                      /// status
                                      /// ready   -> white
                                      /// waiting -> yellow
                                      /// inHouse -> green
                                      ...(zone.tableSet ?? []).map(
                                        (table) => MyTable(
                                            status: 'ready',
                                            title: '${table.name}',
                                            price: '178',
                                            onTap: () async {
                                              /// dialog edit
                                              await dialogUpdateTable(table.id!, table.name!);
                                            }),
                                      ),
                                      MyTable(
                                        status: 'add',
                                        price: '+',
                                        color: CC.white,
                                        onTap: () async {
                                          await dialogCreateTable(zone.id!);
                                        },
                                        title: '',
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(),
                              ],
                            ),
                          ),
                        ),

                        ///// add zone button
                        ///// add zone button
                        ///// add zone button
                        ///// add zone button
                        C.buttonAdd(() {
                          dialogCreateZone();
                        }),
                        const SizedBox(
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
