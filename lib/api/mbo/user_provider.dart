import 'package:mbo/api/api.dart';
import 'package:mbo/components/models/user_info.dart';
import 'package:mbo/core/core.dart';

class UserProvider {
  static Future<UserInfo> getUserById({
    required int id,
  }) =>
      app<DioService>()
          .getInstance()
          .get(ApiPath.user.base + id.toString())
          .then((value) => UserInfo.fromJson(value.data));
}
