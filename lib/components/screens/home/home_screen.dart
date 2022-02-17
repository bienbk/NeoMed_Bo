import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mbo/components/controllers/home_controller.dart';
import 'package:mbo/components/helper/util.dart';
import 'package:mbo/components/screens/home/components/category_item.dart';
import 'package:mbo/components/screens/home/components/order_item.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => SafeArea(
              child: Scaffold(
                  body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 245.h,
                          color: kWhite,
                          padding: EdgeInsets.fromLTRB(
                              18.0.w, 18.0.w, 18.0.w, 18.0.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Xin chào',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4
                                                ?.copyWith(color: kGray1)),
                                        Text(
                                            controller
                                                    .userInfo.value.firstName +
                                                " " +
                                                controller
                                                    .userInfo.value.lastName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2
                                                ?.copyWith(color: kGray2))
                                      ]),
                                  const Spacer(),
                                  SizedBox(
                                      width: 42.0,
                                      height: 42.0,
                                      child: IconButton(
                                        icon: Icon(Icons.logout,
                                            color: kBlack, size: 26.0.w),
                                        onPressed: controller.logout,
                                      ))
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 18.0.w),
                                alignment: Alignment.center,
                                height: 140.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: kPrimary),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 18.0.w),
                                      child: const Image(
                                          image: AssetImage(
                                              'assets/logo/pumper.png')),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 32.0.w, top: 19.0.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Doanh thu hôm nay',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3
                                                  ?.copyWith(color: kGray6)),
                                          const SizedBox(height: 2),
                                          Text(
                                              formatNumber(controller
                                                      .todayRevenue.value
                                                      .toString()) +
                                                  'đ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1
                                                  ?.copyWith(color: kWhite)),
                                          SizedBox(height: 8.h),
                                          Text('Đơn hàng mới:',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3
                                                  ?.copyWith(color: kGray6)),
                                          SizedBox(height: 2.h),
                                          Text(
                                              controller.todayOrderCount.value
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1
                                                  ?.copyWith(color: kWhite))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                      Container(
                        color: kWhite,
                        margin: EdgeInsets.only(top: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 18.w, top: 18.w),
                              child: Text('Danh mục',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      ?.copyWith(color: kGray1)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(bottom: 18.0.w),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  CategoryItem(
                                      bgColor: const Color(0x33FF9900),
                                      icon: const Icon(Icons.monetization_on,
                                          color: Color(0xFFFF9900), size: 28),
                                      name: "Báo cáo doanh thu",
                                      size: 64,
                                      onPressed:
                                          controller.navigateToReportScreen),
                                  CategoryItem(
                                      bgColor: const Color(0x334200FF),
                                      icon: const Icon(Icons.shopping_bag,
                                          color: kPrimary, size: 28),
                                      name: "Quản lý đơn hàng",
                                      size: 64,
                                      onPressed:
                                          controller.navigateToOrderScreen),
                                  CategoryItem(
                                      bgColor: const Color(0x332AC17E),
                                      icon: const Icon(Icons.person,
                                          color: Color(0xFF2AC17E), size: 28),
                                      name: "Quản lý hệ thống",
                                      size: 64,
                                      onPressed: () => {}),
                                  CategoryItem(
                                      bgColor: const Color(0x33FF7875),
                                      icon: const Icon(Icons.home,
                                          color: Color(0xFFFF7875), size: 28),
                                      name: "Cấu hình trang chủ",
                                      size: 64,
                                      onPressed: () => {}),
                                  CategoryItem(
                                      bgColor: const Color(0x33FF7875),
                                      icon: const Icon(Icons.home,
                                          color: Color(0xFFFF7875), size: 28),
                                      name: "Vận hành",
                                      size: 64,
                                      onPressed: () => {}),
                                  CategoryItem(
                                      bgColor: const Color(0x33FF7875),
                                      icon: const Icon(Icons.home,
                                          color: Color(0xFFFF7875), size: 28),
                                      name: "Phân quyền tài khoản",
                                      size: 64,
                                      onPressed: () => {}),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // height: 340,
                        color: kWhite,
                        margin: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(
                                  18.0, 18.0, 0.0, 0.0),
                              child: Text('Đơn hàng',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(color: kGray1)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.fromLTRB(
                                  0.0, 0.0, 0.0, 18.0),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  OrderItem(
                                      badgeValue: 1,
                                      bgColor: const Color(0x334276FE),
                                      icon: const Icon(
                                        Icons.restore_page_outlined,
                                        color: Color(0xFF4276FE),
                                        size: 28,
                                      ),
                                      name: 'Đang chờ duyệt',
                                      size: 64,
                                      onPressed: () => {}),
                                  OrderItem(
                                      badgeValue: 2,
                                      bgColor: const Color(0x334276FE),
                                      icon: const Icon(
                                        Icons.find_in_page_outlined,
                                        color: Color(0xFF4276FE),
                                        size: 28,
                                      ),
                                      name: 'Chờ lấy hàng',
                                      size: 64,
                                      onPressed: () => {}),
                                  OrderItem(
                                      badgeValue: 3,
                                      bgColor: const Color(0x334276FE),
                                      icon: const Icon(
                                        Icons.contact_page_outlined,
                                        color: Color(0xFF4276FE),
                                        size: 28,
                                      ),
                                      name: 'Đang giao hàng',
                                      size: 64,
                                      onPressed: () => {}),
                                  OrderItem(
                                      badgeValue: 4,
                                      bgColor: const Color(0x334276FE),
                                      icon: const Icon(
                                        Icons.task_outlined,
                                        color: Color(0xFF4276FE),
                                        size: 28,
                                      ),
                                      name: 'Hoàn thành',
                                      size: 64,
                                      onPressed: () => {}),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              )),
            ));
  }
}
