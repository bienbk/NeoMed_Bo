import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbo/api/api.dart';
import 'package:mbo/components/enums/order_status_enum.dart';
import 'package:mbo/components/models/order.dart';
import 'package:mbo/components/models/order/next_status.dart';
import 'package:mbo/components/models/order/state_history.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';
import 'package:mbo/core/core.dart';

class OrderInfoController extends GetxController with MboLogger {
  var orderId = '';
  var requestStatusChangeLock = false;

  var orderInfo = Order().obs;
  var orderStateHistory = OrderStateHistory().obs;
  var orderNextStatus = OrderNextStatus().obs;
  var selectedNextStatus = 0.obs;

  @override
  void onReady() {
    orderId = Get.parameters['orderId'] ?? 0 as String;
    getOrderInfo();
    super.onReady();
  }

  void getOrderInfo() {
    OrderProvider.getById(id: orderId, backOffice: true).then((value) {
      orderInfo.value = value;
    }).handleError(mboApiErrorHandler);
    OrderProvider.getStateHistory(id: orderId).then((value) {
      orderStateHistory.value = value;
    }).handleError(mboApiErrorHandler);
    OrderProvider.getBackOfficeStatus(id: orderId).then((value) {
      orderNextStatus.value = value;
      if (orderNextStatus.value.nextStatus != null) {
        selectedNextStatus.value = orderNextStatus.value.nextStatus![0].status!;
      }
    }).handleError(mboApiErrorHandler);
  }

  bool isChangableNextStatus() {
    return selectedNextStatus.value != 0 &&
        selectedNextStatus.value != orderInfo.value.orderStatus;
  }

  void onChangeSelectedNextStatus(int status) {
    selectedNextStatus.value = status;
  }

  void updateOrderStatus() {
    if (requestStatusChangeLock) return;
    requestStatusChangeLock = true;
    if (!isChangableNextStatus()) return;
    OrderProvider.putBackOfficeStatus(
            id: orderId, newStatus: selectedNextStatus.value)
        .then((_) {
      Get.snackbar("Áp dụng thành công",
          "Trạng thái ${orderStatusEnum.values[selectedNextStatus.value].enumToString}",
          icon: const Icon(
            Icons.verified,
            color: kSuccess,
          ));
      getOrderInfo();
    }).handleError((dynamic error, [StackTrace? st]) {
      if (error is DioError) {
        switch (error.response?.statusCode) {
          case 400:
            Get.snackbar("Áp dụng thất bại", "Chưa thể áp dụng trạng thái này",
                icon: const Icon(
                  Icons.error,
                  color: kError,
                ));
            break;
          case 401:
            Get.snackbar("Your session has timed out",
                "You will be redirected to login page shortly");
            app<AuthPreferences>().userToken = '';
            app<AuthPreferences>().userRefreshToken = '';
            app<AuthPreferences>().userId = 0;
            Get.offAllNamed('/login');
            return;
          default:
            break;
        }
      }
    }).then((_) {
      requestStatusChangeLock = false;
    });
  }
}
