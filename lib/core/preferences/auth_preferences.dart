import 'package:mbo/core/core.dart';

class AuthPreferences {
  const AuthPreferences();

  String get userToken =>
      app<MboSharedPreferences>().getString('userToken', '');
  set userToken(String value) =>
      app<MboSharedPreferences>().setString('userToken', value);

  int get userId => app<MboSharedPreferences>().getInt('userId', -1);
  set userId(int value) => app<MboSharedPreferences>().setInt('userId', value);

  int get userSessionId =>
      app<MboSharedPreferences>().getInt('userSessionId', -1);
  set userSessionId(int value) =>
      app<MboSharedPreferences>().setInt('userSessionId', value);

  String get userRefreshToken =>
      app<MboSharedPreferences>().getString('userRefreshToken', '');
  set userRefreshToken(String value) =>
      app<MboSharedPreferences>().setString('userRefreshToken', value);
}
