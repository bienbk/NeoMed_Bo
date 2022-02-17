import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';
import 'package:mbo/core/core.dart';

class AppController extends GetxController with MboLogger {
  void _showDialog() {
    Get.defaultDialog(
        title: 'Cảnh báo',
        middleText: 'Ứng dụng cần có kết nối internet để hoạt động',
        backgroundColor: kGray1,
        titleStyle: const TextStyle(color: kWhite),
        middleTextStyle: const TextStyle(color: kWhite),
        barrierDismissible: false,
        confirm: TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'OK',
              style: TextStyle(color: kWhite),
            )),
        confirmTextColor: kWhite,
        radius: 6.0);
  }

  @override
  void onInit() async {
    app<MboSharedPreferences>().initialize();
    var _networkStatus = await Connectivity().checkConnectivity();
    if (_networkStatus == ConnectivityResult.none) {
      _showDialog();
    }
    Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        _showDialog();
      }
    });
    app<ConnectivityService>().initialize();
    super.onInit();
  }
}
