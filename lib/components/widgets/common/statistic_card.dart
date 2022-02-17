import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';

/// Display total statistic
class StatisticCard extends StatelessWidget {
  /// Card's background color
  final Color backgroundColor;

  /// Widget icon for more customization
  final Widget icon;

  /// Title 1, must have
  final String title1;

  /// Content 1, must have
  final String content1;

  /// Color of content 1 text
  final Color content1Color;

  /// Title 2, optional
  final String? title2;

  /// Content 2, optional
  final String? content2;

  const StatisticCard(
      {Key? key,
      required this.backgroundColor,
      required this.icon,
      required this.title1,
      required this.content1,
      required this.content1Color,
      this.title2,
      this.content2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 339.w,
      height: 96.w,
      padding: EdgeInsets.fromLTRB(18.w, 24.h, 18.w, 24.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0.w), color: backgroundColor),
      child: Row(
        children: [
          icon,
          Container(
            margin: EdgeInsets.only(left: 12.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title1,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: kGray2)),
                SizedBox(height: 2.0.h),
                Text(content1,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: content1Color))
              ],
            ),
          ),
          const Spacer(),
          if (title2 != null && content2 != null)
            Container(
              margin: EdgeInsets.only(left: 12.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title2!,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: kGray2)),
                  SizedBox(height: 2.0.h),
                  Text(content2!,
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(color: kGray2))
                ],
              ),
            ),
        ],
      ),
    );
  }
}
