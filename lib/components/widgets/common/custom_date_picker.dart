import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';

class CustomDatePicker extends StatelessWidget {
  final Function(DateTime) setDate;
  final DateTime selectedDate;
  final double width;
  final double height;
  final bool enabled;

  const CustomDatePicker(
      {Key? key,
      required this.setDate,
      required this.selectedDate,
      required this.width,
      required this.height,
      required this.enabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6.0.w)),
            border: Border.all(color: enabled ? kPrimary : kGray3)),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(6.0.w)),
          child: OutlinedButton.icon(
            onPressed: enabled
                ? () async {
                    try {
                      final DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2025));
                      // setState(() {
                      //   selectedDate = date!;
                      // });
                      setDate(date!);
                    } catch (e) {}
                  }
                : () {},
            icon: Icon(Icons.calendar_today_rounded,
                color: enabled ? kPrimary : kGray3, size: 18.sp),
            label: Text(Jiffy(selectedDate).format('dd/MM/yyyy'),
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: enabled ? kGray2 : kGray3)),
            style: OutlinedButton.styleFrom(
                backgroundColor: kBackground,
                side: BorderSide.none,
                minimumSize: Size(width, height),
                maximumSize: Size(width, height)),
          ),
        ));
  }
}
