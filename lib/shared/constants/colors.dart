import 'package:flutter/material.dart';

class CC {
  static Color lightScaffoldBackgroundColor = Colors.green;
  static Color darkScaffoldBackgroundColor = Colors.green;
  static Color secondaryAppColor = Colors.green;
  static Color secondaryDarkAppColor = const Color.fromARGB(255, 255, 184, 184);
  static Color tipColor = hexToColor('#B6B6B6');
  static Color lightGray = const Color.fromARGB(255, 116, 116, 116);
  static Color darkGray = const Color(0xFF9F9F9F);
  static Color black = const Color(0xFF000000);
  static Color white = Colors.white;
  static Color textLink = const Color.fromARGB(255, 9, 20, 182);
  //
  //

  //////////////// siamese privilege /////////////////////////
  //
  static Color darkBlue = hexToColor('#215178');
  static Color lightBlue = hexToColor('#D2E4FD');
  static Color darkBlue2 = hexToColor('#2F4F75');
  static Color darkYellow = Color.fromARGB(255, 255, 197, 24);
  static Color lightYellow = const Color.fromARGB(255, 255, 246, 160);

  // new style
  static Color blue = hexToColor('#215178');
  // static Color blue = hexToColor('#010024');
  // static Color blue = Colors.red;
  static Color activeText = Colors.white;
  static Color inactiveText =
      Color.fromARGB((255 * 0.5).toInt(), 255, 255, 255);

  //// QR drink color
  /// purple 800
  // static Color primary = Color(0xff6a1b9a);
  // static Color primaryLight = Color(0xff9c4dcc);
  // static Color primaryDark = Color(0xff38006b);
  /// purple 600
  // static Color grey = hexToColor('#292826');
  static Color grey1 = Color.fromARGB(255, 230, 230, 230);
  static Color grey2 = Color.fromARGB(255, 219, 219, 219);
  static Color grey3 = Color.fromARGB(255, 208, 208, 208);
  static Color grey4 = Color.fromARGB(255, 189, 189, 189);
  static Color grey5 = Color.fromARGB(255, 168, 168, 168);
  static Color grey6 = Color.fromARGB(255, 146, 146, 146);
  static Color grey7 = Color.fromARGB(255, 123, 123, 123);
  static Color grey8 = Color.fromARGB(255, 93, 93, 93);
  static Color grey9 = Color.fromARGB(255, 71, 71, 71);

  static Color primary = Color(0xff8e24aa);
  static Color primaryLight = Color(0xffc158dc);
  static Color primaryDark = Color(0xff5c007a);

  static Color primaryDisabled = CC.grey2;
  static Color scaffoldBackground = Color.fromARGB(255, 232, 232, 232);
  static Color background = Colors.white;

  /// foreground
  static Color onPrimary = Colors.white;
  static Color onPrimaryDisabled = Color.fromARGB(255, 109, 109, 109);
  static Color onBackground = Colors.black;
  static Color onWaiting = Colors.orange;
  static Color onError = Colors.red;
  static Color onSuccess = Colors.green;

  /// duplicated
  static Color aColor = Color(0xff6a1b9a);
  static Color iColor = Colors.white;
  //////////////////////////////////////////////////

  static Color gold = hexToColor('#D1C593');
  static Color purple = hexToColor('#9847FF');
  static Color blueWeb = hexToColor('#D0E3FC');
  static Color yellowWeb = hexToColor('#FCF3D0');
  static Color yellowTextWeb = hexToColor('#866A28');
  static Color blueButtonWeb = hexToColor('#3679F6');
  static Color yellowBg = Color.fromARGB(255, 255, 190, 59);
  static Color yellowBgLight = Color.fromARGB(255, 255, 234, 193);
  static Color bgAdd = Color.fromARGB(255, 255, 239, 207);

  /// color category on previlege page
  static Color cat1 = hexToColor('#D7EBF8');
  static Color cat2 = hexToColor('#ADD7ED');
  static Color cat3 = hexToColor('#82AFDF');
  static Color cat4 = hexToColor('#AEDEB8');
  static Color cat5 = hexToColor('#FBE9EC');
  static Color cat6 = hexToColor('#FFFAB8');
  static Color cat7 = hexToColor('#AEDEB8');
  static Color cat8 = hexToColor('#FFFAB8');
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
