import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbo/components/helper/util.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';
import 'package:mbo/components/widgets/common/statistic_card.dart';

class ReportRevenueStatisticCards extends StatelessWidget {
  final int sales;
  final int salesTransactions;
  final int topup;
  final int topupTransactions;
  final int balance;
  const ReportRevenueStatisticCards(
      {Key? key,
      required this.sales,
      required this.salesTransactions,
      required this.topup,
      required this.topupTransactions,
      required this.balance})
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
                    Icons.attach_money,
                    color: kWhite,
                  ),
                )),
            title1: "Doanh thu nạp tiền",
            content1: formatNumber(topup.toString()) + 'đ',
            content1Color: const Color(0xFFFF9900),
            title2: "Số lượt nạp",
            content2: topupTransactions.toString()),
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
                    Icons.stacked_line_chart_sharp,
                    color: kWhite,
                  ),
                )),
            title1: "Doanh thu bán hàng",
            content1: formatNumber(sales.toString()) + 'đ',
            content1Color: const Color(0xFF4200FF),
            title2: "Số lượt bán",
            content2: salesTransactions.toString()),
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
                    Icons.account_balance,
                    color: kWhite,
                  ),
                )),
            title1: "Số dư",
            content1: formatNumber(balance.toString()) + 'đ',
            content1Color: const Color(0xFF28B446))
      ],
    );
  }
}
