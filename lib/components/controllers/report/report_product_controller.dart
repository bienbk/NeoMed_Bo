import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mbo/api/api.dart';
import 'package:mbo/components/controllers/controllers.dart';
import 'package:mbo/components/models/report/ReportOrderRevenuesStatistic.dart';
import 'package:mbo/components/widgets/common/bottom_sheet.dart';
import 'package:mbo/core/error_handler/handle_error_extension.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ReportProductController extends GetxController {
  var time = 0.obs;
  var fromAt = DateTime.now().obs;
  var toAt = DateTime.now().subtract(const Duration(days: 7)).obs;
  var distributorId = 0.obs;
  var revenue = 0.obs;
  var sold = 0.obs;

  // scrollview controller
  final PagingController<int, Datum> pagingController =
      PagingController(firstPageKey: 0);

  // init panel controller here to let the widget be stateless and const also.
  final PanelController controller = PanelController();

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

    pagingController.itemList = [];
    pagingController.notifyPageRequestListeners(0);
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

  @override
  void onInit() {
    distributorId.value =
        Get.find<CommonController>().distributors.value.distributors[0].id ?? 0;
    pagingController.addPageRequestListener((pageKey) {
      pagingController.itemList ??= [];
      ReportProvider.getOrdersRevenuesStatistic(
        revenueType: 3,
        fromAt: Jiffy(fromAt.value).format('dd-MM-yyyy'),
        toAt: Jiffy(toAt.value).format('dd-MM-yyyy'),
        distributorId: distributorId.value,
        type: 0,
      ).then((value) {
        revenue.value = value.totalNetIncome ?? 0;
        sold.value = value.totalTx ?? 0;
        final int newPageKey = (value.data ?? []).length + pageKey;
        if (value.pagination != null &&
            value.pagination!.total != null &&
            newPageKey < value.pagination!.total!) {
          pagingController.appendPage(value.data ?? [], newPageKey);
        } else {
          pagingController.appendLastPage(value.data ?? []);
        }
        update();
      }).handleError(mboApiErrorHandler);
    });
    super.onInit();
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }
}
