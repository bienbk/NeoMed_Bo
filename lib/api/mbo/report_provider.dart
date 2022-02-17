import 'package:mbo/api/api.dart';
import 'package:mbo/components/models/report/ReportBalance.dart';
import 'package:mbo/components/models/report/ReportCustomer.dart';
import 'package:mbo/components/models/report/ReportOrderRevenuesStatistic.dart';
import 'package:mbo/components/models/report/ReportOrders.dart';
import 'package:mbo/components/models/report/ReportWalletCashin.dart';
import 'package:mbo/components/models/report/VoucherHistogram.dart';
import 'package:mbo/components/models/report/Vouchers.dart';
import 'package:mbo/core/core.dart';

class ReportProvider {
  static Future<ReportOrders> getOrders(
          {int? size,
          int? page,
          String? orderId,
          String? status,
          String? paymentStatus,
          String? orderBy,
          String? fromAt,
          String? toAt,
          int? distributorId,
          String? productName,
          int? productId,
          int? customerId}) =>
      app<DioService>()
          .getInstance()
          .get(ApiPath.report.orders,
              queryParameters: {
                'size': size,
                'page': page,
                'orderId': orderId,
                'status': status,
                'paymentStatus': paymentStatus,
                'orderby': orderBy,
                'fromAt': fromAt,
                'toAt': toAt,
                'distributorId': distributorId,
                'productName': productName,
                'productId': productId,
                'customerId': customerId
              }..removeWhere((key, value) => value == null))
          .then((value) => ReportOrders.fromJson(value.data));

  static Future<ReportWalletCashin> getWalletCashin(
          {required String fromAt,
          required String toAt,
          int? distributorId,
          int? customerId,
          int? cashinType,
          int? size,
          int? page}) =>
      app<DioService>()
          .getInstance()
          .get(ApiPath.report.walletCashin,
              queryParameters: {
                'fromAt': fromAt,
                'toAt': toAt,
                'distributorId': distributorId,
                'customerId': customerId,
                'cashinType': cashinType,
                'size': size,
                'page': page
              }..removeWhere((key, value) => value == null))
          .then((value) => ReportWalletCashin.fromJson(value.data));

  static Future<ReportOrderRevenuesStatistic> getOrdersRevenuesStatistic(
          {required int revenueType,
          required String fromAt,
          required String toAt,
          int? distributorId,
          int? page,
          int? size,
          int? type}) =>
      app<DioService>()
          .getInstance()
          .get(ApiPath.report.ordersRevenuesStatistic, queryParameters: {
        'fromAt': fromAt,
        'toAt': toAt,
        'distributorId': distributorId,
        'revenueType': revenueType,
        'size': size,
        'page': page,
        'type': type
      }).then((value) => ReportOrderRevenuesStatistic.fromJson(value.data));

  static Future<ReportBalance> getWalletsBalance(
          {required int distributorId}) =>
      app<DioService>().getInstance().get(ApiPath.report.walletsBalance,
          queryParameters: {
            "distributorId": distributorId
          }).then((value) => ReportBalance.fromJson(value.data));

  static Future<ReportCustomer> getCustomerTx(
          {required String fromAt,
          required String toAt,
          int? distributorId,
          int? size,
          int? page}) =>
      app<DioService>()
          .getInstance()
          .get(ApiPath.report.customersTx,
              queryParameters: {
                'fromAt': fromAt,
                'toAt': toAt,
                'distributorId': distributorId,
                'page': page,
                'size': size
              }..removeWhere((key, value) => value == null))
          .then((value) => ReportCustomer.fromJson(value.data));

  static Future<VoucherHistogram> getVouchersHistogram(
          {required String fromAt,
          required String toAt,
          int? distributorId,
          String? status}) =>
      app<DioService>()
          .getInstance()
          .get(ApiPath.report.voucherHistogram,
              queryParameters: {
                'fromAt': fromAt,
                'toAt': toAt,
                'distributorId': distributorId,
                'status': status
              }..removeWhere((key, value) => value == null))
          .then((value) => VoucherHistogram.fromJson(value.data));

  static Future<Vouchers> getVouchers({
    required String fromAt,
    required String toAt,
    int? distributorId,
    int? customerId,
    String? status,
    int? size,
    int? page,
  }) =>
      app<DioService>()
          .getInstance()
          .get(ApiPath.report.vouchers,
              queryParameters: {
                'fromAt': fromAt,
                'toAt': toAt,
                'distributorId': distributorId,
                'customerId': customerId,
                'status': status,
                'size': size,
                'page': page
              }..removeWhere((key, value) => value == null))
          .then((value) => Vouchers.fromJson(value.data));
}
