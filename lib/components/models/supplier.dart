// To parse this JSON data, do
//
//     final supplier = supplierFromJson(jsonString);

import 'dart:convert';

import 'package:mbo/components/models/distributor.dart';

Supplier supplierFromJson(String str) => Supplier.fromJson(json.decode(str));

String supplierToJson(Supplier data) => json.encode(data.toJson());

class Supplier {
  Supplier({
    this.address,
    this.createAt,
    this.description,
    this.displayName,
    this.distributor,
    this.id,
    this.logo,
    this.mail,
    this.name,
    this.phone,
    this.representative,
    this.status,
    this.type,
    this.updateAt,
  });

  String? address;
  String? createAt;
  String? description;
  String? displayName;
  Distributor? distributor;
  int? id;
  String? logo;
  String? mail;
  String? name;
  String? phone;
  String? representative;
  int? status;
  int? type;
  String? updateAt;

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
        address: json["address"],
        createAt: json["create_at"],
        description: json["description"],
        displayName: json["display_name"],
        distributor: json["distributor"] == null
            ? null
            : Distributor.fromJson(json["distributor"]),
        id: json["id"],
        logo: json["logo"],
        mail: json["mail"],
        name: json["name"],
        phone: json["phone"],
        representative: json["representative"],
        status: json["status"],
        type: json["type"],
        updateAt: json["update_at"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "create_at": createAt,
        "description": description,
        "display_name": displayName,
        "distributor": distributor == null ? null : distributor!.toJson(),
        "id": id,
        "logo": logo,
        "mail": mail,
        "name": name,
        "phone": phone,
        "representative": representative,
        "status": status,
        "type": type,
        "update_at": updateAt,
      };
}
