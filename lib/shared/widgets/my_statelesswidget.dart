import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_service.dart';

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key? key}) : super(key: key);
  final AppService app = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() => buildObx(context)),
    );
  }

  Widget buildObx(BuildContext context) {
    return Container();
  }
}
