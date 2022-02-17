// To parse this JSON data, do
//
//     final orderStateHistory = orderStateHistoryFromJson(jsonString);

import 'dart:convert';

import 'package:mbo/components/models/order.dart';

OrderStateHistory orderStateHistoryFromJson(String str) =>
    OrderStateHistory.fromJson(json.decode(str));

String orderStateHistoryToJson(OrderStateHistory data) =>
    json.encode(data.toJson());

class OrderStateHistory {
  OrderStateHistory({
    this.orderId,
    this.stateHistories,
  });

  String? orderId;
  List<StateHistory>? stateHistories;

  factory OrderStateHistory.fromJson(Map<String, dynamic> json) =>
      OrderStateHistory(
        orderId: json["order_id"],
        stateHistories: json["state_histories"] == null
            ? null
            : List<StateHistory>.from(
                json["state_histories"].map((x) => StateHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "state_histories": stateHistories == null
            ? null
            : List<dynamic>.from(stateHistories!.map((x) => x.toJson())),
      };
}
