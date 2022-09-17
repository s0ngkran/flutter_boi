import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;

MyResponse responseInterceptor(
    http.Request request, http.StreamedResponse response) {
  if (response.statusCode != 200) {
    if (kDebugMode) {
      print('API error');
      print('statusCode=${response.statusCode} [${response.reasonPhrase}]');
    }
    return MyResponse(
      success: false,
      errorMessage: '${response.reasonPhrase}',
      response: response,
    );
  }

  return MyResponse(
    success: true,
    response: response,
  );
}

class MyResponse {
  final bool success;
  final String? errorMessage;
  final http.StreamedResponse? response;

  MyResponse({
    required this.success,
    this.errorMessage,
    this.response,
  });
  Future<String> get read async => await response!.stream.bytesToString();
}
