import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mbo/api/mbo/auth_provider.dart';
import 'package:mbo/components/models/auth_token.dart';
import 'package:mbo/core/core.dart';

class AuthController extends GetxController with MboLogger {
  var authState = AuthToken(
          refreshToken: app<AuthPreferences>().userRefreshToken,
          token: app<AuthPreferences>().userToken,
          id: app<AuthPreferences>().userSessionId,
          userId: app<AuthPreferences>().userId)
      .obs;
  var user = ''.obs;
  var password = ''.obs;

  bool get isAuthenticated => authState.value.token == '';

  void setUser(String user) {
    this.user.value = user;
  }

  void setPassword(String password) {
    this.password.value = password;
  }

  void login() {
    EasyLoading.show(status: 'Loading...');
    AuthProvider.login(user.value, password.value).then((value) {
      authState.update((val) {
        val!.token = value.token;
      });
      app.get<AuthPreferences>().userToken = value.token;
      app.get<AuthPreferences>().userRefreshToken = value.refreshToken;
      app.get<AuthPreferences>().userId = value.userId;
      EasyLoading.dismiss();
      Get.offAllNamed('/');
    }).catchError((onError) {
      EasyLoading.dismiss();
      EasyLoading.showError(
        'Đăng nhập thất bại. Vui lòng kiểm tra thông tin tài khoản !',
        duration: const Duration(seconds: 3),
        dismissOnTap: true,
      );
      throw onError;
    }).handleError;
  }

  void checkLoginStatus() {
    if (app<AuthPreferences>().userToken.isNotEmpty) {
      Get.offAllNamed('/');
    }
  }

  @override
  void onInit() {
    log.fine('Check login status');
    checkLoginStatus();
    super.onInit();
  }
}
