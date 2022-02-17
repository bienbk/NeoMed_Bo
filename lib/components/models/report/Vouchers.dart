// To parse this JSON data, do
//
//     final vouchers = vouchersFromJson(jsonString);

import 'dart:convert';

import 'package:mbo/components/models/distributor.dart';
import 'package:mbo/components/models/pagination.dart';

Vouchers vouchersFromJson(String str) => Vouchers.fromJson(json.decode(str));

String vouchersToJson(Vouchers data) => json.encode(data.toJson());

class Vouchers {
  Vouchers({
    this.items,
    required this.pagination,
    required this.totalAmount,
  });

  List<Item>? items;
  Pagination pagination;
  int totalAmount;

  factory Vouchers.fromJson(Map<String, dynamic> json) => Vouchers(
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
        totalAmount: json["total_amount"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
        "total_amount": totalAmount,
      };
}

class Item {
  Item({
    this.campaign,
    this.claimedAt,
    this.code,
    this.createdAt,
    this.customer,
    this.customerGroupId,
    this.description,
    this.discount,
    this.discountType,
    this.distributor,
    this.distributorApplied,
    this.id,
    this.name,
    this.orderId,
    this.status,
    this.updatedAt,
  });

  Campaign? campaign;
  String? claimedAt;
  String? code;
  String? createdAt;
  Customer? customer;
  int? customerGroupId;
  String? description;
  int? discount;
  String? discountType;
  Distributor? distributor;
  Distributor? distributorApplied;
  int? id;
  String? name;
  int? orderId;
  String? status;
  String? updatedAt;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        campaign: json["campaign"] == null
            ? null
            : Campaign.fromJson(json["campaign"]),
        claimedAt: json["claimed_at"],
        code: json["code"],
        createdAt: json["created_at"],
        customer: json["customer"] == null
            ? null
            : Customer.fromJson(json["customer"]),
        customerGroupId: json["customer_group_id"],
        description: json["description"],
        discount: json["discount"],
        discountType: json["discount_type"],
        distributor: json["distributor"] == null
            ? null
            : Distributor.fromJson(json["distributor"]),
        distributorApplied: json["distributor_applied"] == null
            ? null
            : Distributor.fromJson(json["distributor_applied"]),
        id: json["id"],
        name: json["name"],
        orderId: json["order_id"],
        status: json["status"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "campaign": campaign == null ? null : campaign!.toJson(),
        "claimed_at": claimedAt,
        "code": code,
        "created_at": createdAt,
        "customer": customer == null ? null : customer!.toJson(),
        "customer_group_id": customerGroupId,
        "description": description,
        "discount": discount,
        "discount_type": discountType,
        "distributor": distributor == null ? null : distributor!.toJson(),
        "distributor_applied":
            distributorApplied == null ? null : distributorApplied!.toJson(),
        "id": id,
        "name": name,
        "order_id": orderId,
        "status": status,
        "updated_at": updatedAt,
      };
}

class Campaign {
  Campaign({
    this.description,
    this.endDate,
    this.id,
    this.name,
    this.startDate,
  });

  String? description;
  String? endDate;
  int? id;
  String? name;
  String? startDate;

  factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
        description: json["description"],
        endDate: json["end_date"],
        id: json["id"],
        name: json["name"],
        startDate: json["start_date"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "end_date": endDate,
        "id": id,
        "name": name,
        "start_date": startDate,
      };
}

class Customer {
  Customer({
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

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
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
