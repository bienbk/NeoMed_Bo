import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbo/components/helper/util.dart';
import 'package:mbo/components/models/order_item.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';

class OrderListProductItem extends StatelessWidget {
  const OrderListProductItem(
      {Key? key,
      required this.onSubmitted,
      required this.onChanged,
      required this.data})
      : super(key: key);

  final OrderItem data;
  final VoidCallback onSubmitted;
  final Function(int value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (data.getImageLinks.isNotEmpty)
          Image.network(
            data.getImageLinks[0],
            width: 88.w,
            height: 82.h,
          )
        else
          Container(
            color: kGray3,
            height: 88.w,
            width: 82.h,
          ),
        Expanded(
            child: Container(
          margin: EdgeInsets.only(left: 12.w),
          height: 82.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                data.productName ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: kGray2),
              ),
              Text(
                'Số lượng: ${data.quantity}',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: kGray3),
              ),
            ],
          ),
        )),
        Column(
          children: [
            Container(
              width: 94.w,
              height: 50.h,
              margin: EdgeInsets.only(bottom: 5.h),
              child: Focus(
                onFocusChange: (hasFocus) {
                  if (!hasFocus) {
                    onSubmitted();
                  }
                },
                child: TextField(
                  onSubmitted: (_) {
                    onSubmitted();
                  },
                  onChanged: (value) {
                    onChanged(value.isEmpty ? 0 : int.parse(value));
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Số lượng',
                    labelStyle: TextStyle(color: Color(0xFFCCCCCC)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFCCCCCC), width: 3.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFCCCCCC), width: 1.0)),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: kGray2),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
            ),
            Text(
              formatNumber(((data.priceSale ?? 0) * (data.quantity ?? 0))
                      .toString()) +
                  'đ',
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(color: kError),
            ),
          ],
        )
      ],
    );
  }
}
