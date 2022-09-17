import 'dart:async';

import 'package:get/get_connect/http/src/request/request.dart';

import '../../shared/services/storage_service.dart';
import 'package:http/http.dart' as http;

http.Request authInterceptor(http.Request request) {
  // final token = StorageService.box.pull(StorageItems.accessToken);

  // request.headers['X-Requested-With'] = 'XMLHttpRequest';
  // request.headers['Authorization'] = 'Bearer $token';

  final token = SS.token(BB.read);
  request.headers.addAll({
    'Authorization': 'Bearer $token',
  });
  return request;
}
