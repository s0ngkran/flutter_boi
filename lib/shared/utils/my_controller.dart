import 'package:get/get.dart';

import '../../api/api_repository.dart';

abstract class MyCtl extends GetxController {
  ApiRepository get api => Get.find();
}
