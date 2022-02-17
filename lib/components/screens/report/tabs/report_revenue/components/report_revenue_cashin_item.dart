import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mbo/components/helper/util.dart';
import 'package:mbo/components/models/report/ReportWalletCashin.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';

class ReportRevenueCashinItem extends StatelessWidget {
  final Item dataCashin;
  const ReportRevenueCashinItem({Key? key, required this.dataCashin})
      : super(key: key);

  String getDate(String date) {
    return date.split(" ")[1];
  }

  Widget title(String text, Color color, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6.h),
      child: Text(text,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(color: color)),
    );
  }

  Widget description(
      String text, Color color, double width, BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.only(bottom: 18.h),
      child: Text(text,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline5?.copyWith(color: color)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                child: Text(
                  'ID: ' + dataCashin.tid!,
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: kGray1),
                  overflow: TextOverflow.ellipsis,
                ),
                width: 235.w,
                padding: EdgeInsets.only(right: 5.w, bottom: 5.h),
              ),
              Container(
                child: Text(
                  Jiffy(dataCashin.time, "h:mm:ss dd/MM/yyyy")
                      .format("dd/MM/yyyy h:mm"),
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: kGray3),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
                width: 95.w,
                margin: EdgeInsets.only(bottom: 5.h),
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
                      'Khách hàng:',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: kGray3),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      dataCashin.user!.fullName!,
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
                      'Hình thức nạp:',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: kGray3),
                    ),
                    SizedBox(height: 6.h),
                    Text('Ví Neomed',
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            ?.copyWith(color: kGray2)),
                  ],
                ),
                width: 85.w,
              ),
              SizedBox(
                width: 5.w,
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Số tiền nạp:',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: kGray3),
                    ),
                    SizedBox(height: 6.h),
                    Text(formatNumber(dataCashin.amount.toString()) + 'đ',
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            ?.copyWith(color: kError)),
                  ],
                ),
                width: 100.w,
              ),
            ],
          )
        ],
      ),
    );
  }
}
