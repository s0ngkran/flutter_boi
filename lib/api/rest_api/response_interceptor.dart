import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

// import '../../models/response/error_response.dart';

FutureOr<dynamic> responseInterceptor(Request request, Response response) async {
  // EasyLoading.dismiss();

  if (response.statusCode != 200) {
    // var message = ErrorResponse(error: '${response.body}');
    print('API error');
    print('statusCode=${response.statusCode} [${response.body}]');
    return response;
  }

  return response;
}

