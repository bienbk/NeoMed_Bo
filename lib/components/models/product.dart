// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

import 'package:mbo/components/models/distributor.dart';
import 'package:mbo/components/models/supplier.dart';
import 'package:mbo/components/models/trademark.dart';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.attribute,
    this.bestsellerPriority,
    this.categories,
    this.combo,
    this.createdAt,
    this.description,
    this.distributionUnit,
    this.distributor,
    this.distributorId,
    this.dosageForms,
    this.exclusiveType,
    this.expireDate,
    this.hotdealPriority,
    this.images,
    this.isBestseller,
    this.isHotdeal,
    this.isWishlist,
    this.mainIngredient,
    this.manufacture,
    this.medicinalProps,
    this.name,
    this.onSale,
    this.origin,
    this.packingSpecs,
    this.paymentType,
    this.price,
    this.productCode,
    this.productId,
    this.productStatus,
    this.productType,
    this.rangePrices,
    this.ratingAverage,
    this.ratingCount,
    this.registeredCode,
    this.salePrice,
    this.saleType,
    this.shortDescription,
    this.sku,
    this.stockQuantity,
    this.stockStatus,
    this.suppliers,
    this.thumbnail,
    this.trademark,
    this.unit,
    this.updatedAt,
    this.vatApplied,
    this.vatValue,
  });

  List<Attribute>? attribute;
  int? bestsellerPriority;
  List<dynamic>? categories;
  List<Combo>? combo;
  String? createdAt;
  String? description;
  String? distributionUnit;
  Distributor? distributor;
  int? distributorId;
  String? dosageForms;
  int? exclusiveType;
  String? expireDate;
  int? hotdealPriority;
  List<String>? images;
  bool? isBestseller;
  bool? isHotdeal;
  bool? isWishlist;
  String? mainIngredient;
  String? manufacture;
  String? medicinalProps;
  String? name;
  bool? onSale;
  String? origin;
  String? packingSpecs;
  int? paymentType;
  int? price;
  String? productCode;
  int? productId;
  int? productStatus;
  int? productType;
  List<RangePrice>? rangePrices;
  int? ratingAverage;
  int? ratingCount;
  String? registeredCode;
  int? salePrice;
  int? saleType;
  String? shortDescription;
  String? sku;
  int? stockQuantity;
  int? stockStatus;
  List<Supplier>? suppliers;
  String? thumbnail;
  Trademark? trademark;
  String? unit;
  String? updatedAt;
  bool? vatApplied;
  int? vatValue;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        attribute: json["attribute"] == null
            ? null
            : List<Attribute>.from(
                json["attribute"].map((x) => Attribute.fromJson(x))),
        bestsellerPriority: json["bestseller_priority"],
        categories: json["categories"] == null
            ? null
            : List<dynamic>.from(json["categories"].map((x) => x)),
        combo: json["combo"] == null
            ? null
            : List<Combo>.from(json["combo"].map((x) => Combo.fromJson(x))),
        createdAt: json["created_at"],
        description: json["description"],
        distributionUnit: json["distribution_unit"],
        distributor: json["distributor"] == null
            ? null
            : Distributor.fromJson(json["distributor"]),
        distributorId: json["distributor_id"],
        dosageForms: json["dosage_forms"],
        exclusiveType: json["exclusive_type"],
        expireDate: json["expire_date"],
        hotdealPriority: json["hotdeal_priority"],
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"].map((x) => x)),
        isBestseller: json["is_bestseller"],
        isHotdeal: json["is_hotdeal"],
        isWishlist: json["is_wishlist"],
        mainIngredient: json["main_ingredient"],
        manufacture: json["manufacture"],
        medicinalProps: json["medicinal_props"],
        name: json["name"],
        onSale: json["on_sale"],
        origin: json["origin"],
        packingSpecs: json["packing_specs"],
        paymentType: json["payment_type"],
        price: json["price"],
        productCode: json["product_code"],
        productId: json["product_id"],
        productStatus: json["product_status"],
        productType: json["product_type"],
        rangePrices: json["range_prices"] == null
            ? null
            : List<RangePrice>.from(
                json["range_prices"].map((x) => RangePrice.fromJson(x))),
        ratingAverage: json["rating_average"],
        ratingCount: json["rating_count"],
        registeredCode: json["registered_code"],
        salePrice: json["sale_price"],
        saleType: json["sale_type"],
        shortDescription: json["short_description"],
        sku: json["sku"],
        stockQuantity: json["stock_quantity"],
        stockStatus: json["stock_status"],
        suppliers: json["suppliers"] == null
            ? null
            : List<Supplier>.from(
                json["suppliers"].map((x) => Supplier.fromJson(x))),
        thumbnail: json["thumbnail"],
        trademark: json["trademark"] == null
            ? null
            : Trademark.fromJson(json["trademark"]),
        unit: json["unit"],
        updatedAt: json["updated_at"],
        vatApplied: json["vat_applied"],
        vatValue: json["vat_value"],
      );

  Map<String, dynamic> toJson() => {
        "attribute": attribute == null
            ? null
            : List<dynamic>.from(attribute!.map((x) => x.toJson())),
        "bestseller_priority": bestsellerPriority,
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories!.map((x) => x)),
        "combo": combo == null
            ? null
            : List<dynamic>.from(combo!.map((x) => x.toJson())),
        "created_at": createdAt,
        "description": description,
        "distribution_unit": distributionUnit,
        "distributor": distributor == null ? null : distributor!.toJson(),
        "distributor_id": distributorId,
        "dosage_forms": dosageForms,
        "exclusive_type": exclusiveType,
        "expire_date": expireDate,
        "hotdeal_priority": hotdealPriority,
        "images":
            images == null ? null : List<dynamic>.from(images!.map((x) => x)),
        "is_bestseller": isBestseller,
        "is_hotdeal": isHotdeal,
        "is_wishlist": isWishlist,
        "main_ingredient": mainIngredient,
        "manufacture": manufacture,
        "medicinal_props": medicinalProps,
        "name": name,
        "on_sale": onSale,
        "origin": origin,
        "packing_specs": packingSpecs,
        "payment_type": paymentType,
        "price": price,
        "product_code": productCode,
        "product_id": productId,
        "product_status": productStatus,
        "product_type": productType,
        "range_prices": rangePrices == null
            ? null
            : List<dynamic>.from(rangePrices!.map((x) => x.toJson())),
        "rating_average": ratingAverage,
        "rating_count": ratingCount,
        "registered_code": registeredCode,
        "sale_price": salePrice,
        "sale_type": saleType,
        "short_description": shortDescription,
        "sku": sku,
        "stock_quantity": stockQuantity,
        "stock_status": stockStatus,
        "suppliers": suppliers == null
            ? null
            : List<dynamic>.from(suppliers!.map((x) => x.toJson())),
        "thumbnail": thumbnail,
        "trademark": trademark == null ? null : trademark!.toJson(),
        "unit": unit,
        "updated_at": updatedAt,
        "vat_applied": vatApplied,
        "vat_value": vatValue,
      };
}

class Attribute {
  Attribute({
    this.attributeId,
    this.createdAt,
    this.key,
    this.productId,
    this.sorting,
    this.status,
    this.updatedAt,
    this.value,
  });

  int? attributeId;
  String? createdAt;
  String? key;
  int? productId;
  int? sorting;
  int? status;
  String? updatedAt;
  String? value;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        attributeId: json["attribute_id"],
        createdAt: json["created_at"],
        key: json["key"],
        productId: json["product_id"],
        sorting: json["sorting"],
        status: json["status"],
        updatedAt: json["updated_at"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "attribute_id": attributeId,
        "created_at": createdAt,
        "key": key,
        "product_id": productId,
        "sorting": sorting,
        "status": status,
        "updated_at": updatedAt,
        "value": value,
      };
}

class Combo {
  Combo({
    this.createdAt,
    this.id,
    this.isPromo,
    this.quantity,
    this.refProduct,
    this.salePrice,
    this.updatedAt,
  });

  String? createdAt;
  int? id;
  bool? isPromo;
  int? quantity;
  RefProduct? refProduct;
  int? salePrice;
  String? updatedAt;

  factory Combo.fromJson(Map<String, dynamic> json) => Combo(
        createdAt: json["created_at"],
        id: json["id"],
        isPromo: json["is_promo"],
        quantity: json["quantity"],
        refProduct: json["ref_product"] == null
            ? null
            : RefProduct.fromJson(json["ref_product"]),
        salePrice: json["sale_price"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "id": id,
        "is_promo": isPromo,
        "quantity": quantity,
        "ref_product": refProduct == null ? null : refProduct!.toJson(),
        "sale_price": salePrice,
        "updated_at": updatedAt,
      };
}

class RefProduct {
  RefProduct({
    this.createdAt,
    this.description,
    this.distributionUnit,
    this.distributorId,
    this.dosageForms,
    this.exclusiveType,
    this.expireDate,
    this.images,
    this.isWishlist,
    this.mainIngredient,
    this.manufacture,
    this.medicinalProps,
    this.name,
    this.origin,
    this.packingSpecs,
    this.paymentType,
    this.price,
    this.productCode,
    this.productId,
    this.productStatus,
    this.productType,
    this.registeredCode,
    this.salePrice,
    this.saleType,
    this.shortDescription,
    this.thumbnail,
    this.trademark,
    this.unit,
    this.updatedAt,
    this.vatApplied,
    this.vatValue,
  });

  String? createdAt;
  String? description;
  String? distributionUnit;
  int? distributorId;
  String? dosageForms;
  int? exclusiveType;
  String? expireDate;
  List<String>? images;
  bool? isWishlist;
  String? mainIngredient;
  String? manufacture;
  String? medicinalProps;
  String? name;
  String? origin;
  String? packingSpecs;
  int? paymentType;
  int? price;
  String? productCode;
  int? productId;
  int? productStatus;
  int? productType;
  String? registeredCode;
  int? salePrice;
  int? saleType;
  String? shortDescription;
  String? thumbnail;
  int? trademark;
  String? unit;
  String? updatedAt;
  bool? vatApplied;
  int? vatValue;

  factory RefProduct.fromJson(Map<String, dynamic> json) => RefProduct(
        createdAt: json["created_at"],
        description: json["description"],
        distributionUnit: json["distribution_unit"],
        distributorId: json["distributor_id"],
        dosageForms: json["dosage_forms"],
        exclusiveType: json["exclusive_type"],
        expireDate: json["expire_date"],
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"].map((x) => x)),
        isWishlist: json["is_wishlist"],
        mainIngredient: json["main_ingredient"],
        manufacture: json["manufacture"],
        medicinalProps: json["medicinal_props"],
        name: json["name"],
        origin: json["origin"],
        packingSpecs: json["packing_specs"],
        paymentType: json["payment_type"],
        price: json["price"],
        productCode: json["product_code"],
        productId: json["product_id"],
        productStatus: json["product_status"],
        productType: json["product_type"],
        registeredCode: json["registered_code"],
        salePrice: json["sale_price"],
        saleType: json["sale_type"],
        shortDescription: json["short_description"],
        thumbnail: json["thumbnail"],
        trademark: json["trademark"],
        unit: json["unit"],
        updatedAt: json["updated_at"],
        vatApplied: json["vat_applied"],
        vatValue: json["vat_value"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "description": description,
        "distribution_unit": distributionUnit,
        "distributor_id": distributorId,
        "dosage_forms": dosageForms,
        "exclusive_type": exclusiveType,
        "expire_date": expireDate,
        "images":
            images == null ? null : List<dynamic>.from(images!.map((x) => x)),
        "is_wishlist": isWishlist,
        "main_ingredient": mainIngredient,
        "manufacture": manufacture,
        "medicinal_props": medicinalProps,
        "name": name,
        "origin": origin,
        "packing_specs": packingSpecs,
        "payment_type": paymentType,
        "price": price,
        "product_code": productCode,
        "product_id": productId,
        "product_status": productStatus,
        "product_type": productType,
        "registered_code": registeredCode,
        "sale_price": salePrice,
        "sale_type": saleType,
        "short_description": shortDescription,
        "thumbnail": thumbnail,
        "trademark": trademark,
        "unit": unit,
        "updated_at": updatedAt,
        "vat_applied": vatApplied,
        "vat_value": vatValue,
      };
}

class RangePrice {
  RangePrice({
    this.discount,
    this.minQuantity,
    this.salePrice,
  });

  int? discount;
  int? minQuantity;
  int? salePrice;

  factory RangePrice.fromJson(Map<String, dynamic> json) => RangePrice(
        discount: json["discount"],
        minQuantity: json["min_quantity"],
        salePrice: json["sale_price"],
      );

  Map<String, dynamic> toJson() => {
        "discount": discount,
        "min_quantity": minQuantity,
        "sale_price": salePrice,
      };
}
