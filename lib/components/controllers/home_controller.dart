import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mbo/components/models/user_info.dart';
import 'package:mbo/core/core.dart';
import 'package:mbo/api/api.dart';

class HomeController extends GetxController with MboLogger {
  var userInfo = UserInfo(
          id: 0,
          username: "",
          password: "",
          email: "",
          firstName: "",
          lastName: "",
          gender: "",
          mobile: "",
          mobileVerified: false,
          nationalId: "",
          nationalIdVerified: false,
          recoveryQuestions: "",
          recoveryQuestionsSet: false,
          roles: "",
          active: false,
          socialLogin: false,
          language: 'vn',
          address: "",
          enabled: false,
          authenticatorSecret: "",
          country: 'vn',
          distributorId: 0)
      .obs;
  var todayOrderCount = 0.obs;
  var todayRevenue = 0.obs;
  var text = 0.obs;

  void logout() {
    app<AuthPreferences>().userToken = '';
    app<AuthPreferences>().userRefreshToken = '';
    app<AuthPreferences>().userId = 0;
    Get.offAllNamed('/login');
  }

  void navigateToReportScreen() {
    Get.toNamed('/report');
  }

  void navigateToOrderScreen() {
    Get.toNamed('/order');
  }

  @override
  void onReady() async {
    String today = Jiffy(DateTime.now()).format('dd-MM-yyyy');
    String agos =
        Jiffy(DateTime.now()).subtract(months: 5).format('dd-MM-yyyy');

    await UserProvider.getUserById(id: app<AuthPreferences>().userId)
        .then((value) => userInfo.value = value)
        .handleError();
    await Future.wait([
      ReportProvider.getWalletCashin(
              fromAt: agos,
              toAt: today,
              cashinType: 0,
              distributorId: userInfo.value.distributorId)
          .then((value) {
        return value.totalAmount;
      }),
      ReportProvider.getOrdersRevenuesStatistic(
              revenueType: 2,
              fromAt: agos,
              toAt: today,
              distributorId: userInfo.value.distributorId)
          .then((value) => value.totalNetIncome),
      OrderProvider.getBackOffice(
              fromAt: agos,
              toAt: today,
              distributorId: userInfo.value.distributorId)
          .then((value) => value.pagination?.total)
    ]).then((value) {
      todayOrderCount.value = value[2] ?? 0;
      todayRevenue.value = (value[0] ?? 0) + (value[1] ?? 0);
      update();
    }).handleError();

    super.onReady();
  }
}
