import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mbo/api/api.dart';
import 'package:mbo/components/controllers/controllers.dart';
import 'package:mbo/components/models/report/Vouchers.dart';
import 'package:mbo/components/screens/report/tabs/report_voucher/components/report_voucher_chart.dart';
import 'package:mbo/components/widgets/common/bottom_sheet.dart';
import 'package:mbo/core/core.dart';

class ReportVoucherController extends GetxController with MboLogger {
  var time = 0.obs;
  var fromAt = DateTime.now().obs;
  var toAt = DateTime.now().subtract(const Duration(days: 7)).obs;
  var distributorId = 0.obs;
  var chartData = ReportVoucherChartData().obs;

  // listview scroll controllers
  final PagingController<int, Item> assignedPagingController =
      PagingController(firstPageKey: 0);
  final PagingController<int, Item> claimedPagingController =
      PagingController(firstPageKey: 0);
  final PagingController<int, Item> expiredPagingController =
      PagingController(firstPageKey: 0);

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

    // update chart data
    getChartData();

    // notify list controller to update
    assignedPagingController.itemList = [];
    assignedPagingController.notifyPageRequestListeners(0);
    claimedPagingController.itemList = [];
    claimedPagingController.notifyPageRequestListeners(0);
    expiredPagingController.itemList = [];
    expiredPagingController.notifyPageRequestListeners(0);
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

  void getChartData() {
    ReportProvider.getVouchersHistogram(
            distributorId: distributorId.value,
            fromAt: Jiffy(fromAt.value).format('dd-MM-yyyy'),
            toAt: Jiffy(toAt.value).format('dd-MM-yyyy'))
        .then((value) {
      chartData.value = ReportVoucherChartData().dataProcessing(value);
    });
  }

  @override
  void onInit() {
    distributorId.value =
        Get.find<CommonController>().distributors.value.distributors[0].id ?? 0;
    chartData.value.setDefault();
    assignedPagingController.addPageRequestListener((pageKey) {
      assignedPagingController.itemList ??= [];
      ReportProvider.getVouchers(
              status: 'assigned',
              distributorId: distributorId.value,
              fromAt: Jiffy(fromAt.value).format('dd-MM-yyyy'),
              toAt: Jiffy(toAt.value).format('dd-MM-yyyy'))
          .then((value) {
        final int newPageKey = (value.items ?? []).length + pageKey;
        if (value.pagination.total != null &&
            newPageKey < value.pagination.total!) {
          assignedPagingController.appendPage(value.items ?? [], newPageKey);
        } else {
          assignedPagingController.appendLastPage(value.items ?? []);
        }
        update();
      }).handleError(mboApiErrorHandler);
    });
    claimedPagingController.addPageRequestListener((pageKey) {
      claimedPagingController.itemList ??= [];
      ReportProvider.getVouchers(
              status: 'claimed',
              distributorId: distributorId.value,
              fromAt: Jiffy(fromAt.value).format('dd-MM-yyyy'),
              toAt: Jiffy(toAt.value).format('dd-MM-yyyy'))
          .then((value) {
        final int newPageKey = (value.items ?? []).length + pageKey;
        if (value.pagination.total != null &&
            newPageKey < value.pagination.total!) {
          claimedPagingController.appendPage(value.items ?? [], newPageKey);
        } else {
          claimedPagingController.appendLastPage(value.items ?? []);
        }
        update();
      }).handleError(mboApiErrorHandler);

      expiredPagingController.addPageRequestListener((pageKey) {
        expiredPagingController.itemList ??= [];
        ReportProvider.getVouchers(
                status: 'expired',
                distributorId: distributorId.value,
                fromAt: Jiffy(fromAt.value).format('dd-MM-yyyy'),
                toAt: Jiffy(toAt.value).format('dd-MM-yyyy'))
            .then((value) {
          final int newPageKey = (value.items ?? []).length + pageKey;
          if (value.pagination.total != null &&
              newPageKey < value.pagination.total!) {
            expiredPagingController.appendPage(value.items ?? [], newPageKey);
          } else {
            expiredPagingController.appendLastPage(value.items ?? []);
          }
          update();
        }).handleError(mboApiErrorHandler);
      });
    });
    super.onInit();
  }

  @override
  void onClose() {
    assignedPagingController.dispose();
    claimedPagingController.dispose();
    expiredPagingController.dispose();
    super.onClose();
  }
}
