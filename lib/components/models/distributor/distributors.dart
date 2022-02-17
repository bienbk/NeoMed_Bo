import 'dart:convert';

import 'package:mbo/components/models/distributor.dart';
import 'package:mbo/components/models/pagination.dart';

Distributors distributorsFromJson(String str) =>
    Distributors.fromJson(json.decode(str));

String distributorsToJson(Distributors data) => json.encode(data.toJson());

class Distributors {
  Distributors({
    required this.distributors,
    required this.pagination,
  });

  List<Distributor> distributors;
  Pagination pagination;

  factory Distributors.fromJson(Map<String, dynamic> json) => Distributors(
        distributors: List<Distributor>.from(
            json["distributors"].map((x) => Distributor.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "distributors": List<dynamic>.from(distributors.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}
