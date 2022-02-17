// To parse this JSON data, do
//
//     final reportCustomer = reportCustomerFromJson(jsonString);

import 'dart:convert';

import 'package:mbo/components/models/pagination.dart';

ReportCustomer reportCustomerFromJson(String str) =>
    ReportCustomer.fromJson(json.decode(str));

String reportCustomerToJson(ReportCustomer data) => json.encode(data.toJson());

class ReportCustomer {
  ReportCustomer({
    this.items,
    this.pagination,
    this.totalPaymentTx,
    this.totalTopupTx,
    this.totalUsers,
  });

  List<Item>? items;
  Pagination? pagination;
  int? totalPaymentTx;
  int? totalTopupTx;
  int? totalUsers;

  factory ReportCustomer.fromJson(Map<String, dynamic> json) => ReportCustomer(
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
        totalPaymentTx: json["total_payment_tx"],
        totalTopupTx: json["total_topup_tx"],
        totalUsers: json["total_users"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "pagination": pagination == null ? null : pagination!.toJson(),
        "total_payment_tx": totalPaymentTx,
        "total_topup_tx": totalTopupTx,
        "total_users": totalUsers,
      };
}

class Item {
  Item({
    this.totalPaymentTx,
    this.totalTopupTx,
    this.user,
  });

  int? totalPaymentTx;
  int? totalTopupTx;
  User? user;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        totalPaymentTx: json["total_payment_tx"],
        totalTopupTx: json["total_topup_tx"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "total_payment_tx": totalPaymentTx,
        "total_topup_tx": totalTopupTx,
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
