import 'dart:convert';

import 'package:mbo/components/models/order.dart';
import 'package:mbo/components/models/pagination.dart';

BackOffices backOfficesFromJson(String str) =>
    BackOffices.fromJson(json.decode(str));

String backOfficesToJson(BackOffices data) => json.encode(data.toJson());

class BackOffices {
  BackOffices({
    required this.orders,
    required this.pagination,
  });

  List<Order> orders;
  Pagination? pagination;

  factory BackOffices.fromJson(Map<String, dynamic> json) => BackOffices(
        orders: List<Order>.from(json["orders"] == null
            ? []
            : json["orders"].map((x) => Order.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}
