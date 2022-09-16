import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common.dart';

abstract class SView extends StatelessWidget {
  String? title;
  SView({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: buildWidget(context),
    );
  }

  buildWidget(BuildContext context) {}
}

abstract class View<T> extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  final String? tag = null;

  T get ctl => GetInstance().find<T>(tag: tag)!;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() => buildObx(context)),
    );
  }

  buildObx(BuildContext context) {}
}

abstract class HomeView extends StatelessWidget {
  // final HomeCtl ctl;
  const HomeView({Key? key}) : super(key: key);
  @override
  build(context) {
    return Obx(() => buildWidget(context));
  }

  buildWidget(context) {
    return Container();
  }
  // GetStorage get box => Get.find<GetStorage>();
  // getText(textClass) {
  //   return textClass.text[Get.locale];
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return WillPopScope(
  //     onWillPop: () async => false,
  //     child: SafeArea(child: Obx(() => buildObx(context))),
  //   );
  // }

  // buildObx(BuildContext context) {}
}

abstract class ViewArg<T> extends View {
  ViewArg({Key? key}) : super(key: key);
  @override
  final T ctl = Get.arguments;
  // GetStorage get box => Get.find<GetStorage>();
  // getText(textClass) {
  //   return textClass.text[Get.locale];
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return WillPopScope(
  //     onWillPop: () async => false,
  //     child: SafeArea(child: Obx(() => buildObx(context))),
  //   );
  // }

  // buildObx(BuildContext context) {}
}
