import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mbo/components/controllers/order/order_info_controller.dart';
import 'package:mbo/components/enums/enums.dart';
import 'package:mbo/components/helper/util.dart';
import 'package:mbo/components/models/order.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';
import 'package:timelines/timelines.dart';

class OrderInfoScreen extends StatelessWidget {
  const OrderInfoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderInfoController>(
      init: OrderInfoController(),
      builder: (controller) => Scaffold(
        backgroundColor: kBackground,
        appBar: AppBar(
          // centerTitle: true,
          backgroundColor: kWhite,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: kGray2),
            onPressed: () => {Get.back()},
          ),
          elevation: 0,
          title: Text('Quản lý đơn hàng',
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(color: kGray2)),
        ),
        body: Column(
          children: [
            Container(
              color: kWhite,
              padding: EdgeInsets.all(18.w),
              margin: EdgeInsets.only(top: 1.h, bottom: 1.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ngày: " +
                        (controller.orderInfo.value.createdTime ?? '')
                            .toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(color: kGray2),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/order/${controller.orderId}/list_product');
                    },
                    child: Text(
                      "Xem sản phẩm",
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(color: kPrimary),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: kWhite,
              padding: EdgeInsets.all(18.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Trạng thái đơn hàng",
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(color: kGray1),
                  ),
                ],
              ),
            ),
            Obx(
              () => Flexible(
                child: Container(
                  color: kWhite,
                  padding: EdgeInsets.only(left: 18.w, right: 18.w),
                  child: Timeline.tileBuilder(
                      physics: const BouncingScrollPhysics(),
                      theme: TimelineThemeData(
                          nodePosition: 0,
                          color: kPrimary,
                          connectorTheme: ConnectorThemeData(thickness: 3.0.w)),
                      builder: TimelineTileBuilder.connected(
                          indicatorBuilder: (context, index) {
                            return index == 0
                                ? const DotIndicator(
                                    color: kPrimary,
                                  )
                                : const OutlinedDotIndicator(
                                    color: kPrimary,
                                  );
                          },
                          connectorBuilder: (_, index, type) {
                            return SolidLineConnector(
                              indent: type == ConnectorType.start ? 0 : 2.0.h,
                              endIndent: type == ConnectorType.end ? 0 : 2.0.h,
                              color: kPrimary,
                            );
                          },
                          contentsBuilder: (context, index) {
                            var stateHistories = controller
                                .orderStateHistory.value.stateHistories?[index];
                            return Container(
                                margin: EdgeInsets.only(left: 10.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      stateHistories!.state ==
                                              stateHistories.subState
                                          ? stateHistories.stateText!
                                          : stateHistories.subStateText!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3
                                          ?.copyWith(color: kGray2),
                                    ),
                                    Text(
                                      stateHistories.time.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          ?.copyWith(color: kGray3),
                                    )
                                  ],
                                ));
                          },
                          itemExtentBuilder: (context, index) => 50.h,
                          itemCount: controller.orderStateHistory.value
                                  .stateHistories?.length ??
                              0)),
                ),
              ),
            ),
            Obx(
              () => Container(
                color: kWhite,
                margin: EdgeInsets.only(top: 8.h, bottom: 8.h),
                padding: EdgeInsets.all(18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Địa chỉ giao hàng',
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(color: kGray1),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      controller.orderInfo.value.getNameAndPhone,
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(color: kGray2),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      controller.orderInfo.value.getAddress,
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(color: kGray3),
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: kWhite,
              padding: EdgeInsets.all(18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thanh toán',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: kGray1),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Obx(
                    () => Row(
                      children: [
                        Text(
                          controller.orderInfo.value.paymentTypeName ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(color: kGray2),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(18.w),
              decoration: const BoxDecoration(color: kWhite, boxShadow: [
                BoxShadow(
                    color: kBackground,
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(0, -1))
              ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tổng tiền: ',
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            ?.copyWith(color: kGray2),
                      ),
                      Obx(
                        () => Text(
                          formatNumber(
                                  (controller.orderInfo.value.totalSale ?? 0)
                                      .toString()) +
                              'đ',
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: kPrice),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            items:
                                (controller.orderNextStatus.value.nextStatus ??
                                        [])
                                    .map((e) => DropdownMenuItem(
                                          child: Text(
                                            orderStatusEnum
                                                .values[e.status ?? 0]
                                                .enumToString,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3
                                                ?.copyWith(color: kPrimary),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          value: e.status ?? 0,
                                        ))
                                    .toList(),
                            value: controller.selectedNextStatus.value,
                            onChanged: (int? value) {
                              controller.onChangeSelectedNextStatus(value ?? 0);
                            },
                          ),
                        ),
                      ),
                      Obx(
                        () => TextButton(
                            onPressed: () {
                              controller.updateOrderStatus();
                            },
                            style: TextButton.styleFrom(
                                backgroundColor:
                                    controller.isChangableNextStatus()
                                        ? kPrimary
                                        : kGray3),
                            child: Text(
                              'Áp dụng',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  ?.copyWith(color: kWhite),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
