import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mbo/components/controllers/controllers.dart';
import 'package:mbo/components/models/report/Vouchers.dart';
import 'package:mbo/components/screens/report/tabs/report_voucher/components/report_voucher_chart.dart';
import 'package:mbo/components/screens/report/tabs/report_voucher/components/report_voucher_item.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';
import 'package:mbo/components/widgets/common/common.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportVoucherTab extends StatefulWidget {
  const ReportVoucherTab({Key? key}) : super(key: key);
  @override
  _ReportVoucherTabState createState() => _ReportVoucherTabState();
}

class _ReportVoucherTabState extends State<ReportVoucherTab>
    with TickerProviderStateMixin {
  final PanelController _controller = PanelController();
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportVoucherController>(
      init: ReportVoucherController(),
      builder: (controller) => Scaffold(
        body: SlidingUpPanel(
          parallaxEnabled: false,
          controller: _controller,
          minHeight: ScreenUtil().screenHeight - 550.h,
          maxHeight: ScreenUtil().screenHeight - 200.h,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6.0.w),
              topRight: Radius.circular(6.0.w)),
          header: SizedBox(
            width: ScreenUtil().screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                            text: 'Có sẵn',
                          ),
                          Tab(
                            text: 'Đã sử dụng',
                          ),
                          Tab(
                            text: 'Hết hạn',
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
                    pagingController: controller.assignedPagingController,
                    builderDelegate: PagedChildBuilderDelegate<Item>(
                        itemBuilder: (context, item, index) =>
                            ReportVoucherItem(
                              item: item,
                            )),
                    separatorBuilder: (context, index) => const Divider()),
                PagedListView.separated(
                    physics: const BouncingScrollPhysics(),
                    pagingController: controller.claimedPagingController,
                    builderDelegate: PagedChildBuilderDelegate<Item>(
                        itemBuilder: (context, item, index) =>
                            ReportVoucherItem(
                              item: item,
                            )),
                    separatorBuilder: (context, index) => const Divider()),
                PagedListView.separated(
                    physics: const BouncingScrollPhysics(),
                    pagingController: controller.expiredPagingController,
                    builderDelegate: PagedChildBuilderDelegate<Item>(
                        itemBuilder: (context, item, index) =>
                            ReportVoucherItem(
                              item: item,
                            )),
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
                          'Biểu đồ',
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
                    padding: EdgeInsets.only(
                        top: 8.h, bottom: 8.h, left: 8.w, right: 10.w),
                    color: kWhite,
                    child: Center(
                        child: ReportVoucherChart(
                            vdata: controller.chartData.value)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10.w, 5.h, 10.h, 0.0),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5.h, top: 12.h),
                          child: Text('Chú thích:',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: k8C8C8C)),
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 13.w),
                                  width: 11.w,
                                  height: 5.h,
                                  color: const Color(0xFF39B54A),
                                ),
                                Text('Sẵn có',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(color: kGray3))
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 32.w, right: 13.w),
                                  width: 11.w,
                                  height: 5.h,
                                  color: const Color(0xFF4276FE),
                                ),
                                Text('Đã sử dụng',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(color: kGray3))
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 32.w, right: 13.w),
                                  width: 11.w,
                                  height: 5.h,
                                  color: const Color(0xFFF5222D),
                                ),
                                Text('Hết hạn',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(color: kGray3))
                              ],
                            )
                          ],
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    width: MediaQuery.of(context).size.width,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
