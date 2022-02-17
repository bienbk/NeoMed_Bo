import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:mbo/components/bindings/bindings.dart';
import 'package:mbo/components/screens/order/order_info_screen.dart';
import 'package:mbo/components/screens/order/order_list_product/order_list_product_screen.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';
import 'components/controllers/controllers.dart';
import 'components/screens/screens.dart';
import 'core/core.dart';

class Mbo extends StatelessWidget {
  const Mbo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen size for normalize font and widget size later.
    // Material App.
    return ScreenUtilInit(
      designSize: const Size(375, 801),
      minTextAdapt: true,
      builder: () => GetMaterialApp(
          onInit: () {
            Get.put<AppController>(AppController(), permanent: true);
          },
          title: 'mbo',
          initialRoute:
              app<AuthPreferences>().userToken.isNotEmpty ? '/' : '/login',
          getPages: [
            GetPage(
                name: '/login',
                page: () => const LoginScreen(),
                binding: LoginBinding()),
            GetPage(
                name: '/',
                page: () => const HomeScreen(),
                binding: HomeBinding()),
            GetPage(
              name: '/report',
              page: () => const ReportScreen(),
            ),
            GetPage(
                name: '/order',
                page: () => const OrderScreen(),
                children: <GetPage>[
                  GetPage(
                      name: '/:orderId', page: () => const OrderInfoScreen()),
                  GetPage(
                      name: '/:orderId/list_product',
                      page: () => const OrderListProductScreen())
                ]),
          ],
          builder: EasyLoading.init(),
          theme: MboThemeData().getTheme),
    );
  }
}
