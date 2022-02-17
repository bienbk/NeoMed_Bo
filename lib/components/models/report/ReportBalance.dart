// To parse this JSON data, do
//
//     final reportBalance = reportBalanceFromJson(jsonString);

import 'dart:convert';

import 'package:mbo/components/models/distributor.dart';

ReportBalance reportBalanceFromJson(String str) =>
    ReportBalance.fromJson(json.decode(str));

String reportBalanceToJson(ReportBalance data) => json.encode(data.toJson());

class ReportBalance {
  ReportBalance({
    this.distributor,
    this.topup,
    this.payment,
    this.balance,
  });

  Distributor? distributor;
  int? topup;
  int? payment;
  int? balance;

  factory ReportBalance.fromJson(Map<String, dynamic> json) => ReportBalance(
        distributor: json["distributor"] == null
            ? null
            : Distributor.fromJson(json["distributor"]),
        topup: json["topup"],
        payment: json["payment"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "distributor": distributor == null ? null : distributor!.toJson(),
        "topup": topup,
        "payment": payment,
        "balance": balance,
      };
}
