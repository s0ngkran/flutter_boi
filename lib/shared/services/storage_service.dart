import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


// Storage Service
class SS extends GetxService {
  Future<bool> init() async {
    // return await SharedPreferences.getInstance();
    var res = await GetStorage.init();
    // ignore: unused_local_variable
    GetStorage box = Get.put(GetStorage());

    // example write and read from storage
    // box.write('token', 'naohenuhaoheurh');
    // var token = box.read('token');

    if (kDebugMode) {
      print('init GetStorage res=$res');
    }
    return res;
  }

  static myBox(BB action, String key, {data}) async {
    var box = Get.find<GetStorage>();
    if (action == BB.write) {
      box.write(key, data ?? ''); // future
    } else if (action == BB.read) {
      return box.read(key); // dynamic
    }
    return null; // null
  }

  static token(BB action, {String? token}) {
    return myBox(action, StorageKey.token, data: token);
  }

  static refreshToken(BB action, {String? refreshToken}) {
    return myBox(action, StorageKey.refreshToken, data: refreshToken);
  }

  static mobileClientToken(BB action, {String? token}) {
    return myBox(action, StorageKey.mobileClientToken, data: token);
  }

  // static profile(BB action, {User? data}) {
  //   return myBox(action, StorageKey.profile, data: data);
  // }

  static currentBranchId(BB action, {String? id}) {
    return myBox(action, StorageKey.currentBranchId, data: id);
  }
}

enum BB { write, read }

class StorageKey {
  static const token = 'token_a_b';
  static const refreshToken = 'refresh_token_a_b';
  static const mobileClientToken = 'token_mobile_client';
  static const profile = 'profile';
  static const currentBranchId = 'current_branch_id';
}
