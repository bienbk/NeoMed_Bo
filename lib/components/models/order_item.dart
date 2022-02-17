// To parse this JSON data, do
//
//     final orderItem = orderItemFromJson(jsonString);

/// This class is for parsing the order of items (Again, why they don't sum the damn up?)

import 'dart:convert';

OrderItem orderItemFromJson(String str) => OrderItem.fromJson(json.decode(str));

String orderItemToJson(OrderItem data) => json.encode(data.toJson());

class OrderItem {
  OrderItem({
    this.id,
    this.productId,
    this.productName,
    this.productDesc,
    this.productImage,
    this.price,
    this.priceSale,
    this.quantity,
    this.paymentType,
    this.distributorId,
    this.latestPrice,
    this.latestPriceSale,
    this.productType,
    this.selectedAt,
  });

  String? id;
  int? productId;
  String? productName;
  String? productDesc;
  String? productImage;
  int? price;
  int? priceSale;
  int? quantity;
  int? paymentType;
  int? distributorId;
  int? latestPrice;
  int? latestPriceSale;
  int? productType;
  int? selectedAt;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        productId: json["product_id"],
        productName: json["product_name"],
        productDesc: json["product_desc"],
        productImage: json["product_image"],
        price: json["price"],
        priceSale: json["price_sale"],
        quantity: json["quantity"],
        paymentType: json["payment_type"],
        distributorId: json["distributor_id"],
        latestPrice: json["latest_price"],
        latestPriceSale: json["latest_price_sale"],
        productType: json["product_type"],
        selectedAt: json["selected_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "product_name": productName,
        "product_desc": productDesc,
        "product_image": productImage,
        "price": price,
        "price_sale": priceSale,
        "quantity": quantity,
        "payment_type": paymentType,
        "distributor_id": distributorId,
        "latest_price": latestPrice,
        "latest_price_sale": latestPriceSale,
        "product_type": productType,
        "selected_at": selectedAt,
      };
}

extension OrderItemExtension on OrderItem {
  List<String> get getImageLinks {
    return (productImage ?? '')
        .replaceAll(RegExp(r'\[|\]'), '')
        .replaceAll(RegExp(r'"'), '')
        .split(',');
  }
}
