import 'package:get/get.dart';

import '../modules/auth/login_ctl.dart';
import '../modules/auth/login_scr.dart';
import '../modules/home/home_ctl.dart';
import '../modules/home/home_scr.dart';
import '../modules/welcome/welcome_ctl.dart';
import '../modules/welcome/welcome_scr.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.login;
  // this commit is a backup before delete the content

  static final routes = [
    GetPage(
      name: Routes.welcome,
      page: () {
        return const WelcomeScr();
      },
      binding: BindingsBuilder(
        () {
          Get.lazyPut<WelcomeCtl>(
            () => WelcomeCtl(),
          );
        },
      ),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginScr(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginCtl>(
          () => LoginCtl(),
        );
      }),
    ),
    // GetPage(
    //   name: Routes.forgotPassword,
    //   page: () => const ForgetPasswordScr(),
    //   binding: BindingsBuilder(() {
    //     Get.lazyPut<ForgotPasswordCtl>(
    //       () => ForgotPasswordCtl(),
    //     );
    //   }),
    // ),
    // children: [
    //   GetPage(
    //     name: Routes.verifyOTP,
    //     page: () => VerifyOTPScr(ctl: ),
    //     binding: BindingsBuilder(() {
    //       Get.lazyPut<HomeCtl>(
    //         () => HomeCtl(),
    //       );
    //     }),
    //   ),
    // ],
    ///////////////////////////////////////////////////////

    ///////// main
    ///////// main
    ///////// main
    GetPage(
      name: Routes.home,
      page: () {
        return HomeScr();
      },
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeCtl>(
          () => HomeCtl(),
        );
      }),
    ),
  ];
}
