import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';

class CategoryItem extends StatelessWidget {
  final Color bgColor;
  final Icon icon;
  final String name;
  final double size;
  final Function() onPressed;
  const CategoryItem(
      {required this.bgColor,
      required this.icon,
      required this.name,
      required this.size,
      required this.onPressed})
      : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64.w,
      margin: EdgeInsets.all(30.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: size,
              height: size,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(24.w)),
                  child: ElevatedButton(
                    child: icon,
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                        primary: bgColor, elevation: 0),
                  ))),
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
