import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mbo/components/controllers/controllers.dart';
import 'package:mbo/components/enums/enums.dart';
import 'package:mbo/components/models/order.dart';
import 'package:mbo/components/screens/order/tabs/common/components/order_item.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';

class ProcessingOrderTab extends StatelessWidget {
  const ProcessingOrderTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderTabController>(
      init: OrderTabController(listStatusEnum: [
        orderStatusEnum.verified,
        orderStatusEnum.waitingUserConfirmed,
        orderStatusEnum.processing,
        orderStatusEnum.sentToLogistic,
        orderStatusEnum.shipped
      ]),
      global: false,
      builder: (controller) => Scaffold(
          body: Column(
        children: [
          Container(
            height: 58.h,
            padding: EdgeInsets.only(left: 18.w, right: 18.w),
            margin: EdgeInsets.only(bottom: 8.h),
            color: kWhite,
            child: Row(
              children: [
                Container(
                  height: 42.h,
                  width: 200.w,
                  padding: EdgeInsets.only(
                      left: 18.w, top: 10.h, bottom: 10.h, right: 18.w),
                  decoration: BoxDecoration(
                    color: kBackground,
                    borderRadius: BorderRadius.circular(6.0.w),
                  ),
                  child: Obx(
                    () => DropdownButton(
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: controller.listStatusEnum
                          .asMap()
                          .entries
                          .map((e) => DropdownMenuItem(
                                child: Text(
                                  e.value.enumToString,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      ?.copyWith(color: kPrimary),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                value: e.key,
                              ))
                          .toList(),
                      value: controller.selectedStatusEnum.value,
                      onChanged: (int? value) {
                        controller.onSelectedStatusEnum(value);
                      },
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: controller.showFilter,
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: kBackground,
                      borderRadius: BorderRadius.circular(6.0.w),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Lọc',
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(color: kGray3),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Icon(Icons.filter_list, size: 18.sp)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: kWhite,
              // height: ScreenUtil.defaultSize.height - 100.h,
              padding: EdgeInsets.only(left: 18.w, right: 18.w),
              child: PagedListView.separated(
                  physics: const BouncingScrollPhysics(),
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Order>(
                    itemBuilder: (context, item, index) =>
                        OrderItem(item: item),
                  ),
                  separatorBuilder: (context, index) => const Divider()),
            ),
          ),
        ],
      )),
    );
  }
}
