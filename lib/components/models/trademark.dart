// To parse this JSON data, do
//
//     final trademark = trademarkFromJson(jsonString);

import 'dart:convert';

import 'package:mbo/components/models/distributor.dart';

Trademark trademarkFromJson(String str) => Trademark.fromJson(json.decode(str));

String trademarkToJson(Trademark data) => json.encode(data.toJson());

class Trademark {
  Trademark({
    this.advertisePriority,
    this.createdAt,
    this.description,
    this.distributor,
    this.distributorId,
    this.id,
    this.images,
    this.isAdvertise,
    this.name,
    this.status,
    this.updatedAt,
  });

  int? advertisePriority;
  String? createdAt;
  String? description;
  Distributor? distributor;
  int? distributorId;
  int? id;
  String? images;
  bool? isAdvertise;
  String? name;
  int? status;
  String? updatedAt;

  factory Trademark.fromJson(Map<String, dynamic> json) => Trademark(
        advertisePriority: json["advertise_priority"],
        createdAt: json["created_at"],
        description: json["description"],
        distributor: json["distributor"] == null
            ? null
            : Distributor.fromJson(json["distributor"]),
        distributorId: json["distributor_id"],
        id: json["id"],
        images: json["images"],
        isAdvertise: json["is_advertise"],
        name: json["name"],
        status: json["status"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "advertise_priority": advertisePriority,
        "created_at": createdAt,
        "description": description,
        "distributor": distributor == null ? null : distributor!.toJson(),
        "distributor_id": distributorId,
        "id": id,
        "images": images,
        "is_advertise": isAdvertise,
        "name": name,
        "status": status,
        "updated_at": updatedAt,
      };
}
