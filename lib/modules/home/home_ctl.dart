
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_service.dart';
import '../../shared/utils/my_controller.dart';

class HomeCtl extends MyCtl {
  var dummy = ''.obs;

  var keyFormTemplate = GlobalKey();
  var nameTemplate = TextEditingController();
  var passwordTemplate = TextEditingController();

  AppService app = Get.find();
  @override
  // ignore: unnecessary_overrides
  onInit() async {
    super.onInit();

    // app.googleSignIn.onCurrentUserChanged.listen((account) {
    //   app.googleUser = account.obs;
    // });
    // app.googleSignIn.signInSilently();
  }

  // @override
  // onReady() {
  //   GoogleSignInAccount? user = app.googleUser?.value;
  //   if (user == null) {
  //     Get.offAllNamed(Routes.login);
  //     if (kDebugMode) {
  //       print('go to login');
  //     }
  //   }
  // }

}
