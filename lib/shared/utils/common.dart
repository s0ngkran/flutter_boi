library my_common;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:simple_animations/stateless_animation/loop_animation.dart';
import 'package:simple_animations/stateless_animation/mirror_animation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import '../../app_config/app_const.dart';
import '../constants/colors.dart';
import 'package:intl/intl.dart';

part 'enums.dart';
part 'extensions.dart';

class Call {
  String text;
  Call({
    required this.text,
  });
}

class LinkUrl {
  String url;
  String? label;
  LinkUrl({
    required this.url,
    this.label,
  });
}

class C {
  static const String adminPhone = 'โทร. 0809070117';
  static const String adminOnline = 'jinnawat8@gmail.com';
  static const double w = 16;
  static const double h = 16;
  // padding
  static const double p = 12;
  static const double m = 24;
  static const double s = 6;
  static const double ss = 3;
  //text
  static const double h1 = 30;
  static const double h2 = 24;
  static const double h3 = 22;
  static const double h4 = 20;
  static const double h5 = 18;
  static const double h6 = 18;
  static const double ps = 12;
  static const double pp = 16;
  static const double pm = 14;
  static String cleanImgPath(String path) {
    return path.replaceAll('.svg', '.png').replaceAll('/images/', 'images/');
  }

  static Future<SSS> basicAPIHandle(ctl, apiRes, {wrapperResult}) async {
    ctl.loading.value = true;
    SSS status;
    var res = await apiRes();
    if (res == null) {
      status = SSS.apiNull;
    } else {
      if (res.data != null) {
        if (wrapperResult != null) {
          await wrapperResult(res);
        }
        status = SSS.success;
      } else {
        status = SSS.hasError;
      }
    }
    ctl.loading.value = false;
    return status;
  }

  static Widget personWaiting({double radius = 15}) {
    return CircleAvatar(
      backgroundImage: const AssetImage('assets/images/user_waiting.jpg'),
      radius: radius,
    );
  }

  static Widget personEmpty({double radius = 15}) {
    return CircleAvatar(
      backgroundImage: const AssetImage('assets/images/empty_user.png'),
      radius: radius,
    );
  }

  static Text titleLightFont(String title, {int maxLines = 1}) {
    return Text(
      title,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 24,
        color: CC.blue,
        // fontWeight: FontWeight.bold,
      ),
    );
  }

  static Text titleFont(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        color: CC.onBackground,
        // fontWeight: FontWeight.bold,
      ),
    );
  }

  static snack({
    String? title,
    String? message,
    bool isRed = false,
  }) {
    Get.snackbar(
      't',
      't',
      boxShadows: [
        const BoxShadow(
          color: Color.fromARGB(255, 167, 167, 167),
          offset: Offset(3, 3),
          blurRadius: 2,
          spreadRadius: 0,
        ),
      ],
      titleText: Padding(
        padding: const EdgeInsets.only(
          left: 25,
        ),
        child: Text(
          title ?? 'สำเร็จ!',
          style: TextStyle(
            color: CC.onPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      messageText: Padding(
        padding: const EdgeInsets.only(
          left: 25,
        ),
        child: Text(message ?? '',
            style: TextStyle(
              color: CC.onPrimary,
              fontWeight: FontWeight.bold,
            )),
      ),
      snackPosition: SnackPosition.BOTTOM,
      icon: Padding(
        padding: const EdgeInsets.all(16),
        child: Icon(
          FontAwesomeIcons.check,
          color: CC.onPrimary,
          size: 40,
        ),
      ),
      margin: const EdgeInsets.only(bottom: 100, left: 16, right: 16),
      backgroundColor: isRed ? CC.onError : CC.onSuccess,
      dismissDirection: DismissDirection.down,
      animationDuration: Duration(
        milliseconds: 500,
      ),

      // duration: Duration(seconds:2),
    );
    // var snackBar = SnackBar(
    //   /// need to set following properties for best effect of awesome_snackbar_content
    //   elevation: 0,
    //   dismissDirection: DismissDirection.horizontal,
    //   behavior: SnackBarBehavior.floating,
    //   backgroundColor: Colors.transparent,
    //   content: AwesomeSnackbarContent(
    //     title: 'สำเร็จแล้ว!',
    //     message: message ?? '',

    //     /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
    //     contentType: ContentType.success,
    //   ),
    // );

    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Widget textNormal(
    String title, {
    double? fontSize,
    Color? color,
  }) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize ?? 14,
        color: color ?? CC.onPrimary,
      ),
    );
  }

  static Widget myText(
    String title, {
    double fontSize = 24,
    FontWeight? fontWeight = FontWeight.normal,
    double padding = 8,
    double normal = 0,
    bool blackColorText = true,
    Color? textColor,
    overflow,
    softWrap,
  }) {
    double padTop = padding * 1.5 - normal;
    if (padTop < 0) padTop = 0.0;
    return Padding(
      padding: EdgeInsets.only(top: padTop, left: padding, bottom: padding, right: padding),
      child: Text(
        title,
        overflow: overflow,
        softWrap: softWrap ?? false,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: (textColor != null) ? textColor : (blackColorText ? CC.onBackground : CC.onPrimary),
          // fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static Widget textH1(
    String title, {
    double padding = 16,
    bool blackColorText = true,
  }) {
    return myText(
      title,
      fontSize: 24,
      padding: padding,
      blackColorText: blackColorText,
    );
  }

  static Widget textH2(
    String title, {
    double padding = 14,
    bool blackColorText = true,
  }) {
    return myText(
      title,
      fontSize: 22,
      padding: padding,
      blackColorText: blackColorText,
    );
  }

  static Widget textH3(
    String title, {
    double padding = 12,
    bool blackColorText = true,
  }) {
    return myText(
      title,
      fontSize: 20,
      padding: padding,
      blackColorText: blackColorText,
    );
  }

  static Widget textH5(
    String title, {
    double padding = 10,
    bool blackColorText = true,
  }) {
    return myText(
      title,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      padding: padding,
      blackColorText: blackColorText,
    );
  }

  static Widget textH6(
    String title, {
    double padding = 10,
    double normal = 8,
    bool isBlackText = true,
    color,
  }) {
    return myText(
      title,
      fontSize: 18,
      padding: padding,
      normal: normal,
      blackColorText: isBlackText,
      textColor: color,
    );
  }

  static Widget textPPP(
    String title, {
    double padding = 8,
    double normal = 12,
    TextOverflow overflow = TextOverflow.fade,

    /// normal => 8 for normal
    bool isBlackText = true,
  }) {
    return myText(
      title,
      fontSize: 10,
      padding: padding,
      normal: normal,
      blackColorText: isBlackText,
      textColor: CC.grey6,
      overflow: overflow,
    );
  }

  static Widget textPP(
    String title, {
    double padding = 2,
    double normal = 12,
    TextOverflow overflow = TextOverflow.fade,

    /// normal => 8 for normal
    bool isBlackText = true,
    textColor,
    fontSize,
  }) {
    return myText(
      title,
      fontSize: fontSize ?? 14,
      padding: padding,
      normal: normal,
      blackColorText: isBlackText,
      textColor: textColor ?? CC.grey6,
      overflow: overflow,
    );
  }

  static Widget textPError(
    String title, {
    double padding = 8,
    double normal = 12,

    /// normal => 8 for normal
    bool isBlackText = true,
  }) {
    return myText(
      title,
      fontSize: 16,
      padding: padding,
      normal: normal,
      textColor: CC.onError,
      fontWeight: FontWeight.bold,
    );
  }

  static Widget textP(
    String title, {
    double padding = 8,
    double normal = 12,

    /// normal => 8 for normal
    bool isBlackText = true,
    textColor,
    fontWeight,
    fontSize,
    softWrap,
  }) {
    return myText(
      title,
      fontSize: fontSize ?? 16,
      padding: padding,
      normal: normal,
      blackColorText: isBlackText,
      textColor: textColor,
      fontWeight: fontWeight,
      softWrap: softWrap,
    );
  }

  static Widget iconEdit() {
    return Icon(
      FontAwesomeIcons.penToSquare,
      color: CC.grey5,
      size: 18,
    );
  }

  static Widget card({
    Color? color,
    Widget? child,
    String? image,
    double minHeight = 150,
    double minWidth = 150,
    List<Widget>? backgroundWidget,
    double padContent = 8,
    onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        color: color ?? CC.background,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(padContent),
            child: Stack(
              children: [
                SizedBox(
                  height: minHeight,
                  width: minWidth,
                ),
                ...backgroundWidget ?? [],
                (image != null)
                    ? Container(
                        child: child,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : child!,
              ],
            ),
          ),
        ),
      ),
    );
  }

  static image(path, double? width) {
    return Image.asset(
      path,
      width: width,
    );
  }

  static genContent(content) {
    int contentCount = 0;
    var text_ = {
      const Locale('th', 'us'): {
        'tel': 'โทร. ',
      },
      const Locale('en', 'us'): {
        'tel': 'Tel',
      },
    };
    var text = text_[Get.locale] as Map;
    return content.map(
      (e) {
        contentCount++;
        if (contentCount % 2 == 1) {
          if (contentCount == 1) {
            return C.textH5('$e');
          } else {
            return Column(
              children: [
                C.rowH(),
                C.textH5('$e'),
              ],
            );
          }
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ...e.map(
                (o) => Padding(
                  padding: const EdgeInsets.all(C.ss),
                  child: Builder(builder: (context) {
                    if (o.runtimeType == Call) {
                      return InkWell(
                        onTap: () {
                          launchUrl(
                            Uri.parse(
                              'tel:${o.text}',
                            ),
                            //  Uri.parse('https://pub.dev/packages/url_launcher/example'),
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        child: Text(
                          '• ${text['tel']} ${o.text}',
                          style: const TextStyle(color: Color.fromARGB(255, 1, 15, 144)),
                        ),
                      );
                    } else if (o.runtimeType == LinkUrl) {
                      if (o.label == null) {
                        return InkWell(
                          onTap: () {
                            launchUrl(
                              Uri.parse(o.url),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                          child: Text(
                            '• ${o.url}',
                            style: const TextStyle(color: Color.fromARGB(255, 1, 15, 144)),
                          ),
                        );
                      } else {
                        return InkWell(
                          onTap: () {
                            launchUrl(
                              Uri.parse(o.url),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                          child: Text(
                            '• ${o.label}',
                            style: const TextStyle(color: Color.fromARGB(255, 1, 15, 144)),
                          ),
                        );
                      }
                    } else {
                      return Text('• $o');
                    }
                  }),
                ),
              ),
              // C.rowH(),
            ],
          );
        }
      },
    );
  }

  static SizedBox rowH({double height = h}) {
    return SizedBox(height: height);
  }

  static animation() {
    return LoopAnimation<double>(
      tween: Tween(begin: 0.0, end: 10.0),
      duration: const Duration(seconds: 2),
      curve: Curves.bounceInOut,
      builder: (context, child, value) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: const Text('Hello!'),
    );
  }

  static animationReverse() {
    return MirrorAnimation<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      builder: (context, child, value) {
        return Text(
          'text',
          style: TextStyle(
            color: CC.onPrimary.withOpacity(value),
            fontSize: 16,
          ),
        );
      },
    );
  }

  static Future<DateTime?> getDate(context) {
    // Imagine that this function is
    // more complex and slow.
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: child ?? Container(),
        );
      },
    );
  }

  // static InternationalPhoneNumberInput phoneField({onInputChanged, String? labelText}) {
  //   return InternationalPhoneNumberInput(
  //     initialValue: PhoneNumber(dialCode: '+66', phoneNumber: '', isoCode: 'TH'),
  //     spaceBetweenSelectorAndTextField: 0,
  //     selectorButtonOnErrorPadding: 10,
  //     onInputChanged: onInputChanged,
  //     onInputValidated: (bool value) {
  //       if (kDebugMode) {
  //         print(value);
  //       }
  //       return;
  //     },
  //     validator: (text) {
  //       // if (kDebugMode) {
  //       //   print('data=$text');
  //       // }
  //       return;
  //     },
  //     selectorConfig: const SelectorConfig(
  //       selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
  //     ),
  //     ignoreBlank: false,
  //     autoValidateMode: AutovalidateMode.disabled,
  //     selectorTextStyle: const TextStyle(color: Colors.black),
  //     // initialValue: PhoneNumber(phoneNumber: ''),
  //     // textFieldController: ctl.dummyTextCtl,
  //     formatInput: false,
  //     keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
  //     // inputBorder: const
  //     // inputDecoration: InputDecoration(
  //     //   contentPadding: EdgeInsets.all(12),
  //     //   border: const OutlineInputBorder(),
  //     //   // hintText: 'tttt',
  //     //   labelText: labelText,
  //     //   filled: true,
  //     //   fillColor: Colors.white,
  //     //   // focusColor: Colors.green,
  //     // ),
  //     inputDecoration: InputDecoration(
  //       labelText: labelText,
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5.0),
  //       ),
  //       enabledBorder: const OutlineInputBorder(
  //         // width: 0.0 produces a thin "hairline" border
  //         borderSide: BorderSide(color: Colors.grey, width: 0.0),
  //       ),
  //       filled: true,
  //       fillColor: Colors.white,
  //     ),
  //     onSaved: (PhoneNumber number) {
  //       if (kDebugMode) {
  //         print('On Saved: $number');
  //       }
  //     },
  //   );
  // }

  static otpField({double? width, onCompleted}) {
    return OTPTextField(
      length: 6,
      width: width ?? 200,
      fieldWidth: 55,
      style: const TextStyle(
        fontSize: 24,
      ),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.box,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      onChanged: (val) {
        return;
      },
      onCompleted: onCompleted,
    );
  }

  static SizedBox rowW({double width = w}) {
    return SizedBox(width: width);
  }

  // ignore: non_constant_identifier_names
  static Toast(String title) {
    return Get.defaultDialog(title: title);
  }

  // static snack(String? title, String message) {
  //   return Get.snackbar(title ?? '', message);
  // }

  static dialogLoading() {
    return C.dialog(
      title: 'กำลังเชื่อมต่อ',
      content: Column(
        children: <Widget>[
          CircularProgressIndicator.adaptive(
            backgroundColor: CC.primary,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.white,
            ),
          ),
        ],
      ),
      actions: [],
    );
  }

  static dialogErrorTemplate() {
    return dialogError('ไม่สำเร็จ');
  }

  static dialogNotAvailable() {
    return dialogError('ยังไม่เปิดให้บริการ');
  }

  static dialogInfo(String message) {
    return dialog(
      title: '',
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  static dialogError(String message) {
    return dialog(
      title: 'ข้อผิดพลาด',
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  static Future dialog({
    String? title,
    Widget? content,
    List<Widget>? actions,
  }) {
    return Get.defaultDialog(
      title: title ?? 'Something wrong!',
      content: content ?? const Text(''),
      radius: 5.0,
      contentPadding: const EdgeInsets.all(10),
      titlePadding: const EdgeInsets.all(10),
      actions: actions ??
          [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(Get.context!);
                  },
                  child: const Text(
                    'OK',
                  ),
                ),
              ],
            )
          ],
    );
  }

  static Widget curveCont({
    required Widget child,
    double? width,
    double? height,
    Color? color,
  }) {
    return Container(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(C.m),
        child: child,
      ),
      decoration: BoxDecoration(
        color: color ?? Theme.of(Get.context!).colorScheme.primaryContainer,
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
    );
  }

  static curve(context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: const BorderRadius.all(
        Radius.circular(5.0),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  static Padding inputForm(
    TextEditingController controller, {
    required String labelText,
    required validator,
    onChanged,
    String? initialValue,
    bool? obscureText,
    bool isCenter = false,
    bool isRound = false,
    double padding = 0,
    TextInputType keyboardType = TextInputType.visiblePassword,
  }) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: TextFormField(
        onChanged: onChanged,
        keyboardType: keyboardType,
        textInputAction: TextInputAction.next,
        controller: controller,
        initialValue: initialValue,
        obscureText: obscureText ?? false,
        validator: validator,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          label: isCenter
              ? Center(
                  child: Text(labelText),
                )
              : Text(labelText),
          // labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: isRound ? BorderRadius.circular(50) : BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Colors.grey, width: 0.0),
          ),
          enabledBorder: !isRound
              ? const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                )
              : null,
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  static TextField inputBox({
    required String labelText,
    required onChanged,
    bool? obscureText,
    Color? fillColor,
    icon,
    suffixIcon,
    controller,
    textInputAction,
    // ? borderRadius,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      textInputAction: textInputAction ?? TextInputAction.send,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        icon: icon,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          // borderRadius: BorderRadius.all(Radius.circular(50))
        ),
        enabledBorder: const OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: BorderSide(color: Colors.grey, width: 0.0),
        ),
        contentPadding: const EdgeInsets.all(C.p),
        filled: true,
        fillColor: fillColor ?? Colors.white,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  static SizedBox buttonWhite(
    String text,
    onPressed, {
    double? fontSize,
    EdgeInsets? padding,
    double? width,
  }) {
    return SizedBox(
      width: width ?? 200,
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(C.p),
          child: Text(
            '$text',
            style: TextStyle(
              fontSize: fontSize ?? C.h4,
            ),
          ),
        ),
      ),
    );
  }

  static Widget buttonTest(String text, onPressed) {
    // return Container();
    return TextButton(
      onPressed: onPressed,
      child: Container(
        color: Color.fromARGB(255, 255, 208, 208),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            'test - $text',
            style: TextStyle(
              fontSize: 12,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }

  static Widget cImage(String? url) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: url ?? 'http://via.placeholder.com/400x150',
      placeholder: (context, url) => Center(
        child: SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            color: CC.primary,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  static SizedBox backButton({double? width}) {
    return C.buttonWhite(
      'กลับ',
      () {
        Get.back();
      },
      width: width,
    );
  }

  // static buttonAdd(
  //   String text,
  //   onPressed, {
  //   bool isLoading = false,
  //   Color? textColor,
  //   Color? color,
  // }) {
  //   return SizedBox(
  //     width: 80,
  //     child: ElevatedButton(
  //       onPressed: onPressed,
  //       child: isLoading
  //           ? SizedBox(
  //               width: C.pp,
  //               height: C.pp,
  //               child: CircularProgressIndicator(
  //                 color: CC.foregroundColor2,
  //               ),
  //             )
  //           : Padding(
  //               padding: const EdgeInsets.all(C.p),
  //               child: Text(
  //                 text,
  //                 style: TextStyle(
  //                   fontSize: C.h4,
  //                   color: textColor ?? CC.foregroundColor0,
  //                 ),
  //               ),
  //             ),
  //       style: ElevatedButton.styleFrom(
  //         primary: color ?? CC.bgAdd,
  //       ),
  //     ),
  //   );
  // }

  static boxx() {
    return Column(
      children: <Widget>[
        box(),
        box(),
        box(),
        box(),
      ],
    );
  }

  static box() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        width: 80,
        color: Colors.red,
      ),
    );
  }

  static Widget buttonAdd(
    onPressed, {
    double? radius,
    String? text,
    Color? color,
    iconData,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: radius ?? 40,
            width: radius ?? 40,
            child: MaterialButton(
              onPressed: onPressed,
              color: color ?? CC.primary,
              textColor: CC.onPrimary,
              child: Icon(
                iconData ?? FontAwesomeIcons.plus,
                size: 24,
              ),
              padding: const EdgeInsets.all(8),
              shape: const CircleBorder(),
            ),
          ),
          if (text != null) C.textH5(text)
        ],
      ),
    );
  }

  static buttonBackListTileTemplate() {
    return ListTile(title: buttonBackTemplate());
  }

  static Widget buttonBackTemplate({
    double? width,
  }) {
    return button(
      'กลับ',
      () {
        Get.back();
      },
      color: CC.background,
      textColor: CC.onPrimaryDisabled,
      width: width ?? 200,
    );
  }

  static buttonLight(
    String text,
    onPressed, {
    double? width,
  }) {
    return button(
      text,
      onPressed,
      color: CC.primaryLight,
      textColor: CC.onPrimary,
      width: width ?? 200,
    );
  }

  static buttonBack(
    String text,
    onPressed, {
    double? width,
  }) {
    return button(
      text,
      onPressed,
      color: CC.background,
      textColor: CC.onPrimaryDisabled,
      width: width ?? 200,
    );
  }

  static expandListTile(context) {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            initiallyExpanded: true,
            collapsedIconColor: CC.onBackground,
            title: C.textP('ttt'),
            // trailing: Text('${order.getPriceOrder().toInt()}'),
            subtitle: C.textPP('eee'),
            controlAffinity: ListTileControlAffinity.trailing,
            children: <Widget>[
              ListTile(
                leading: Image.asset('assets/images/empty_product.jpg'),
                title: C.textP(
                  '',
                ),
                subtitle: C.textP(
                  '',
                ),
                // trailing: Text(''),
              ),
            ],
          ),
        ),
        C.rowH(),
      ],
    );
  }

  static Widget hero(String tag, {Widget? child, onTap}) {
    return InkWell(
      onTap: onTap,
      child: Hero(
        tag: tag,
        child: Material(
          type: MaterialType.transparency,
          child: child,
        ),
      ),
    );
  }

  static buttonDel(
    String text,
    onPressed, {
    double? width,
  }) {
    return button(
      text,
      onPressed,
      color: Colors.red,
      textColor: Colors.white,
      width: width ?? 200,
    );
  }

  static Widget cardInkWell(
    String text,
    onTap, {
    Color? color,
    bool? isActive,
    bool isLoading = false,
    Color? textColor,
    double? width,
    Icon? icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2.0,
      ),
      child: SizedBox(
        width: width,
        child: Card(
          color: CC.background,
          child: InkWell(
            onTap: onTap,
            child: isLoading
                ? SizedBox(
                    width: C.pp,
                    height: C.pp,
                    child: CircularProgressIndicator(
                      color: CC.primary,
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon ?? Container(),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(C.p),
                          child: Text(
                            text,
                            style: TextStyle(
                              fontSize: C.h6,
                              color: textColor ?? CC.onBackground,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  static Widget iconPaper({double? scale}) {
    return Transform.scale(
      scale: scale ?? 1,
      child: CircleAvatar(
        radius: 25,
        child: Icon(
          FontAwesomeIcons.solidPaperPlane,
          color: Colors.white,
          size: 25,
        ),
        backgroundColor: CC.primaryDark,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  static Widget button(
    String text,
    onPressed, {
    Color? color,
    bool? isActive,
    bool isLoading = false,
    Color? textColor,
    double? width,
    icon,
  }) {
    // isLoading = isLoading ?? false;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2.0,
      ),
      child: SizedBox(
        width: width ?? 200,
        child: ElevatedButton(
          onPressed: onPressed,
          child: isLoading
              ? SizedBox(
                  width: C.pp,
                  height: C.pp,
                  child: CircularProgressIndicator(
                    color: CC.primary,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(C.p),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) ...[
                        icon,
                        C.rowW(),
                      ],
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: C.h6,
                          color: textColor ?? CC.onPrimary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      // C.rowW(),
                      // Icon(FontAwesomeIcons.moneyBill),
                    ],
                  ),
                ),
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? CC.primary,
          ),
        ),
      ),
    );
  }

  static Widget imageNoImage({double size = 200}) {
    return SizedBox(
      width: size,
      height: size,
      child: Image.asset(
        'assets/images/leo/leo2.png',
        fit: BoxFit.cover,
      ),
    );
  }

  static AppBar appBarSub(
    context,
    String? textTitle, {
    bottom,
    switchValue,
    bool? onSwitchTap,
  }) {
    return appBar(
      context,
      textTitle,
      showBackButton: true,
      backgroundColor: CC.primaryDark,
      onSwitchTap: onSwitchTap,
      switchValue: switchValue,
      bottom: bottom,
    );
  }

  static AppBar appBar(
    context,
    String? title, {
    Color? backgroundColor,
    Color? textColor,
    bool noMessage = false,
    bool showBackButton = false,
    onSwitchTap,
    switchValue,
    value,
    bottom,
    bool subAppBar = false,
  }) {
    return AppBar(
      backgroundColor: subAppBar ? CC.primaryLight : backgroundColor ?? CC.primary,
      foregroundColor: CC.onPrimary,
      bottom: bottom,
      title: Text(
        title ?? AppConst.name,
        style: TextStyle(color: CC.onPrimary),
      ),
      leading: (showBackButton)
          ? IconButton(
              icon: const Icon(FontAwesomeIcons.chevronLeft),
              onPressed: () {
                Get.back();
              },
            )
          : null,
      actions: [
        if (onSwitchTap != null) ...[
          Switch(
            activeColor: CC.primaryDark,
            activeTrackColor: CC.primaryLight,
            inactiveTrackColor: Colors.white,
            inactiveThumbColor: CC.grey7,
            value: switchValue ?? false,
            onChanged: onSwitchTap,
          ),
        ],

        // InkWell(
        //   child: const Text('re login'),
        //   onTap: () async {
        //     LoginCtl loginCtl = Get.find();
        //     await loginCtl.logout();
        //     await loginCtl.autoToBranchForOwner();
        //   },
        // ),
      ],
    );
  }

  // static appBar(context) {
  //   return AppBar(
  //     // backgroundColor: ColorConst.lightGray,
  //     backgroundColor: CC.darkYellow,
  //     title: const Text(
  //       'QRdrink',
  //       style: TextStyle(color: Color.fromARGB(255, 124, 75, 6)),
  //     ),
  //     foregroundColor: CC.foregroundColor1,
  //     // iconTheme: const IconThemeData(color: Colors.white),
  //     centerTitle: true,
  //     actions: [
  //       InkWell(
  //         child: const Text('re login'),
  //         onTap: () async {
  //           LoginCtl loginCtl = Get.find();
  //           await loginCtl.logout();
  //           await loginCtl.autoToBranch();
  //           Get.toNamed(Routes.home);
  //         },
  //       ),
  //     ],
  //   );
  // }

  static copy(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  static delDateTime() {
    return DateTime.now().subtract(const Duration(hours: 1));
  }
}
