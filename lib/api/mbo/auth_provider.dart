import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:mbo/api/constants/api_path.dart';
import 'package:mbo/components/models/auth_token.dart';
import 'package:mbo/core/core.dart';

class AuthProvider {
  static Future<AuthToken> login(String user, String password) =>
      app<DioService>()
          .getInstance()
          .post(ApiPath.auth.token,
              data: jsonEncode({
                "Username": user,
                "Password": md5.convert(utf8.encode(password)).toString(),
                "Code": "",
                "RememberMe": false
              }))
          .then((value) {
        return AuthToken.fromJson(value.data);
      }).catchError((onError) {
        throw onError;
      });
}
