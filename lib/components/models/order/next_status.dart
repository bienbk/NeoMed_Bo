// To parse this JSON data, do
//
//     final orderNextStatus = orderNextStatusFromJson(jsonString);

import 'dart:convert';

import 'package:mbo/components/models/order.dart';

OrderNextStatus orderNextStatusFromJson(String str) =>
    OrderNextStatus.fromJson(json.decode(str));

String orderNextStatusToJson(OrderNextStatus data) =>
    json.encode(data.toJson());

class OrderNextStatus {
  OrderNextStatus({
    this.nextStatus,
    this.orderId,
  });

  List<NextStatus>? nextStatus;
  int? orderId;

  factory OrderNextStatus.fromJson(Map<String, dynamic> json) =>
      OrderNextStatus(
        nextStatus: json["next_status"] == null
            ? null
            : List<NextStatus>.from(
                json["next_status"].map((x) => NextStatus.fromJson(x))),
        orderId: json["order_id"],
      );

  Map<String, dynamic> toJson() => {
        "next_status": nextStatus == null
            ? null
            : List<dynamic>.from(nextStatus!.map((x) => x.toJson())),
        "order_id": orderId,
      };
}
