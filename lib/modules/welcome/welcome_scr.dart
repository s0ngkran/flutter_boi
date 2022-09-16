import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../shared/utils/common.dart';
import '../../shared/utils/my_view.dart';
import '../../shared/widgets/my_statelesswidget.dart';
import 'welcome_ctl.dart';

class WelcomeScr extends View<WelcomeCtl> {
  const WelcomeScr({Key? key}) : super(key: key);

  @override
  Widget buildObx(BuildContext context) {
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: false,
              child: Text(ctl.dummy.value),
            ),
            const Text('QRdrink'),
          ],
        ),
      ],
    ));
  }
}
