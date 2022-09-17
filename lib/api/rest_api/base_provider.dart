// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:myboi/api/api.dart';

import '../../app_config/app_const.dart';
import '../../shared/services/services.dart';
import 'package:http/http.dart' as http;

enum HTTPMethod { post, patch }

extension MyHTTPMethod on HTTPMethod {
  String get str {
    switch (this) {
      case HTTPMethod.post:
        return 'POST';
      case HTTPMethod.patch:
        return 'PATCH';
      default:
        throw 'Unknown method';
    }
  }
}

class BaseProviderRest {
  // @override
  // void onInit() {
  //   httpClient.baseUrl = ApiConstants.baseUrl;
  //   httpClient.addAuthenticator(authInterceptor);
  //   httpClient.addRequestModifier(requestInterceptor);
  //   httpClient.addResponseModifier(responseInterceptor);
  // }

  // Future<Map<String, dynamic>?>? get(String url, {bool auth = true}) {
  //   var request = http.Request('GET', Uri.parse(ApiConstants.baseUrl + url));
  //   return apiSend(request, data: null, auth: auth);
  // }

  Future<MyResponse> get(
    String path, {
    // Map<String, dynamic>? data,
    bool auth = true,
  }) async {
    http.Request request = http.Request('GET', Uri.parse(AppConst.baseUrl + path));
    request.headers.addAll({
      'Content-Type': 'application/json',
    });
    request = auth ? authInterceptor(request) : request;
    http.StreamedResponse response;
    try {
      response = await request.send();
      return responseInterceptor(request, response);
    } catch (e) {
      // connect error
      return MyResponse(
        success: false,
        errorMessage: 'connection error',
        // response: response,
      );
    }
  }

  Future<MyResponse> post(
    String path,
    Map<String, dynamic> data, {
    bool auth = true,
    HTTPMethod method = HTTPMethod.post,
  }) async {
    http.Request request = http.Request(method.str, Uri.parse(AppConst.baseUrl + path));
    request.headers.addAll({
      'Content-Type': 'application/json',
    });
    request = auth ? authInterceptor(request) : request;
    request.body = json.encode(data);
    http.StreamedResponse response;
    try {
      response = await request.send();
      return responseInterceptor(request, response);
    } catch (e) {
      // connect error
      return MyResponse(
        success: false,
        errorMessage: 'connection error',
        // response: response,
      );
    }
  }
  // Future<Map<String, dynamic>?>? patch(String url, Map<String, dynamic> data, {bool auth = true}) {
  //   var request = http.Request('PATCH', Uri.parse(ApiConstants.baseUrl + url));
  //   return apiSend(request, data: data, auth: auth);
  // }

  // Future<Map<String, dynamic>?>? put(
  //   String url,
  //   Map<String, dynamic> data, {
  //   bool auth = true,
  //   MyUrl baseUrl = MyUrl.urlQR,
  // }) {
  //   var baseUrl;
  //   if (baseUrl == MyUrl.urlQR) {
  //     baseUrl = ApiConstants.baseUrl;
  //   } else {
  //     baseUrl = ApiConstants.baseUrlUser;
  //   }
  //   var request = http.Request('PUT', Uri.parse(baseUrl + url));
  //   return apiSend(request, data: data, auth: auth);
  // }
}
