// To parse this JSON data, do
//
//     final updateOrderItem = updateOrderItemFromJson(jsonString);

import 'dart:convert';

UpdateOrderItem updateOrderItemFromJson(String str) =>
    UpdateOrderItem.fromJson(json.decode(str));

String updateOrderItemToJson(UpdateOrderItem data) =>
    json.encode(data.toJson());

class UpdateOrderItem {
  UpdateOrderItem({
    this.changedBy,
    this.noted,
    this.orderItems,
  });

  String? changedBy;
  String? noted;
  List<OrderItem>? orderItems;

  factory UpdateOrderItem.fromJson(Map<String, dynamic> json) =>
      UpdateOrderItem(
        changedBy: json["changed_by"],
        noted: json["noted"],
        orderItems: json["order_items"] == null
            ? null
            : List<OrderItem>.from(
                json["order_items"].map((x) => OrderItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "changed_by": changedBy,
        "noted": noted,
        "order_items": orderItems == null
            ? null
            : List<dynamic>.from(orderItems!.map((x) => x.toJson())),
      };
}

class OrderItem {
  OrderItem({
    this.combo,
    this.desc,
    this.discountAmount,
    this.distributorId,
    this.id,
    this.image,
    this.isVat,
    this.originPrice,
    this.paymentType,
    this.price,
    this.productId,
    this.productName,
    this.productType,
    this.qty,
    this.selectedAt,
    this.subTotal,
    this.supplierId,
    this.vat,
  });

  String? combo;
  String? desc;
  int? discountAmount;
  int? distributorId;
  String? id;
  String? image;
  bool? isVat;
  int? originPrice;
  int? paymentType;
  int? price;
  int? productId;
  String? productName;
  int? productType;
  int? qty;
  int? selectedAt;
  int? subTotal;
  int? supplierId;
  int? vat;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        combo: json["combo"],
        desc: json["desc"],
        discountAmount: json["discount_amount"],
        distributorId: json["distributor_id"],
        id: json["id"],
        image: json["image"],
        isVat: json["is_vat"],
        originPrice: json["origin_price"],
        paymentType: json["payment_type"],
        price: json["price"],
        productId: json["product_id"],
        productName: json["product_name"],
        productType: json["product_type"],
        qty: json["qty"],
        selectedAt: json["selected_at"],
        subTotal: json["sub_total"],
        supplierId: json["supplier_id"],
        vat: json["vat"],
      );

  Map<String, dynamic> toJson() => {
        "combo": combo,
        "desc": desc,
        "discount_amount": discountAmount,
        "distributor_id": distributorId,
        "id": id,
        "image": image,
        "is_vat": isVat,
        "origin_price": originPrice,
        "payment_type": paymentType,
        "price": price,
        "product_id": productId,
        "product_name": productName,
        "product_type": productType,
        "qty": qty,
        "selected_at": selectedAt,
        "sub_total": subTotal,
        "supplier_id": supplierId,
        "vat": vat,
      };
}
