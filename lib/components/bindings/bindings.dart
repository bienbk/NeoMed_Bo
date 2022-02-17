import 'package:get/get.dart';
import 'package:mbo/components/controllers/controllers.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CommonController>(CommonController(), permanent: true);
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
