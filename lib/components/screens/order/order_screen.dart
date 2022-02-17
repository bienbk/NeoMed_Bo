import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mbo/components/screens/order/tabs/completed_order/completed_order_tab.dart';
import 'package:mbo/components/screens/order/tabs/new_order/new_order_tab.dart';
import 'package:mbo/components/screens/order/tabs/processing_order/processing_order_tab.dart';
import 'package:mbo/components/screens/order/tabs/returned_or_cancelled/returned_or_cancellled_order_tab.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
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
            bottom: PreferredSize(
                child: Container(
                    color: kBackground,
                    child: Container(
                      height: 52.h,
                      margin: EdgeInsets.only(top: 1.h),
                      color: kWhite,
                      child: TabBar(
                        padding:
                            EdgeInsets.fromLTRB(18.0.w, 5.0.h, 18.0.w, 5.0.h),
                        isScrollable: true,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0.w),
                          color: kPrimary,
                        ),
                        unselectedLabelColor: kGray3,
                        tabs: const [
                          Tab(
                            text: 'Đơn hàng mới',
                          ),
                          Tab(
                            text: 'Đang xử lý',
                          ),
                          Tab(
                            text: 'Đơn hoàn/hủy',
                          ),
                          Tab(
                            text: 'Hoàn thành',
                          ),
                        ],
                      ),
                    )),
                preferredSize: const Size.fromHeight(30.0)),
          ),
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              NewOrderTab(),
              ProcessingOrderTab(),
              ReturnedOrCancelledOrderTab(),
              CompletedOrderTab()
            ],
          )),
    );
  }
}
