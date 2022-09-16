import 'package:get/get.dart';

import 'app_service.dart';
import 'shared/services/services.dart';

class DenpendencyInjection {
  static Future<void> init() async {
    await Get.putAsync(
      () => SS().init(),
    );
  }
}
