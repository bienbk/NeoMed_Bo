// To parse this JSON data, do
//
//     final reportCashins = reportCashinsFromJson(jsonString);

import 'dart:convert';

import 'package:mbo/components/models/pagination.dart';

ReportCashins reportCashinsFromJson(String str) =>
    ReportCashins.fromJson(json.decode(str));

String reportCashinsToJson(ReportCashins data) => json.encode(data.toJson());

class ReportCashins {
  ReportCashins({
    this.items,
    this.pagination,
    this.totalAmount,
  });

  List<Item>? items;
  Pagination? pagination;
  int? totalAmount;

  factory ReportCashins.fromJson(Map<String, dynamic> json) => ReportCashins(
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
        totalAmount: json["total_amount"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "pagination": pagination == null ? null : pagination!.toJson(),
        "total_amount": totalAmount,
      };
}

class Item {
  Item({
    this.amount,
    this.distributorId,
    this.source,
    this.tid,
    this.time,
    this.user,
  });

  int? amount;
  int? distributorId;
  String? source;
  String? tid;
  String? time;
  User? user;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        amount: json["amount"],
        distributorId: json["distributor_id"],
        source: json["source"],
        tid: json["tid"],
        time: json["time"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "distributor_id": distributorId,
        "source": source,
        "tid": tid,
        "time": time,
        "user": user == null ? null : user!.toJson(),
      };
}

class User {
  User({
    this.balance,
    this.email,
    this.fullName,
    this.phone,
    this.userId,
    this.username,
  });

  int? balance;
  String? email;
  String? fullName;
  String? phone;
  int? userId;
  String? username;

  factory User.fromJson(Map<String, dynamic> json) => User(
        balance: json["balance"],
        email: json["email"],
        fullName: json["full_name"],
        phone: json["phone"],
        userId: json["user_id"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
        "email": email,
        "full_name": fullName,
        "phone": phone,
        "user_id": userId,
        "username": username,
      };
}
