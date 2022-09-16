import 'package:get/get.dart';

import '../../shared/utils/my_controller.dart';

class WelcomeCtl extends MyCtl {
  var dummy = ''.obs;
  @override
  Future<void> onInit() async {
    super.onInit();

    // // await 1.delay();
    // MeRes? res = await api.me();
    // if (res?.data?.me?.id != null) {
    //   Me? me = res?.data?.me;
    //   if (me != null) {
    //     User user = User.fromJson(me.toJson());
    //     await SS.profile(BB.write, data: user);
    //     // to branch page
    //     Get.toNamed(Routes.home);
    //   } else {
    //     1 / 0;
    //   }
    // } else {
    //   Get.toNamed(Routes.login);
    // }
  }
}
