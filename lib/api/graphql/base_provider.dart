// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../../app_config/app_const.dart';
import '../../shared/services/services.dart';
import 'package:http/http.dart' as http;

enum MyUrl { urlUser, urlQR }

class BaseProviderGraphql {
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
  Future noRefresh(apiFunc, mapFunc) async {
    final res = await apiFunc();
    if (kDebugMode) {
      print('res1 = $res');
    }
    // ignore: prefer_typing_uninitialized_variables
    var resp;
    if (res != null) {
      resp = mapFunc(res);
      if (resp.data == null) {
        return null;
      } else {
        return resp;
      }
    }
    if (kDebugMode) {
      print('cannot connect to server');
    }
    return null;
  }

  Future<Map<String, dynamic>?>? post({
    Map<String, dynamic>? data,
    String? path,
    String? query,
    bool auth = true,
    MyUrl url = MyUrl.urlQR,
  }) {
    String postUrl;
    if (url == MyUrl.urlUser) {
      postUrl = AppConst.baseUrlUser;
    } else {
      postUrl = AppConst.baseUrl;
    }
    if (path != null) {
      postUrl += path;
    }
    var request = http.Request('POST', Uri.parse(postUrl));
    if (kDebugMode) {
      print('');
      print('POST $postUrl');
      print('Auth = $auth');
      print('');
    }
    var response = apiSend(request, data: data, query: query, auth: auth);
    return response;
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

  Future<Map<String, dynamic>?>? apiSend(
    Request request, {
    Map<String, dynamic>? data,
    String? query,
    required bool auth,
  }) async {
    // handle token
    Map<String, String> headers;
    if (auth == true) {
      Request? requestX = await handleToken(request);
      if (requestX == null) return null;
    } else {
      headers = {'Content-Type': 'application/json'};
      request.headers.addAll(headers);
    }

    // body
    if (data != null) {
      request.body = json.encode(data);
    }
    if (query != null) {
      // request.body = '''{"query":"$query","variables":{}}''';
      request.body = query;
    }
    if (kDebugMode) {
      print('');
      print('---------');
      print('API send');
      print('header: ${request.headers}');
      print('body: ${request.body}');
      // inspect(json.decode(request.body.toString()));
      print('---------');
    }

    StreamedResponse? response;
    try {
      // request send
      response = await request.send();
      if (kDebugMode) {
        print('response: ${response.statusCode}');
        print('');
      }
    } on Exception catch (e) {
      print('error in request.send() $e');
    }

    Map<String, dynamic>? resp = await handleResponse(response);
    return resp;
  }

  Future<Request?>? handleToken(Request request) async {
    var token = await SS.token(BB.read);
    Map<String, String> headers;
    if (token == null || token == '') {
      print('has no token; no api sent');
      return null;
    } else {
      headers = {
        'Authorization': 'JWT $token',
        'Content-Type': 'application/json',
      };
      // print('headers=$headers');
      request.headers.addAll(headers);
      return request;
    }
  }

  Future<Map<String, dynamic>?>? handleResponse(
      StreamedResponse? response) async {
    if (response == null) {
      // C.dialog(
      //   content:
      //       const Text('Our server is being maintained.\nPlease login later.'),
      // );
      return null;
    }
    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      Map<String, dynamic> resJson = json.decode(res);
      return resJson;
    } else {
      var error = response.reasonPhrase;
      print('API status [${response.statusCode}]\nreason phase=$error');
      // C.dialog(
      //   title: 'Something wrong!',
      //   content: Text('$error'),
      // );
      return null;
    }
  }
}
