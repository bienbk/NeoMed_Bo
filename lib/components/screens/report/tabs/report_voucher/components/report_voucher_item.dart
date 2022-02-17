import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbo/components/models/report/Vouchers.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';

class ReportVoucherItem extends StatelessWidget {
  final Item item;
  const ReportVoucherItem({Key? key, required this.item}) : super(key: key);

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
    return Container(
      padding: EdgeInsets.only(top: 18.h, bottom: 18.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textPair(
                        title: 'Mã',
                        content: item.id == null ? "" : item.id.toString(),
                        titleColor: kGray3,
                        contentColor: kGray2,
                        width: 100.w,
                        context: context),
                    SizedBox(height: 18.h),
                    textPair(
                        title: 'Hạn mức',
                        content: (item.discount ?? 0).toString(),
                        titleColor: kGray3,
                        contentColor: kError,
                        width: 100.w,
                        context: context)
                  ],
                ),
              ),
              Column(children: [
                textPair(
                    title: 'Tên voucher',
                    content: item.name ?? '',
                    titleColor: kGray3,
                    contentColor: kGray2,
                    width: 200.w,
                    context: context),
                SizedBox(height: 18.h),
                textPair(
                    title: 'Nhà cung cấp',
                    content: item.distributor?.name ?? '',
                    titleColor: kGray3,
                    contentColor: kGray2,
                    width: 200.w,
                    context: context)
              ]),
            ],
          ),
          SizedBox(height: 18.h),
          Row(
            children: [
              if (item.status! == 'assigned')
                textTitle(
                    'Thời gian: ' +
                        _formatTime(item.campaign?.startDate) +
                        ' - ' +
                        _formatTime(item.campaign?.endDate),
                    kGray3,
                    context)
            ],
          )
        ],
      ),
    );
  }
}
