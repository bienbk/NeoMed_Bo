import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mbo/api/api.dart';
import 'package:mbo/components/controllers/controllers.dart';
import 'package:mbo/components/models/order.dart';
import 'package:mbo/components/models/report/ReportWalletCashin.dart';
import 'package:mbo/components/widgets/common/bottom_sheet.dart';
import 'package:mbo/core/core.dart';

class ReportRevenueController extends GetxController with MboLogger {
  var time = 0.obs;
  var fromAt = DateTime.now().obs;
  var toAt = DateTime.now().subtract(const Duration(days: 7)).obs;
  var distributorId = 0.obs;
  var totalCashinTx = 0.obs;
  var totalCashinCount = 0.obs;
  var totalOrderTx = 0.obs;
  var totalOrderCount = 0.obs;
  var balance = 0.obs;

  onUpdateFilter({
    int? timeRange,
    DateTime? fromAt,
    DateTime? toAt,
    int? distributorId,
    int? customerId,
  }) {
    // assign new value
    time.value = timeRange ?? time.value;
    this.fromAt.value = fromAt ?? this.fromAt.value;
    this.toAt.value = toAt ?? this.toAt.value;
    this.distributorId.value = distributorId ?? this.distributorId.value;

    // update Total sum of order revenue ** Damn u backend dev, why not add total into /report/orders ?? Big brainer ??
    updateTotalOrderTxValue();
    // update Balance
    updateBalanceValue();

    // notify list controller to update
    topupPagingController.itemList = [];
    topupPagingController.notifyPageRequestListeners(0);
    orderPagingController.itemList = [];
    orderPagingController.notifyPageRequestListeners(0);
  }

  showFilter() {
    Get.bottomSheet(
        BottomSheet(
            fromAt: fromAt.value,
            toAt: toAt.value,
            onUpdate: onUpdateFilter,
            timeRange: time.value,
            distributorId: distributorId.value),
        isScrollControlled: true);
  }

  final PagingController<int, Item> topupPagingController =
      PagingController(firstPageKey: 0);
  final PagingController<int, Order> orderPagingController =
      PagingController(firstPageKey: 0);
  @override
  void onInit() {
    distributorId.value =
        Get.find<CommonController>().distributors.value.distributors[0].id ?? 0;
    topupPagingController.addPageRequestListener((pageKey) {
      topupPagingController.itemList ??= [];
      ReportProvider.getWalletCashin(
              distributorId: distributorId.value,
              fromAt: Jiffy(fromAt.value).format('dd-MM-yyyy'),
              toAt: Jiffy(toAt.value).format('dd-MM-yyyy'))
          .then((value) {
        totalCashinTx.value = value.totalAmount ?? 0;
        totalCashinCount.value = value.pagination!.total ?? 0;
        final int newPageKey = (value.items ?? []).length + pageKey;
        if (value.pagination != null &&
            value.pagination!.total != null &&
            newPageKey < value.pagination!.total!) {
          topupPagingController.appendPage(value.items ?? [], newPageKey);
        } else {
          topupPagingController.appendLastPage(value.items ?? []);
        }
        update();
      }).handleError(mboApiErrorHandler);
    });
    orderPagingController.addPageRequestListener((pageKey) {
      orderPagingController.itemList ??= [];
      ReportProvider.getOrders(
              distributorId: distributorId.value,
              fromAt: Jiffy(fromAt.value).format('dd-MM-yyyy'),
              toAt: Jiffy(toAt.value).format('dd-MM-yyyy'))
          .then((value) {
        if (value.orders != null) {
          final int newPageKey = value.orders!.length + pageKey;
          if (value.pagination != null &&
              value.pagination!.total != null &&
              newPageKey < value.pagination!.total!) {
            orderPagingController.appendPage(value.orders!, newPageKey);
          } else {
            orderPagingController.appendLastPage(value.orders!);
          }
          totalOrderCount.value = value.pagination?.total ?? 0;
        } else {
          orderPagingController.appendLastPage([]);
        }

        update();
      }).handleError(mboApiErrorHandler);
    });
    super.onInit();
  }

  @override
  void onClose() {
    orderPagingController.dispose();
    topupPagingController.dispose();
    super.onClose();
  }

  void updateTotalOrderTxValue() {
    ReportProvider.getOrdersRevenuesStatistic(
            revenueType: 1,
            type: 0,
            fromAt: Jiffy(fromAt.value).format('dd-MM-yyyy'),
            toAt: Jiffy(toAt.value).format('dd-MM-yyyy'),
            distributorId: distributorId.value)
        .then((value) {
      log.info(value.totalNetIncome);
      totalOrderTx.value = value.totalNetIncome ?? 0;
    }).handleError(mboApiErrorHandler);
  }

  void updateBalanceValue() {
    ReportProvider.getWalletsBalance(distributorId: distributorId.value)
        .then((value) {
      balance.value = value.balance ?? 0;
    }).handleError(mboApiErrorHandler);
  }
}
