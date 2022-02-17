import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';

class OrderItem extends StatelessWidget {
  final Color bgColor;
  final Icon icon;
  final String name;
  final double size;
  final int badgeValue;
  final Function() onPressed;
  const OrderItem(
      {required this.bgColor,
      required this.icon,
      required this.name,
      required this.size,
      required this.badgeValue,
      required this.onPressed})
      : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.all(18.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: Badge(
              badgeContent: Text(badgeValue.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: kWhite)),
              position: BadgePosition.topEnd(top: 2.w, end: 2.w),
              child: SizedBox(
                  width: size,
                  height: size,
                  child: ClipOval(
                      child: ElevatedButton(
                    child: icon,
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                        primary: bgColor, elevation: 0),
                  ))),
            ),
          ),
          SizedBox(height: 6.h),
          Text(name,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: kGray2),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
