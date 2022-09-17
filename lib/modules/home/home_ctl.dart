import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/response_model/board_res/board_res.dart';
import '../../api/response_model/create_board_req.dart';
import '../../api/response_model/update_board_req.dart';
import '../../app_service.dart';
import '../../shared/utils/common.dart';
import '../../shared/utils/my_controller.dart';

class HomeCtl extends MyCtl {
  var dummy = ''.obs;
  var loading = false.obs;

  var keyFormTemplate = GlobalKey<FormState>();
  var titleTemplate = TextEditingController();
  var nameTemplate = TextEditingController();
  var descriptionTemplate = TextEditingController();
  var passwordTemplate = TextEditingController();

  AppService app = Get.find();
  var boards = Rx<BoardRes?>(null);

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
  getBoards() async {
    SSS sta;
    BoardRes? res = await api.getBoard();
    boards.value = res;
    sta = SSS.success;
    return sta;
  }

  createBoard() async {
    SSS status = await C.basicAPIHandle(
      this,
      () {
        if (keyFormTemplate.currentState!.validate()) {
          return api.createBoard(
            CreateBoardReq(
              title: titleTemplate.text,
              description: descriptionTemplate.text,
            ),
          );
        }
      },
    );
    return status;
  }

  updateBoard(
    int id, {
    isActive = true,
    isChecked = false,
  }) async {
    SSS status = await C.basicAPIHandle(
      this,
      () {
        return api.updateBoard(
          UpdateBoardReq(
            id: id,
            isChecked: isChecked,
            isActive: isActive,
          ),
        );
      },
    );
    return status;
  }
}
