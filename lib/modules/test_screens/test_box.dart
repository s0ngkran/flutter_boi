import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/utils/common.dart';
import '../../shared/utils/my_controller.dart';
import '../../shared/utils/my_view.dart';

class TestBoxCtl extends MyCtl {
  var text = ''.obs;
  var show = ''.obs;
}

class TextBoxScreen extends View<TestBoxCtl> {
  TextBoxScreen({Key? key}) : super(key: key);
  final keyScroll = GlobalKey();

  @override
  buildObx(context) {
    return Scaffold(
        appBar: C.appBar(context, null),
        body: SingleChildScrollView(
          key: keyScroll,
          child: Column(
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    // Get.toNamed(Routes.first);
                  },
                  child: const Text('go to first page')),
              Text('text=${ctl.text.value}'),
              TextField(
                onChanged: (text) => ctl.text.value = text,
                decoration: const InputDecoration(
                  labelText: 'hello',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // box.write('555', '${ctl.text.value}');
                  // print('box write --${ctl.text.value}');
                  print('nothing');
                },
                child: const Text('write'),
              ),
              ElevatedButton(
                onPressed: () {
                  // String a = box.read('555');
                  // ctl.show.value = a;
                  // print('box read -$a-');
                  print('nothing');
                },
                child: Text('read => ${ctl.show}'),
              ),
              /////////////////////test lang
              ///
              SizedBox(
                height: 20,
              ),
              Text('language ${Get.locale}'),
              Row(
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        Get.updateLocale(const Locale('th', 'us'));
                        print(Get.locale);
                      },
                      child: const Text('th_us')),
                  ElevatedButton(
                      onPressed: () {
                        Get.updateLocale(const Locale('en', 'us'));
                        print(Get.locale);
                      },
                      child: const Text('en_us')),
                ],
              ),
            ],
          ),
        ));
  }
}
