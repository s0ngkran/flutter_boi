import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../shared/utils/common.dart';
import '../auth/login_ctl.dart';

class TestAPIScr extends StatelessWidget {
  TestAPIScr({Key? key}) : super(key: key);

  final LoginCtl loginCtl = Get.put(LoginCtl());
  @override
  Widget build(BuildContext context) {
    // api =   ApiRepository get api => Get.find();
    return Scaffold(
        appBar: AppBar(title: const Text('text')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ButtonTestAPI(
              title: 'login',
              onTap: () => print('hi'),
                  // loginCtl.api.login('superuser', 'superpasswordsuperpassword'),
            ),
            // ButtonTestAPI(
            //   title: 'register',
            //   onTap: () => loginCtl.api.register(
            //       'superuser', 'superpasswordsuperpassword', 'ttt', 'ttt'),
            // ),
            // ButtonTestAPI(
            //   title: 'branchs',
            //   onTap: () => loginCtl.api.fetchBranchs(),
            // ),
            C.button('login scr', () {
              Get.offAllNamed(Routes.login);
            })
          ],
        ));
  }
}

class ButtonTestAPI extends StatefulWidget {
  const ButtonTestAPI({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final Function onTap;

  @override
  State<ButtonTestAPI> createState() => _ButtonTestAPIState();
}

class _ButtonTestAPIState extends State<ButtonTestAPI> {
  bool success = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        C.button(widget.title, () async {
          var res = await widget.onTap();

          if (res == null) {
            C.dialogError('fail');
          } else {
            print('$res ${res.toJson()}');
          }
        }),
        if (success) const Text('success')
      ],
    );
  }
}
