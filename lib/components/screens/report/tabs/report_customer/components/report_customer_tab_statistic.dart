import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbo/components/helper/util.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';
import 'package:mbo/components/widgets/common/statistic_card.dart';

class ReportCustomerStatisticCards extends StatelessWidget {
  final int customer;
  final int cashin;
  final int order;
  const ReportCustomerStatisticCards(
      {Key? key,
      required this.customer,
      required this.cashin,
      required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatisticCard(
            backgroundColor: const Color(0x33FF9900),
            icon: SizedBox(
                width: 48.w,
                height: 48.w,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFF9900),
                  ),
                  child: Icon(
                    Icons.person,
                    color: kWhite,
                  ),
                )),
            title1: "Tổng số khách hàng",
            content1: formatNumber(customer.toString()),
            content1Color: const Color(0xFFFF9900)),
        SizedBox(height: 18.h),
        StatisticCard(
            backgroundColor: const Color(0x334200FF),
            icon: SizedBox(
                width: 48.0.w,
                height: 48.w,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF4200FF),
                  ),
                  child: Icon(
                    Icons.credit_card,
                    color: kWhite,
                  ),
                )),
            title1: "Tổng số lượt nạp",
            content1: formatNumber(cashin.toString()),
            content1Color: const Color(0xFF4200FF)),
        SizedBox(height: 18.h),
        StatisticCard(
            backgroundColor: const Color(0x3328B446),
            icon: SizedBox(
                width: 48.0.w,
                height: 48.0.w,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF28B446),
                  ),
                  child: Icon(
                    Icons.shopping_bag,
                    color: kWhite,
                  ),
                )),
            title1: "Tổng lượt mua",
            content1: formatNumber(order.toString()),
            content1Color: const Color(0xFF28B446))
      ],
    );
  }
}
