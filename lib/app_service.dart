import 'dart:async';
import 'package:aaa/routes/app_pages.dart';
import 'package:aaa/shared/utils/common.dart';
import 'package:aaa/ui_model/person/ui_person.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aaa/shared/utils/my_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vibration/vibration.dart';

import 'package:awesome_notifications/awesome_notifications.dart';


class AppService extends MyCtl {
  var dummy = true.obs;
  var demoVersion = true.obs;
  var profileData = const UiPerson(
    id: 'me',
    level: LevelStaff.manager,
    isFrontStaff: true,
  ).obs;
  // var scaffoldKey = GlobalKey<ScaffoldState>();

  // setting
  var openThisBranch = true.obs;
  var payLater = true.obs;
  var collectNumberCustomer = true.obs;
  var numNoti = 0.obs;

  var isAlert = false.obs;
  var isStaffOnline = false.obs;
  var pingMessage = ''.obs;
  var pingLastUpdated = ''.obs;
  Timer? pingTimer;
  // var collectGenderCustomer = true.obs;
  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  Rx<GoogleSignInAccount?>? googleUser;
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      // 'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Future<void> onInit() async {
    super.onInit();
    demo();

    initNoti();
  }

  @override
  onReady() async {
    super.onReady();
    // ever(googleUser, (user) {
    //   if (user != null) {
    //     // user is logged in
    //     Get.offAllNamed(Routes.home);
    //   } else {
    //     // user is null as in user is not available or not logged in
    //     Get.offAllNamed(Routes.login);
    //   }
    // });
  }

  void initNoti() {
    // flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    // const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    // // var androidNotificationChannel = const AndroidNotificationChannel(
    // //   'sss',
    // //   'ooo',
    // // );
    // // await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(androidNotificationChannel);
    // final bool? result = await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()!.requestPermissions(
    //       alert: true,
    //       badge: true,
    //       sound: true,
    //     );

    // final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(onDidReceiveLocalNotification: C.dialogError('get permission'));

    // /// init
    // final InitializationSettings initializationSettings = InitializationSettings(
    //   android: initializationSettingsAndroid,
    //   iOS: initializationSettingsIOS,
    // );
    // await flutterLocalNotificationsPlugin.initialize(
    //   initializationSettings,
    //   onSelectNotification: C.dialogError('noti selected'),
    // );
    AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        // 'resource://drawable/res_app_icon',
        null,
        [
          NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white,
          ),
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          NotificationChannelGroup(channelGroupkey: 'basic_channel_group', channelGroupName: 'Basic group'),
        ],
        debug: true);

    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    AwesomeNotifications().actionStream.listen((ReceivedNotification receivedNotification) {
      // Navigator.of(context).pushNamed(
      //     '/NotificationPage',
      //     arguments: {
      //         // your page params. I recommend you to pass the
      //         // entire *receivedNotification* object
      //         id: receivedNotification.id
      //     }
      // );
      print('tap');
    });
    if (kDebugMode) {
      print('------init local notification');
    }
  }

  Future<void> handleGoogleSignIn() async {
    C.dialogLoading();
    try {
      await googleSignIn.signIn();
      Get.offAllNamed(Routes.home);
    } catch (error) {
      print(error);
    }
    Get.back();
  }

  Future<void> handleGoogleSignOut() => googleSignIn.disconnect();
  alert(String text) async {
    // const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails('sss', 'ooo', importance: Importance.max, priority: Priority.high, ticker: 'ticker');
    // const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    // await flutterLocalNotificationsPlugin.show(0, 'plain title', text, platformChannelSpecifics, payload: 'item x');
    await 2.delay();
    numNoti.value = numNoti.value + 1;
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: numNoti.value,
        channelKey: 'basic_channel',
        title: 'Simple Notification ${numNoti.value}',
        body: 'Simple body',
      ),
    );
    Vibration.vibrate(pattern: [500, 1000, 500, 2000]);
  }

  // startPing() async {
  //   pingFunc(firstTime: true);
  //   pingTimer = Timer.periodic(const Duration(seconds: 5), (Timer t) => pingFunc());
  // }

  // Future<void> pingFunc({bool firstTime = false}) async {
  //   if (isAlert.value == false) {
  //     SSS sta = SSS.error;
  //     if (firstTime) {
  //       C.dialogLoading();
  //       await Future.wait([
  //         0.5.delay(),
  //         (doPing() as Future).then((value) => sta = value),
  //       ]);
  //       Get.back();
  //     } else {
  //       sta = await doPing();
  //     }
  //     if (sta == SSS.success) {
  //       isStaffOnline.value = true;
  //       // check message
  //       String res = pingMessage.value;
  //       if (res == 'x') {
  //         stopPing();
  //         // change status to ignore alert

  //         C.dialogError('ลูกค้าสั่งเครื่องดื่ม');
  //       } else {
  //         pingLastUpdated.value = DateTime.now().str('d-M-y kk:mm:ss');
  //       }
  //     } else {
  //       // stopPing();
  //       C.dialogError('โปรดตรวจสอบการเชื่อมต่อ...\nอินเตอร์เน็ตของคุณ');
  //     }
  //   }
  // }

  // stopPing() {
  //   isAlert.value = false;
  //   isStaffOnline.value = false;
  //   pingTimer?.cancel();
  //   pingTimer = null;
  // }

  // doPing() async {
  //   SSS status;
  //   PingRes? res = await api.ping();
  //   if (res != null) {
  //     pingMessage.value = res.data?.ping ?? '';
  //     status = SSS.success;
  //   } else {
  //     status = SSS.apiNull;
  //   }

  //   if (demoVersion.value) {
  //     status = SSS.success;
  //   }
  //   return status;
  // }

  demo() {
    isStaffOnline.value = true;
  }
}
