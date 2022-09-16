import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_service.dart';
import '../../shared/services/storage_service.dart';
import '../../shared/utils/common.dart';
import '../../shared/utils/my_controller.dart';

class LoginCtl extends MyCtl {
  var dummy = ''.obs;
  var email = TextEditingController();
  var inviteLink = TextEditingController();
  var keyForm = GlobalKey<FormState>();
  // for register scr
  var keyFormRegister = GlobalKey<FormState>();

  var loading = false.obs;
  var password = TextEditingController();
  var password1 = TextEditingController();
  var password2 = TextEditingController();
  // var profile = LoginRes().obs;
  var text = '--'.obs;
  var username = TextEditingController();
  var usernameR = TextEditingController();

  var isFirstTime = true.obs;

  final AppService app = Get.find<AppService>();
  @override
  onInit() async {
    super.onInit();
    await clear();
    // check old token
  }

  clear() {
    username.text = '';
    password.text = '';
  }

  logout() async {
    clear();
    await SS.token(BB.write, token: null);
    await SS.refreshToken(BB.write, refreshToken: null);
    // await SS.profile(BB.write, data: null);
  }

  login() async {
    // call api to login
    loading.value = true;
    SSS status = SSS.init;
    String? token;
    // if (keyForm.currentState!.validate()) {}
    loading.value = false;
    return status;
  }

  postFrameFunc() async {
    if (isFirstTime.value) {
      await 0.1.delay();
      // autoToBranchForOwner();
      // autoToFrontStaff();
    }
    isFirstTime.value = false;
  }

  // Future<void> handleSignIn() async {
  //   try {
  //     await _googleSignIn.signIn();
  //   } catch (error) {
  //     print(error);
  //   }
  // }
}
