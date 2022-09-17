import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:myboi/api/response_model/board_res/board_res.dart';
import 'package:myboi/api/response_model/create_board_req.dart';
import 'package:myboi/api/response_model/create_board_res/create_board_res.dart';
import 'package:myboi/api/response_model/update_board_req.dart';
import 'package:myboi/api/rest_api/api_provider.dart';
import 'package:myboi/api/rest_api/response_interceptor.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});
  final ApiProviderRest apiProvider;

  Future<BoardRes?> getBoard() async {
    MyResponse myResp = await apiProvider.getBoard();
    var resp = !myResp.success ? null : BoardRes.fromJson(await myResp.read);
    return resp;
  }

  Future<CreateBoardRes?> createBoard(CreateBoardReq data) async {
    MyResponse myResp = await apiProvider.createBoard(data);
    var resp =
        !myResp.success ? null : CreateBoardRes.fromJson(await myResp.read);
    return resp;
  }

  /// same resp result with create
  Future<CreateBoardRes?> updateBoard(UpdateBoardReq data) async {
    MyResponse myResp = await apiProvider.updateBoard(data);
    var resp =
        !myResp.success ? null : CreateBoardRes.fromJson(await myResp.read);
    return resp;
  }

  // Future<RegisterResponse?> register(RegisterRequest data) async {
  //   final res = await apiProvider.register('/api/register', data);
  //   if (res.statusCode == 200) {
  //     return RegisterResponse.fromJson(res.body);
  //   }
  //   return null;
  // }

  // Future<LoginRes?> login(String username, String password) async {
  //   final res = await apiProvider.login(username, password);
  //   if (res != null) {
  //     return LoginRes.fromJson(res);
  //   }
  //   return null;
  // }

  // Future<MeRes?> me() async {
  //   final res = await apiProvider.me();
  //   if (res != null) {
  //     return MeRes.fromJson(res);
  //   }
  //   return null;
  // }

  ////////////////////////// template
  // Future refresh() async {
  //   /// get refresh token
  //   String? refreshToken = await SS.refreshToken(BB.read);
  //   // RefreshTokenRes? refreshTokenRes = await doRefreshToken(refreshToken ?? '');
  //   final res = await apiProvider.getRefreshToken(refreshToken ?? '');
  //   RefreshTokenRes? refreshTokenRes;
  //   if (res != null) {
  //     refreshTokenRes = RefreshTokenRes.fromJson(res);
  //   } else {
  //     refreshTokenRes = null;
  //   }
  //   // update token and refresh token
  //   await SS.token(BB.write, token: refreshTokenRes?.data?.refreshToken?.token);
  //   await SS.refreshToken(BB.write,
  //       refreshToken: refreshTokenRes?.data?.refreshToken?.refreshToken);
  // }

  // Future refreshTokenIfNull(apiFunc, mapFunc) async {
  //   final res = await apiFunc();
  //   if (kDebugMode) {
  //     print('res1 = $res');
  //   }
  //   // ignore: prefer_typing_uninitialized_variables
  //   var resp;
  //   // ignore: prefer_typing_uninitialized_variables
  //   var resp2;
  //   if (res != null) {
  //     resp = mapFunc(res);
  //     if (resp.data == null) {
  //       await refresh();
  //       final res2 = await apiFunc();
  //       if (kDebugMode) {
  //         print('res2 = $res2');
  //       }
  //       if (res2 != null) {
  //         resp2 = mapFunc(res);
  //         return resp2;
  //       } else {
  //         return null;
  //       }
  //     } else {
  //       return resp;
  //     }
  //   }
  //   if (kDebugMode) {
  //     print('cannot connect to server');
  //   }
  //   return null;
  // }

}
