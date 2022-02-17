// To parse this JSON data, do
//
//     final distributor = distributorFromJson(jsonString);

import 'dart:convert';

Distributor distributorFromJson(String str) =>
    Distributor.fromJson(json.decode(str));

String distributorToJson(Distributor data) => json.encode(data.toJson());

class Distributor {
  Distributor({
    this.address,
    this.bankAccount,
    this.businessRegistrationCertImages,
    this.createAt,
    this.email,
    this.groupTelegram,
    this.hotdealPriority,
    this.id,
    this.logo,
    this.merchantId,
    this.name,
    this.nameEn,
    this.nickName,
    this.note,
    this.paymentEnabled,
    this.phone,
    this.productDisplayType,
    this.registeredBusinessAddress,
    this.representative,
    this.sort,
    this.status,
    this.taxNumber,
    this.type,
    this.updateAt,
    this.uploadFile,
  });

  String? address;
  String? bankAccount;
  String? businessRegistrationCertImages;
  String? createAt;
  String? email;
  String? groupTelegram;
  int? hotdealPriority;
  int? id;
  String? logo;
  String? merchantId;
  String? name;
  String? nameEn;
  String? nickName;
  String? note;
  bool? paymentEnabled;
  String? phone;
  int? productDisplayType;
  String? registeredBusinessAddress;
  String? representative;
  int? sort;
  int? status;
  String? taxNumber;
  int? type;
  String? updateAt;
  String? uploadFile;

  factory Distributor.fromJson(Map<String, dynamic> json) => Distributor(
        address: json["address"],
        bankAccount: json["bank_account"],
        businessRegistrationCertImages:
            json["business_registration_cert_images"],
        createAt: json["create_at"],
        email: json["email"],
        groupTelegram: json["group_telegram"],
        hotdealPriority: json["hotdeal_priority"],
        id: json["id"],
        logo: json["logo"],
        merchantId: json["merchant_id"],
        name: json["name"],
        nameEn: json["name_en"],
        nickName: json["nick_name"],
        note: json["note"],
        paymentEnabled: json["payment_enabled"],
        phone: json["phone"],
        productDisplayType: json["product_display_type"],
        registeredBusinessAddress: json["registered_business_address"],
        representative: json["representative"],
        sort: json["sort"],
        status: json["status"],
        taxNumber: json["tax_number"],
        type: json["type"],
        updateAt: json["update_at"],
        uploadFile: json["upload_file"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "bank_account": bankAccount,
        "business_registration_cert_images": businessRegistrationCertImages,
        "create_at": createAt,
        "email": email,
        "group_telegram": groupTelegram,
        "hotdeal_priority": hotdealPriority,
        "id": id,
        "logo": logo,
        "merchant_id": merchantId,
        "name": name,
        "name_en": nameEn,
        "nick_name": nickName,
        "note": note,
        "payment_enabled": paymentEnabled,
        "phone": phone,
        "product_display_type": productDisplayType,
        "registered_business_address": registeredBusinessAddress,
        "representative": representative,
        "sort": sort,
        "status": status,
        "tax_number": taxNumber,
        "type": type,
        "update_at": updateAt,
        "upload_file": uploadFile,
      };
}
