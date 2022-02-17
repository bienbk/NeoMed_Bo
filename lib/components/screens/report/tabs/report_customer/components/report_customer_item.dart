import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbo/components/helper/util.dart';
import 'package:mbo/components/models/report/ReportCustomer.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';

class ReportCustomerItem extends StatelessWidget {
  final Item dataCustomer;
  const ReportCustomerItem({Key? key, required this.dataCustomer})
      : super(key: key);

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CT/QT/NT',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: kGray3),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      dataCustomer.user?.fullName ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: kGray2),
                    )
                  ],
                ),
                width: 240.w,
                padding: EdgeInsets.only(right: 5.w),
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mã',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: kGray3),
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      (dataCustomer.user?.userId ?? 0).toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: kGray2),
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                width: 80.w,
              )
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
                      'Số dư ví',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: kGray3),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      formatNumber(
                              (dataCustomer.user?.balance ?? 0).toString()) +
                          'đ',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: kError),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                width: 120.w,
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Số lần mua',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: kGray3),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(dataCustomer.totalPaymentTx.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            ?.copyWith(color: kGray2)),
                  ],
                ),
                width: 120.w,
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Số lần nạp',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: kGray3),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(dataCustomer.totalTopupTx.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            ?.copyWith(color: kGray2)),
                  ],
                ),
                width: 80.w,
              ),
            ],
          )
        ],
      ),
    );
  }
}
