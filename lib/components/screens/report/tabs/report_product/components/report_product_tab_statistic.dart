import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbo/components/helper/util.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';
import 'package:mbo/components/widgets/common/statistic_card.dart';

class ReportProductStatisticCards extends StatelessWidget {
  final int revenue;
  final int sold;
  const ReportProductStatisticCards(
      {Key? key, required this.revenue, required this.sold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatisticCard(
            backgroundColor: const Color(0x33FF9900),
            icon: SizedBox(
                width: 48.0.w,
                height: 48.0.w,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFF9900),
                  ),
                  child: Icon(
                    Icons.attach_money,
                    color: kWhite,
                  ),
                )),
            title1: "Doanh thu",
            content1: formatNumber(revenue.toString()) + 'đ',
            content1Color: const Color(0xFFFF9900)),
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
                    Icons.badge,
                    color: kWhite,
                  ),
                )),
            title1: "Tổng số đã bán",
            content1: formatNumber(sold.toString()),
            content1Color: const Color(0xFF28B446))
      ],
    );
  }
}
