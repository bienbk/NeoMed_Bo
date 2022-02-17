import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mbo/components/helper/util.dart';
import 'package:mbo/components/models/order.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';

class OrderItem extends StatelessWidget {
  final Order item;
  const OrderItem({Key? key, required this.item}) : super(key: key);

  String _formatTime(String? time) {
    if (time == null) {
      return '';
    } else {
      return time.split(' ').reversed.join(' ').substring(0, time.length - 3);
    }
  }

  Widget textTitle(String text, Color color, BuildContext context) {
    return Text(text,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headline4?.copyWith(color: color));
  }

  Widget textContent(
      String text, Color color, double width, BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(text,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline3?.copyWith(color: color)),
    );
  }

  Widget textPair(
      {required String title,
      required String content,
      required Color titleColor,
      required Color contentColor,
      required double width,
      required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textTitle(title, titleColor, context),
        SizedBox(height: 6.h),
        textContent(content, contentColor, width, context)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/order/${item.orderId}');
      },
      child: Container(
        padding: EdgeInsets.only(top: 18.h, bottom: 18.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textContent('ID: ${item.orderId}', kGray2, 200.w, context),
                textTitle(_formatTime(item.createdTime), kGray3, context)
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                textPair(
                    title: 'Khách hàng',
                    content: item.user?.fullName ?? "",
                    titleColor: kGray3,
                    contentColor: kGray2,
                    width: 155.w,
                    context: context),
                textPair(
                    title: 'Số sản phẩm',
                    content: formatNumber(item.totalItemCount.toString()),
                    titleColor: kGray3,
                    contentColor: kGray2,
                    width: 75.w,
                    context: context),
                SizedBox(
                  width: 10.w,
                ),
                textPair(
                    title: 'Tổng tiền',
                    content: formatNumber((item.total ?? 0).toString()) + 'đ',
                    titleColor: kGray3,
                    contentColor: kError,
                    width: 80.w,
                    context: context)
              ],
            )
          ],
        ),
      ),
    );
  }
}
