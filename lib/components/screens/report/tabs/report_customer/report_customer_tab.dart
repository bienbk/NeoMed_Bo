import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mbo/components/controllers/controllers.dart';
import 'package:mbo/components/models/report/ReportCustomer.dart';
import 'package:mbo/components/screens/report/tabs/report_customer/components/report_customer_item.dart';
import 'package:mbo/components/screens/report/tabs/report_customer/components/report_customer_tab_statistic.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ReportCustomerTab extends StatelessWidget {
  const ReportCustomerTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportCustomerController>(
        init: ReportCustomerController(),
        builder: (controller) => Scaffold(
              body: SlidingUpPanel(
                parallaxEnabled: false,
                controller: controller.controller,
                minHeight: ScreenUtil().screenHeight - 550.h,
                maxHeight: ScreenUtil().screenHeight - 200.h,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.0.w),
                    topRight: Radius.circular(6.0.w)),
                header: SizedBox(
                  width: ScreenUtil().screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 8.w),
                        width: 86.w,
                        height: 16.w,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: const Color(0xFFC4C4C4),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0.w)))),
                      ),
                    ],
                  ),
                ),
                panel: Container(
                  margin: EdgeInsets.only(left: 18.w, right: 18.w, top: 24.h),
                  child: PagedListView.separated(
                      physics: const BouncingScrollPhysics(),
                      pagingController: controller.pagingController,
                      builderDelegate: PagedChildBuilderDelegate<Item>(
                        itemBuilder: (context, item, index) =>
                            ReportCustomerItem(
                          dataCustomer: item,
                        ),
                      ),
                      separatorBuilder: (context, index) => const Divider()),
                ),
                body: Container(
                  color: kWhite,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: 80.h,
                          padding: EdgeInsets.only(left: 18.w, right: 18.w),
                          color: kWhite,
                          child: Row(
                            children: [
                              Text(
                                'Tổng quan',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    ?.copyWith(color: kGray2),
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
                        Container(
                          padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                          color: kWhite,
                          child: Center(
                              child: ReportCustomerStatisticCards(
                            customer: controller.customer.value,
                            cashin: controller.cashin.value,
                            order: controller.order.value,
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
