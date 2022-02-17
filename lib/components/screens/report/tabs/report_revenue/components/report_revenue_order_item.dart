import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbo/components/helper/util.dart';
import 'package:mbo/components/models/order.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';

class ReportRevenueOrderItem extends StatelessWidget {
  final Order order;
  const ReportRevenueOrderItem({Key? key, required this.order})
      : super(key: key);

  String getDate(String date) {
    return date.split(" ")[1];
  }

  Widget title(String text, Color color, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6.h),
      child: Text(text,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline4?.copyWith(color: color)),
    );
  }

  Widget description(
      String text, Color color, double width, BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.only(bottom: 12.h),
      child: Text(text,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline3?.copyWith(color: color)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title("Mã đơn hàng", kGray3, context),
                description(order.orderId == null ? "" : order.orderId!, kGray2,
                    size.width * 0.4, context),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title("Tổng số tiền", kGray3, context),
                        description(formatNumber(order.total!.toString()) + 'đ',
                            kError, size.width * 0.25, context),
                      ],
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title("Hình thức", kGray3, context),
                        description(order.shippingMethod!, kGray2,
                            size.width * 0.12, context)
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title("Khách hàng", kGray3, context),
                  description(
                      order.user!.fullName != null ? order.user!.fullName! : "",
                      kGray2,
                      size.width * 0.4,
                      context)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title("Ngày mua/Ngày thanh toán", kGray3, context),
                  description(
                      getDate(order.createdTime!) +
                          " - " +
                          (order.paidTime != null
                              ? getDate(order.paidTime!)
                              : "--/--/----"),
                      kGray2,
                      size.width * 0.45,
                      context)
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
