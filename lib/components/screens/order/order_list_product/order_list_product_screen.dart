import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mbo/components/controllers/controllers.dart';
import 'package:mbo/components/screens/order/order_list_product/components/order_list_product_item.dart';
import 'package:mbo/components/theme/mbo_theme_data.dart';

class OrderListProductScreen extends StatelessWidget {
  const OrderListProductScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderListProductController>(
      init: OrderListProductController(),
      global: false,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: kWhite,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: kGray2,
            ),
            onPressed: () => {Get.back()},
          ),
          elevation: 0,
          title: Text(
            'Danh sách sản phẩm',
            style:
                Theme.of(context).textTheme.bodyText2?.copyWith(color: kGray2),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScopeNode _node = FocusScope.of(context);
            if (!_node.hasPrimaryFocus) {
              _node.unfocus();
            }
          },
          child: Container(
            color: kWhite,
            padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 18.h),
            margin: EdgeInsets.only(top: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Danh sách',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: k17431D),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Expanded(
                    child: Obx(
                  () => ListView.separated(
                      itemBuilder: (BuildContext context, int index) =>
                          OrderListProductItem(
                            data: controller.orderListItem[index],
                            onChanged: (value) {
                              controller.textEditorOnChanged(value, index);
                            },
                            onSubmitted: () {
                              controller.textEditorOnSubmitted(index);
                            },
                          ),
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemCount: controller.orderListItem.length),
                )),
                Container(
                  height: 70.h,
                  padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(6.0.w),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: TextButton(
                          child: Text('Áp dụng',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  ?.copyWith(color: kWhite)),
                          onPressed: () {
                            controller.applyChange();
                          },
                          style:
                              TextButton.styleFrom(backgroundColor: kPrimary),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
