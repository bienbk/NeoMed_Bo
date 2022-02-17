import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mbo/components/controllers/controllers.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';
import 'package:mbo/components/widgets/common/custom_date_picker.dart';
import 'package:mbo/components/widgets/common/outline_button_with_badge.dart';

class BottomSheet extends StatefulWidget {
  const BottomSheet(
      {required this.onUpdate,
      required this.timeRange,
      required this.fromAt,
      required this.toAt,
      required this.distributorId,
      this.customerId,
      Key? key})
      : super(key: key);

  final Function({
    DateTime? fromAt,
    DateTime? toAt,
    int? timeRange,
    int? distributorId,
    int? customerId,
  }) onUpdate;

  final int timeRange;
  final int distributorId;
  final int? customerId;
  final DateTime fromAt;
  final DateTime toAt;

  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  final List<String> timeRangeString = [
    '7 ngày gần nhất',
    '1 tháng',
    '3 tháng',
    'thời gian cụ thể'
  ];
  late int distributorId;
  late DateTime fromAt;
  late DateTime toAt;
  late int timeRange;
  late int customerId;

  bool isSelected(int value) =>
      (timeRange == -1 ? widget.timeRange : timeRange) == value;

  setTimeRange(int id) {
    switch (id) {
      case 0:
        fromAt = Jiffy(DateTime.now()).subtract(days: 7).dateTime;
        break;
      case 1:
        fromAt = Jiffy(DateTime.now()).subtract(months: 1).dateTime;
        break;
      case 2:
        fromAt = Jiffy(DateTime.now()).subtract(months: 3).dateTime;
        break;
      case 3:
        break;
    }
    toAt = DateTime.now();
    timeRange = id;
  }

  @override
  void initState() {
    super.initState();
    customerId = widget.customerId ?? -1;
    distributorId = widget.distributorId;
    fromAt = widget.fromAt;
    toAt = widget.toAt;
    setTimeRange(widget.timeRange);
  }

  Widget outlineButtonBadge(int id, BuildContext context) =>
      OutlineButtonWithBadge(
        width: 161.w,
        heigth: 42.h,
        borderRadius: 6.w,
        icon: Icon(Icons.done, color: kWhite, size: 12.sp),
        child: Text(
          timeRangeString[id],
          style: Theme.of(context)
              .textTheme
              .headline3
              ?.copyWith(color: isSelected(id) ? kPrimary : kGray3),
        ),
        color: isSelected(id) ? kPrimary : kGray3,
        onPressed: () {
          if (id != timeRange) {
            setTimeRange(id);
            if (id != 3) {
              widget.onUpdate(
                timeRange: timeRange,
                fromAt: fromAt,
                toAt: toAt,
              );
            } else {
              widget.onUpdate(
                timeRange: timeRange,
              );
            }
            setState(() {});
          }
        },
        badgeColor: kPrimary,
        showBadge: isSelected(id),
      );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommonController>(
      builder: (controller) => Container(
        decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6.w), topRight: Radius.circular(6.w))),
        child: Wrap(children: [
          Container(
            padding: EdgeInsets.only(left: 18.w, right: 18.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 8.h, bottom: 18.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 86.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                            color: kGray3,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.w))),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Lọc thông tin',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(color: k17431D),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Thời gian',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: kGray2),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        outlineButtonBadge(0, context),
                        outlineButtonBadge(1, context),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        outlineButtonBadge(2, context),
                        outlineButtonBadge(3, context)
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Thời gian cụ thể',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: kGray2),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDatePicker(
                        setDate: (date) {
                          widget.onUpdate(fromAt: date);
                          setState(() {
                            fromAt = date;
                          });
                        },
                        selectedDate: fromAt,
                        width: 161.w,
                        height: 50.h,
                        enabled: timeRange == 3),
                    CustomDatePicker(
                        setDate: (date) {
                          widget.onUpdate(toAt: date);
                          setState(() {
                            toAt = date;
                          });
                        },
                        selectedDate: toAt,
                        width: 161.w,
                        height: 50.h,
                        enabled: timeRange == 3)
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Nhà cung cấp',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: kGray2),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 339.w,
                      padding: EdgeInsets.only(left: 18.0.w, right: 18.0.w),
                      height: 50.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0.w),
                          border: Border.all(color: kPrimary)),
                      child: DropdownButton(
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 8,
                        underline: const SizedBox(),
                        style: const TextStyle(color: kPrimary),
                        onChanged: (int? id) {
                          widget.onUpdate(distributorId: id!);
                          setState(() {
                            distributorId = id;
                          });
                        },
                        value: distributorId == 0
                            ? controller.distributors.value.distributors[0].id
                            : distributorId,
                        items: controller.distributors.value.distributors
                            .map((distributor) => DropdownMenuItem(
                                  value: distributor.id,
                                  child: Text(distributor.name ?? ''),
                                ))
                            .toList(),
                        borderRadius: BorderRadius.circular(6.0.w),
                        dropdownColor: kWhite,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 12.h,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
