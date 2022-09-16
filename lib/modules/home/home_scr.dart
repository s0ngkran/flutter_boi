import 'package:flutter/material.dart';
import 'template_home_scr.dart';

class HomeScr extends TemplateHomeScr {
  HomeScr({Key? key}) : super('หน้าหลัก', key: key);

  @override
  List<Widget> content(context) {
    // GoogleSignInAccount? user = app.googleUser?.value;
    return [
      const Text('from home scr'),
    ];
  }
}
