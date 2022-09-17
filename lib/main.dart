import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'api/api_repository.dart';
import 'api/rest_api/api_provider.dart';
import 'app_config/app_const.dart';
import 'app_service.dart';
import 'firebase_options.dart';
import 'shared/shared.dart';

import 'app_binding.dart';
import 'di.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DenpendencyInjection.init();
  // rename repository
  // await Firebase.initializeApp(
  //   name: 'firstFire',
  //   options: DefaultFirebaseOptions.currentPlatform,
  // ).then(
  //   (value) {
  //     Get.put(AppService());
  //   },
  // );
  Get.put(AppService());
  Get.put(ApiProviderRest());
  runApp(const App());
  // configLoading();
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      //
      //
      //
      getPages: AppPages.routes,
      // initialRoute: Routes.apiTest,
      initialRoute: Routes.home,
      // initialRoute: Routes.welcome,
      //
      //
      //
      //
      defaultTransition: Transition.fadeIn,
      initialBinding: AppBinding(),
      smartManagement: SmartManagement.keepFactory,
      title: AppConst.name,
      // theme: ThemeConfig.lightTheme,
      theme: ThemeData.light().copyWith(
        backgroundColor: CC.primary,
        // scaffoldBackgroundColor: hexToColor('#D0D0D2'),
        scaffoldBackgroundColor: CC.scaffoldBackground,
        canvasColor: CC.background,
        bottomAppBarColor: CC.primary,
        cardColor: CC.background,
        dividerColor: CC.primary,
        splashColor: CC.grey1,
        disabledColor: CC.onPrimaryDisabled,
        unselectedWidgetColor: CC.iColor,
        selectedRowColor: CC.aColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: CC.primary,
            foregroundColor: CC.onPrimary,
          ),
        ),
        colorScheme: const ColorScheme.light().copyWith(
          // primary: CC.primary,
          // primaryContainer: const Color.fromARGB(255, 255, 255, 255),
          // secondaryContainer: CC.blue,
          // onPrimary: Colors.white,
          // onSurface: Colors.red,
          secondary: CC.primary,
          // background: CC.primary,
          // surface: Colors.green,
        ),
      ),
      locale: const Locale('th', 'us'),
    );
  }
}
