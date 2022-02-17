import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mbo/api/api.dart';
import 'package:mbo/components/controllers/controllers.dart';
import 'package:mbo/components/enums/order_status_enum.dart';
import 'package:mbo/components/models/order.dart';
import 'package:mbo/components/widgets/common/bottom_sheet.dart';
import 'package:mbo/core/error_handler/handle_error_extension.dart';

class OrderTabController extends GetxController {
  OrderTabController({required this.listStatusEnum});
  final List<orderStatusEnum> listStatusEnum;
  var selectedStatusEnum = 0.obs;
  var time = 0.obs;
  var fromAt = DateTime.now().obs;
  var toAt = DateTime.now().subtract(const Duration(days: 7)).obs;
  var distributorId = 0.obs;

  // scrollview controller
  final PagingController<int, Order> pagingController =
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

  onSelectedStatusEnum(int? newStatus) {
    if (selectedStatusEnum.value == newStatus) return;
    selectedStatusEnum.value = newStatus ?? 0;

    pagingController.itemList = [];
    pagingController.notifyPageRequestListeners(0);
  }

  @override
  void onInit() {
    distributorId.value =
        Get.find<CommonController>().distributors.value.distributors[0].id ?? 0;
    pagingController.addPageRequestListener((pageKey) {
      pagingController.itemList ??= [];
      OrderProvider.getBackOffice(
        fromAt: Jiffy(fromAt.value).format('dd-MM-yyyy'),
        toAt: Jiffy(toAt.value).format('dd-MM-yyyy'),
        distributorId: distributorId.value,
        status: listStatusEnum[selectedStatusEnum.value].enumToQueryString,
      ).then((value) {
        final int newPageKey = (value.orders).length + pageKey;
        if (value.pagination != null &&
            value.pagination!.total != null &&
            newPageKey < value.pagination!.total!) {
          pagingController.appendPage(value.orders, newPageKey);
        } else {
          pagingController.appendLastPage(value.orders);
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
