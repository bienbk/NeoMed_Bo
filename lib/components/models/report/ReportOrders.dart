import 'dart:convert';

import 'package:mbo/components/models/order.dart';
import 'package:mbo/components/models/pagination.dart';

ReportOrders reportOrdersFromJson(String str) =>
    ReportOrders.fromJson(json.decode(str));

String reportOrdersToJson(ReportOrders data) => json.encode(data.toJson());

class ReportOrders {
  ReportOrders({
    this.orders,
    this.pagination,
  });

  List<Order>? orders;
  Pagination? pagination;

  factory ReportOrders.fromJson(Map<String, dynamic> json) => ReportOrders(
        orders: List<Order>.from(json["orders"] != null
            ? json["orders"].map((x) => Order.fromJson(x))
            : []),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "orders": orders != null
            ? List<dynamic>.from(orders!.map((x) => x.toJson()))
            : [],
        "pagination": pagination?.toJson(),
      };
}
