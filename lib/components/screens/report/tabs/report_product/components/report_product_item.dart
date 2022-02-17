import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbo/components/helper/util.dart';
import 'package:mbo/components/models/report/ReportOrderRevenuesStatistic.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';

class ReportProductItem extends StatelessWidget {
  const ReportProductItem(
      {Key? key, required this.dataCashin, required this.totalNetIncome})
      : super(key: key);

  final Datum dataCashin;
  final int totalNetIncome;

  String getDate(String date) {
    return date.split(" ")[1];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 18.h, bottom: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                child: Text(
                  'ID: ' + (dataCashin.product?.id ?? 0).toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: kGray2),
                  overflow: TextOverflow.ellipsis,
                ),
                width: 240.w,
                padding: EdgeInsets.only(right: 5.w),
              ),
              SizedBox(
                  child: Text(
                    formatNumber(dataCashin.totalNetIncome.toString()) + 'đ',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: kError),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                  width: 90.w)
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Text(
                      'Tên sản phẩm:',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: kGray3),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      dataCashin.product?.name ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(color: kGray2),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                width: 140.w,
              ),
              SizedBox(
                width: 5.w,
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tổng số bán :',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: kGray3),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(dataCashin.totalTx.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            ?.copyWith(color: kGray2)),
                  ],
                ),
                width: 95.w,
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tỉ lệ doanh thu:',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: kGray3)),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                        (((dataCashin.totalNetIncome ?? 0) / totalNetIncome) *
                                    100)
                                .toStringAsFixed(2) +
                            " %",
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            ?.copyWith(color: kSuccess)),
                  ],
                ),
                width: 88.w,
              ),
            ],
          )
        ],
      ),
    );
  }
}
