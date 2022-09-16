import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/home/home_ctl.dart';
import '../utils/common.dart';
import 'my_statelesswidget.dart';

class HeroPage extends MyStatelessWidget {
  final String? title;
  final HomeCtl ctl = Get.find();
  HeroPage({
    Key? key,
    this.title,
  }) : super(key: key);

  List<Widget> content(context) {
    return [
      const Text('This is hero page'),
    ];
  }

  @override
  Widget buildObx(BuildContext context) {
    return Scaffold(
        appBar: C.appBar(
          context,
          title ?? '',
          showBackButton: true,
          subAppBar: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            print('refresh');
            await 1.delay();
          },
          child: SizedBox.expand(
            child: GestureDetector(
              onPanUpdate: (details) {
                if (details.delta.dy > 0) {
                  Get.back();
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Visibility(
                      visible: false,
                      child: Text(ctl.dummy.value),
                    ),
                    ...content(context),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
