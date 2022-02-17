import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbo/api/api.dart';
import 'package:mbo/api/mbo/product_provider.dart';
import 'package:mbo/components/models/order.dart';
import 'package:mbo/components/models/order/update_order_item.dart'
    as updateOrderItem;
import 'package:mbo/components/models/order_item.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';
import 'package:mbo/core/core.dart';

class OrderListProductController extends GetxController with MboLogger {
  OrderListProductController();

  var orderId = '';
  var orderInfo = Order();
  var orderListItem = RxList<OrderItem>([]);
  var textEditorValue = -1;
  var applyChangeLock = false;
  @override
  void onReady() {
    orderId = Get.parameters['orderId'] ?? 0 as String;
    getOrderInfo();
    super.onReady();
  }

  void getOrderInfo() {
    OrderProvider.getById(id: orderId, backOffice: true).then((value) {
      orderInfo = value;
      orderListItem.value = orderInfo.getOrderItems;
    }).handleError(mboApiErrorHandler);
  }

  void textEditorOnChanged(int value, int index) {
    if (orderListItem[index].quantity != value) {
      textEditorValue = value;
    }
  }

  void textEditorOnSubmitted(int index) {
    if (orderListItem[index].quantity != textEditorValue) {
      ProductProvider.getBo(
              id: (orderListItem[index].productId ?? 0).toString(),
              customerId: orderInfo.userId,
              quantity: textEditorValue.toString())
          .then((value) {
        orderListItem[index].price = value.price;
        orderListItem[index].priceSale = value.salePrice;
        orderListItem[index].quantity = textEditorValue;
        update();
      }).handleError();
    }
  }

  void applyChange() {
    if (applyChangeLock) return;
    applyChangeLock = true;
    updateOrderItem.UpdateOrderItem newItem = updateOrderItem.UpdateOrderItem(
        changedBy: app<AuthPreferences>().userId.toString(),
        noted: '',
        orderItems: []);
    newItem.orderItems = orderListItem
        .map((element) => updateOrderItem.OrderItem(
            id: element.id,
            desc: element.productDesc,
            distributorId: element.distributorId,
            image: element.productImage,
            originPrice: element.price,
            paymentType: element.paymentType,
            price: element.priceSale,
            productId: element.productId,
            productName: element.productImage,
            productType: element.productType,
            qty: element.quantity,
            selectedAt: element.selectedAt))
        .toList();
    OrderProvider.putItems(id: orderId, backOffice: true, data: newItem)
        .then((_) {
      Get.snackbar("Success", "Đã áp dụng thành công thay đổi",
          icon: const Icon(
            Icons.verified,
            color: kSuccess,
          ));
    }).onError((_, __) {
      Get.snackbar("Error", "Không thể áp dụng thay đổi",
          icon: const Icon(
            Icons.error,
            color: kError,
          ));
    }).then((_) {
      applyChangeLock = false;
    });
  }
}
