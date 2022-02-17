import 'package:mbo/api/api.dart';
import 'package:mbo/components/models/order.dart';
import 'package:mbo/components/models/order/back_offices.dart';
import 'package:mbo/components/models/order/next_status.dart';
import 'package:mbo/components/models/order/state_history.dart';
import 'package:mbo/components/models/order/update_order_item.dart';
import 'package:mbo/core/core.dart';

class OrderProvider {
  static Future<BackOffices> getBackOffice(
          {int? page,
          int? size,
          String? status,
          int? subStatus,
          int? distributorId,
          String? fromAt,
          String? toAt}) =>
      app<DioService>()
          .getInstance()
          .get(ApiPath.order.backOffices,
              queryParameters: {
                'size': size,
                'page': page,
                'subStatus': subStatus,
                'status': status,
                'distributorId': distributorId,
                'fromAt': fromAt,
                'toAt': toAt,
              }..removeWhere((key, value) => value == null))
          .then((value) => BackOffices.fromJson(value.data));

  static Future<Order> getById({
    required String id,
    bool? backOffice,
  }) =>
      app<DioService>()
          .getInstance()
          .get(ApiPath.order.base + id,
              queryParameters: {'id': id, 'backOffice': backOffice}
                ..removeWhere((key, value) => value == null))
          .then((value) {
        return Order.fromJson(value.data['order']);
      });

  static Future<OrderStateHistory> getStateHistory({
    required String id,
  }) =>
      app<DioService>().getInstance().get(ApiPath.order.stateHistories + id,
          queryParameters: {
            'orderId': id
          }).then((value) => OrderStateHistory.fromJson(value.data));

  /// Get the next fulfillment status
  /// *Note for one that create swagger doc: Did you eyes bugged?
  static Future<OrderNextStatus> getBackOfficeStatus({
    required String id,
  }) =>
      app<DioService>().getInstance().get(ApiPath.order.backOfficesStatus + id,
          queryParameters: {
            'orderId': id
          }).then((value) => OrderNextStatus.fromJson(value.data));

  /// Update (append) new status to the order, the receive the next status.
  static Future<OrderNextStatus> putBackOfficeStatus(
          {required String id,
          required int newStatus,
          int? newPaymentStatus,
          int? paymentAt,
          String? extData}) =>
      app<DioService>()
          .getInstance()
          .put(ApiPath.order.backOfficesStatus + id,
              queryParameters: {
                'orderId': id,
                'newStatus': newStatus,
                'newPaymentStatus': newPaymentStatus,
                'paymentAt': paymentAt,
                'extData': extData
              }..removeWhere((key, value) => value == null))
          .then((value) => OrderNextStatus.fromJson(value.data));

  static Future<Order> putItems(
          {required String id,
          required bool backOffice,
          required UpdateOrderItem data}) =>
      app<DioService>()
          .getInstance()
          .put(ApiPath.order.items + id,
              queryParameters: {'orderId': id, 'backOffice': backOffice}
                ..removeWhere((key, value) => value == null),
              data: data.toJson())
          .then((value) {
        if (value.data['success']) {
          return Order.fromJson(value.data['order']);
        }
        throw Exception('request failed');
      });
}
