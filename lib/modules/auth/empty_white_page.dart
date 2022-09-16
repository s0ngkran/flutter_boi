import 'package:flutter/material.dart';

import '../../shared/utils/common.dart';
import 'login_ctl.dart';

class EmptyWhiteScr extends StatelessWidget {
  final LoginCtl ctl;
  const EmptyWhiteScr({
    Key? key,
    required this.ctl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: C.appBar(
          context,
          'สมัครสมาชิก',
          showBackButton: true,
        ),
        body: Column(
          children: <Widget>[
            Text(ctl.dummy.value),
            const Text('text'),
          ],
        ));
  }
}
