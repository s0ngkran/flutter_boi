import 'base_provider.dart';

class ApiProviderGraphql extends BaseProviderGraphql {
  // Future<Response> register(String path, RegisterRequest data) {
  //   return post(path, data.toJson());
  // }

  Future<Map<String, dynamic>?>? getRefreshToken(
    String refreshToken,
  ) {
    String query =
        '''{"query":"mutation{\\n  refreshToken(refreshToken: \\"$refreshToken\\"){\\n    success\\n    errors\\n    token\\n    refreshToken\\n  }\\n}\\n\\n  ","variables":{}}''';
    return post(
      query: query,
      auth: true,
    );
  }

  Future<Map<String, dynamic>?>? login(
    String username,
    String password,
  ) {
    String query =
        '''{"query":"mutation {\\n  tokenAuth(username: \\"$username\\", password: \\"$password\\") {\\n    token\\n    success\\n    errors\\n    user {\\n      id\\n      lastLogin\\n      username\\n      nickname\\n      firstName\\n      lastName\\n      dateJoined\\n      email\\n      level\\n      ownerFk{\\n        id\\n      }\\n      chainManagerFk{\\n        id\\n      }\\n      managerFk{\\n        id\\n      }\\n      branchFk\\n      exp\\n      tel\\n      address\\n      facebook\\n      line\\n      ig\\n      workingStatus\\n      profileImageUrl\\n    }\\n    refreshToken\\n  }\\n}","variables":{}}''';

    return post(query: query, auth: false, url: MyUrl.urlUser);
  }

  Future<Map<String, dynamic>?>? me() {
    String query =
        '''{"query":"query{\\n  me {\\n    id\\n    lastLogin\\n    username\\n    nickname\\n    firstName\\n    lastName\\n    dateJoined\\n    email\\n    level\\n    ownerFk {\\n      id\\n    }\\n    chainManagerFk {\\n      id\\n    }\\n    managerFk {\\n      id\\n    }\\n    branchFk\\n    exp\\n    tel\\n    address\\n    facebook\\n    line\\n    ig\\n    workingStatus\\n    profileImageUrl\\n  }\\n}\\n\\n","variables":{}}''';

    return post(query: query, auth: true, url: MyUrl.urlUser);
  }

  // Future<Map<String, dynamic>?>? loginMobileClient(String path, LoginReq data) {
  //   // print('aaa-${data.toMap().toString()}');
  //   return post(path, data.toMap(), auth: false);
  // }

  // Future<Map<String, dynamic>?>? patchPassport(String path, PassportReq data) {
  //   // print('aaa-${data.toMap().toString()}');
  //   return post(path, data.toMap());
  // }

  // Future<Map<String, dynamic>?>? forgotPasswordOTP(String path, String username) {
  //   return post(path, {'username': username});
  // }

  // Future<Map<String, dynamic>?>? confirmNewPasswordPhone(String path, RequestNewPasswordPhoneReq data) {
  //   // print('aaa-${data.toMap().toString()}');
  //   return post(path, data.toMap());
  // }

  // Future<Map<String, dynamic>?>? confirmNewPasswordEmail(String path, RequestNewPasswordEmailReq data) {
  //   // print('aaa-${data.toMap().toString()}');
  //   return post(path, data.toMap());
  // }

  // Future<Map<String, dynamic>?>? signUpOTP(String path, SignUpOtpReq data) {
  //   // print('aaa-${data.toMap().toString()}');
  //   return post(path, data.toMap());
  // }

  // Future<Map<String, dynamic>?>? signUpPhone(String path, SignUpReq data) {
  //   // print('aaa-${data.toMap().toString()}');
  //   return post(path, data.toMap());
  // }

  // Future<Map<String, dynamic>?>? changePassword(String path, ChangePasswordReq data) {
  //   // print('aaa-${data.toMap().toString()}');
  //   return post(path, data.toMap());
  // }
}
