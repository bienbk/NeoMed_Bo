// To parse this JSON data, do
//
//     final voucherHistogram = voucherHistogramFromJson(jsonString);

import 'dart:convert';

VoucherHistogram voucherHistogramFromJson(String str) =>
    VoucherHistogram.fromJson(json.decode(str));

String voucherHistogramToJson(VoucherHistogram data) =>
    json.encode(data.toJson());

class VoucherHistogram {
  VoucherHistogram({
    this.amount,
    this.items,
    this.stats,
  });

  int? amount;
  List<Item>? items;
  List<Stat>? stats;

  factory VoucherHistogram.fromJson(Map<String, dynamic> json) =>
      VoucherHistogram(
        amount: json["amount"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        stats: json["stats"] == null
            ? null
            : List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "stats": stats == null
            ? null
            : List<dynamic>.from(stats!.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.stats,
    this.timePoint,
  });

  List<Stat>? stats;
  String? timePoint;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        stats: json["stats"] == null
            ? null
            : List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        timePoint: json["time_point"],
      );

  Map<String, dynamic> toJson() => {
        "stats": stats == null
            ? null
            : List<dynamic>.from(stats!.map((x) => x.toJson())),
        "time_point": timePoint,
      };
}

class Stat {
  Stat({
    this.amount,
    this.key,
  });

  int? amount;
  String? key;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        amount: json["amount"],
        key: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "key": key,
      };
}
