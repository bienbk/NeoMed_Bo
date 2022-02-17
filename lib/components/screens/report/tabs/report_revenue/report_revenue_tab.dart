import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mbo/components/controllers/controllers.dart';
import 'package:mbo/components/models/order.dart';
import 'package:mbo/components/models/report/ReportWalletCashin.dart';
import 'package:mbo/components/screens/report/tabs/report_revenue/components/report_revenue_cashin_item.dart';
import 'package:mbo/components/screens/report/tabs/report_revenue/components/report_revenue_order_item.dart';
import 'package:mbo/components/screens/report/tabs/report_revenue/components/report_revenue_tab_statistic.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';
import 'package:mbo/components/widgets/common/common.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportRevenueTab extends StatefulWidget {
  const ReportRevenueTab({Key? key}) : super(key: key);
  @override
  _ReportRevenueTabState createState() => _ReportRevenueTabState();
}

class _ReportRevenueTabState extends State<ReportRevenueTab>
    with TickerProviderStateMixin {
  final PanelController _controller = PanelController();
  late TabController _tabController;

  @override
  void initState() {
    Get.lazyPut(() => ReportRevenueController());
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportRevenueController>(
      builder: (controller) => Scaffold(
        body: SlidingUpPanel(
          parallaxEnabled: false,
          controller: _controller,
          minHeight: ScreenUtil().screenHeight - 600.h,
          maxHeight: ScreenUtil().screenHeight - 250.h,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6.0.w),
              topRight: Radius.circular(6.0.w)),
          header: SizedBox(
            width: ScreenUtil().screenWidth,
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 8.w),
                    width: 86.w,
                    height: 16.w,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color(0xFFC4C4C4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0.w))))),
                PreferredSize(
                    preferredSize: const Size.fromHeight(30.0),
                    child: Container(
                      color: kWhite,
                      child: TabBar(
                        controller: _tabController,
                        padding: EdgeInsets.fromLTRB(18.w, 5.h, 18.w, 0.h),
                        isScrollable: true,
                        indicator: MD2Indicator(
                            indicatorHeight: 8.h,
                            indicatorColor: kPrimary,
                            radius: 8.0.w,
                            indicatorSize: MD2IndicatorSize.tiny),
                        unselectedLabelColor: kGray3,
                        labelColor: kGray2,
                        tabs: const [
                          Tab(
                            text: 'Doanh thu nạp tiền',
                          ),
                          Tab(
                            text: 'Doanh thu bán hàng',
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          panel: Container(
            margin: EdgeInsets.only(left: 18.w, right: 18.w, top: 60.h),
            child: TabBarView(
              controller: _tabController,
              children: [
                PagedListView.separated(
                    physics: const BouncingScrollPhysics(),
                    pagingController: controller.topupPagingController,
                    builderDelegate: PagedChildBuilderDelegate<Item>(
                        itemBuilder: (context, item, index) =>
                            ReportRevenueCashinItem(
                              dataCashin: item,
                            )),
                    separatorBuilder: (context, index) => const Divider()),
                PagedListView.separated(
                    physics: const BouncingScrollPhysics(),
                    pagingController: controller.orderPagingController,
                    builderDelegate: PagedChildBuilderDelegate<Order>(
                      itemBuilder: (context, item, index) =>
                          ReportRevenueOrderItem(order: item),
                    ),
                    separatorBuilder: (context, index) => const Divider()),
              ],
            ),
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
                      child: ReportRevenueStatisticCards(
                        balance: controller.balance.value,
                        sales: controller.totalOrderTx.value,
                        salesTransactions: controller.totalOrderCount.value,
                        topup: controller.totalCashinTx.value,
                        topupTransactions: controller.totalCashinCount.value,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
