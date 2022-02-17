// To parse this JSON data, do
//
//     final ReportOrderRevenuesStatistic = ReportOrderRevenuesStatisticFromJson(jsonString);

import 'dart:convert';

import 'package:mbo/components/models/distributor.dart';
import 'package:mbo/components/models/pagination.dart';

ReportOrderRevenuesStatistic reportOrderRevenuesStatisticFromJson(String str) =>
    ReportOrderRevenuesStatistic.fromJson(json.decode(str));

String reportOrderRevenuesStatisticToJson(ReportOrderRevenuesStatistic data) =>
    json.encode(data.toJson());

class ReportOrderRevenuesStatistic {
  ReportOrderRevenuesStatistic({
    this.data,
    this.pagination,
    this.totalIncome,
    this.totalNetIncome,
    this.totalTx,
  });

  List<Datum>? data;
  Pagination? pagination;
  int? totalIncome;
  int? totalNetIncome;
  int? totalTx;

  factory ReportOrderRevenuesStatistic.fromJson(Map<String, dynamic> json) =>
      ReportOrderRevenuesStatistic(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
        totalIncome: json["total_income"],
        totalNetIncome: json["total_net_income"],
        totalTx: json["total_tx"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pagination": pagination == null ? null : pagination!.toJson(),
        "total_income": totalIncome,
        "total_net_income": totalNetIncome,
        "total_tx": totalTx,
      };
}

class Datum {
  Datum({
    this.distributor,
    this.product,
    this.totalIncome,
    this.totalNetIncome,
    this.totalTx,
  });

  Distributor? distributor;
  Product? product;
  int? totalIncome;
  int? totalNetIncome;
  int? totalTx;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        distributor: json["distributor"] == null
            ? null
            : Distributor.fromJson(json["distributor"]),
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        totalIncome: json["total_income"],
        totalNetIncome: json["total_net_income"],
        totalTx: json["total_tx"],
      );

  Map<String, dynamic> toJson() => {
        "distributor": distributor == null ? null : distributor!.toJson(),
        "product": product == null ? null : product!.toJson(),
        "total_income": totalIncome,
        "total_net_income": totalNetIncome,
        "total_tx": totalTx,
      };
}

class Product {
  Product({
    this.desc,
    this.distributorId,
    this.id,
    this.images,
    this.name,
  });

  String? desc;
  int? distributorId;
  int? id;
  String? images;
  String? name;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        desc: json["desc"],
        distributorId: json["distributor_id"],
        id: json["id"],
        images: json["images"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "distributor_id": distributorId,
        "id": id,
        "images": images,
        "name": name,
      };
}
