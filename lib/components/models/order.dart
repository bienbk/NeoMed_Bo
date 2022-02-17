// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

import 'package:mbo/components/models/order_item.dart';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    this.address,
    this.cancelledTime,
    this.completedTime,
    this.createdTime,
    this.discount,
    this.distributor,
    this.fee,
    this.fulfillmentStatus,
    this.isCancelable,
    this.isPaymentable,
    this.items,
    this.metadata,
    this.nextStatus,
    this.orderId,
    this.orderStatus,
    this.paidTime,
    this.paymentStatus,
    this.paymentType,
    this.paymentTypeName,
    this.productPaymentType,
    this.promotion,
    this.shippedTime,
    this.shippingMethod,
    this.stateHistories,
    this.supplier,
    this.surcharge,
    this.sysDiscount,
    this.total,
    this.totalSale,
    this.trackingInfo,
    this.transId,
    this.updatedTime,
    this.user,
    this.userId,
  });

  String? address;
  String? cancelledTime;
  String? completedTime;
  String? createdTime;
  int? discount;
  OrderDistributor? distributor;
  int? fee;
  int? fulfillmentStatus;
  bool? isCancelable;
  bool? isPaymentable;
  String? items;
  Metadata? metadata;
  List<NextStatus>? nextStatus;
  String? orderId;
  int? orderStatus;
  String? paidTime;
  int? paymentStatus;
  String? paymentType;
  String? paymentTypeName;
  int? productPaymentType;
  String? promotion;
  String? shippedTime;
  String? shippingMethod;
  List<StateHistory>? stateHistories;
  int? supplier;
  int? surcharge;
  int? sysDiscount;
  int? total;
  int? totalSale;
  TrackingInfo? trackingInfo;
  String? transId;
  String? updatedTime;
  User? user;
  String? userId;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        address: json["address"],
        cancelledTime: json["cancelled_time"],
        completedTime: json["completed_time"],
        createdTime: json["created_time"],
        discount: json["discount"],
        distributor: json["distributor"] == null
            ? null
            : OrderDistributor.fromJson(json["distributor"]),
        fee: json["fee"],
        fulfillmentStatus: json["fulfillment_status"],
        isCancelable: json["is_cancelable"],
        isPaymentable: json["is_paymentable"],
        items: json["items"],
        metadata: json["metadata"] == null
            ? null
            : Metadata.fromJson(json["metadata"]),
        nextStatus: json["next_status"] == null
            ? null
            : List<NextStatus>.from(
                json["next_status"].map((x) => NextStatus.fromJson(x))),
        orderId: json["order_id"],
        orderStatus: json["order_status"],
        paidTime: json["paid_time"],
        paymentStatus: json["payment_status"],
        paymentType: json["payment_type"],
        paymentTypeName: json["payment_type_name"],
        productPaymentType: json["product_payment_type"],
        promotion: json["promotion"],
        shippedTime: json["shipped_time"],
        shippingMethod: json["shipping_method"],
        stateHistories: json["state_histories"] == null
            ? null
            : List<StateHistory>.from(
                json["state_histories"].map((x) => StateHistory.fromJson(x))),
        supplier: json["supplier"],
        surcharge: json["surcharge"],
        sysDiscount: json["sys_discount"],
        total: json["total"],
        totalSale: json["total_sale"],
        trackingInfo: json["tracking_info"] == null
            ? null
            : TrackingInfo.fromJson(json["tracking_info"]),
        transId: json["trans_id"],
        updatedTime: json["updated_time"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "cancelled_time": cancelledTime,
        "completed_time": completedTime,
        "created_time": createdTime,
        "discount": discount,
        "distributor": distributor == null ? null : distributor!.toJson(),
        "fee": fee,
        "fulfillment_status": fulfillmentStatus,
        "is_cancelable": isCancelable,
        "is_paymentable": isPaymentable,
        "items": items,
        "metadata": metadata == null ? null : metadata!.toJson(),
        "next_status": nextStatus == null
            ? null
            : List<dynamic>.from(nextStatus!.map((x) => x.toJson())),
        "order_id": orderId,
        "order_status": orderStatus,
        "paid_time": paidTime,
        "payment_status": paymentStatus,
        "payment_type": paymentType,
        "payment_type_name": paymentTypeName,
        "product_payment_type": productPaymentType,
        "promotion": promotion,
        "shipped_time": shippedTime,
        "shipping_method": shippingMethod,
        "state_histories": stateHistories == null
            ? null
            : List<dynamic>.from(stateHistories!.map((x) => x.toJson())),
        "supplier": supplier,
        "surcharge": surcharge,
        "sys_discount": sysDiscount,
        "total": total,
        "total_sale": totalSale,
        "tracking_info": trackingInfo == null ? null : trackingInfo!.toJson(),
        "trans_id": transId,
        "updated_time": updatedTime,
        "user": user == null ? null : user!.toJson(),
        "user_id": userId,
      };
}

class OrderDistributor {
  OrderDistributor({
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

  factory OrderDistributor.fromJson(Map<String, dynamic> json) =>
      OrderDistributor(
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

class Metadata {
  Metadata({
    this.accumulation,
    this.neoVoucher,
    this.noted,
    this.promoProducts,
    this.promotions,
    this.sysDiscount,
    this.voucher,
  });

  int? accumulation;
  String? neoVoucher;
  String? noted;
  List<PromoProduct>? promoProducts;
  List<Promotion>? promotions;
  int? sysDiscount;
  String? voucher;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        accumulation: json["accumulation"],
        neoVoucher: json["neo_voucher"],
        noted: json["noted"],
        promoProducts: json["promo_products"] == null
            ? null
            : List<PromoProduct>.from(
                json["promo_products"].map((x) => PromoProduct.fromJson(x))),
        promotions: json["promotions"] == null
            ? null
            : List<Promotion>.from(
                json["promotions"].map((x) => Promotion.fromJson(x))),
        sysDiscount: json["sys_discount"],
        voucher: json["voucher"],
      );

  Map<String, dynamic> toJson() => {
        "accumulation": accumulation,
        "neo_voucher": neoVoucher,
        "noted": noted,
        "promo_products": promoProducts == null
            ? null
            : List<dynamic>.from(promoProducts!.map((x) => x.toJson())),
        "promotions": promotions == null
            ? null
            : List<dynamic>.from(promotions!.map((x) => x.toJson())),
        "sys_discount": sysDiscount,
        "voucher": voucher,
      };
}

class PromoProduct {
  PromoProduct({
    this.campaignId,
    this.productIds,
  });

  int? campaignId;
  List<int>? productIds;

  factory PromoProduct.fromJson(Map<String, dynamic> json) => PromoProduct(
        campaignId: json["campaign_id"],
        productIds: json["product_ids"] == null
            ? null
            : List<int>.from(json["product_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "campaign_id": campaignId,
        "product_ids": productIds == null
            ? null
            : List<dynamic>.from(productIds!.map((x) => x)),
      };
}

class Promotion {
  Promotion({
    this.accumulationOrderMeta,
    this.campaignType,
    this.comboAdvanceMeta,
    this.comboMeta,
    this.createdAt,
    this.customerGroup,
    this.daysInWeek,
    this.description,
    this.discountBuyingProductsMeta,
    this.discountOrderMeta,
    this.distributor,
    this.distributorId,
    this.endDate,
    this.endTime,
    this.giftBuyingProductsMeta,
    this.giftOrderMeta,
    this.id,
    this.images,
    this.isOrderValid,
    this.name,
    this.promoWalletId,
    this.promotionFee,
    this.shortDescription,
    this.spentBudget,
    this.startDate,
    this.startTime,
    this.status,
    this.topUpMeta,
    this.totalPromotionBudget,
    this.updatedAt,
    this.voucherMeta,
  });

  AccumulationOrderMeta? accumulationOrderMeta;
  int? campaignType;
  Meta? comboAdvanceMeta;
  ComboMeta? comboMeta;
  String? createdAt;
  int? customerGroup;
  String? daysInWeek;
  String? description;
  DiscountBuyingProductsMeta? discountBuyingProductsMeta;
  DiscountOrderMeta? discountOrderMeta;
  PromotionDistributor? distributor;
  int? distributorId;
  String? endDate;
  String? endTime;
  GiftBuyingProductsMeta? giftBuyingProductsMeta;
  Meta? giftOrderMeta;
  int? id;
  String? images;
  bool? isOrderValid;
  String? name;
  int? promoWalletId;
  int? promotionFee;
  String? shortDescription;
  int? spentBudget;
  String? startDate;
  String? startTime;
  int? status;
  TopUpMeta? topUpMeta;
  int? totalPromotionBudget;
  String? updatedAt;
  VoucherMeta? voucherMeta;

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        accumulationOrderMeta: json["accumulation_order_meta"] == null
            ? null
            : AccumulationOrderMeta.fromJson(json["accumulation_order_meta"]),
        campaignType: json["campaign_type"],
        comboAdvanceMeta: json["combo_advance_meta"] == null
            ? null
            : Meta.fromJson(json["combo_advance_meta"]),
        comboMeta: json["combo_meta"] == null
            ? null
            : ComboMeta.fromJson(json["combo_meta"]),
        createdAt: json["created_at"],
        customerGroup: json["customer_group"],
        daysInWeek: json["days_in_week"],
        description: json["description"],
        discountBuyingProductsMeta:
            json["discount_buying_products_meta"] == null
                ? null
                : DiscountBuyingProductsMeta.fromJson(
                    json["discount_buying_products_meta"]),
        discountOrderMeta: json["discount_order_meta"] == null
            ? null
            : DiscountOrderMeta.fromJson(json["discount_order_meta"]),
        distributor: json["distributor"] == null
            ? null
            : PromotionDistributor.fromJson(json["distributor"]),
        distributorId: json["distributor_id"],
        endDate: json["end_date"],
        endTime: json["end_time"],
        giftBuyingProductsMeta: json["gift_buying_products_meta"] == null
            ? null
            : GiftBuyingProductsMeta.fromJson(
                json["gift_buying_products_meta"]),
        giftOrderMeta: json["gift_order_meta"] == null
            ? null
            : Meta.fromJson(json["gift_order_meta"]),
        id: json["id"],
        images: json["images"],
        isOrderValid: json["is_order_valid"],
        name: json["name"],
        promoWalletId: json["promo_wallet_id"],
        promotionFee: json["promotion_fee"],
        shortDescription: json["short_description"],
        spentBudget: json["spent_budget"],
        startDate: json["start_date"],
        startTime: json["start_time"],
        status: json["status"],
        topUpMeta: json["top_up_meta"] == null
            ? null
            : TopUpMeta.fromJson(json["top_up_meta"]),
        totalPromotionBudget: json["total_promotion_budget"],
        updatedAt: json["updated_at"],
        voucherMeta: json["voucher_meta"] == null
            ? null
            : VoucherMeta.fromJson(json["voucher_meta"]),
      );

  Map<String, dynamic> toJson() => {
        "accumulation_order_meta": accumulationOrderMeta == null
            ? null
            : accumulationOrderMeta!.toJson(),
        "campaign_type": campaignType,
        "combo_advance_meta":
            comboAdvanceMeta == null ? null : comboAdvanceMeta!.toJson(),
        "combo_meta": comboMeta == null ? null : comboMeta!.toJson(),
        "created_at": createdAt,
        "customer_group": customerGroup,
        "days_in_week": daysInWeek,
        "description": description,
        "discount_buying_products_meta": discountBuyingProductsMeta == null
            ? null
            : discountBuyingProductsMeta!.toJson(),
        "discount_order_meta":
            discountOrderMeta == null ? null : discountOrderMeta!.toJson(),
        "distributor": distributor == null ? null : distributor!.toJson(),
        "distributor_id": distributorId,
        "end_date": endDate,
        "end_time": endTime,
        "gift_buying_products_meta": giftBuyingProductsMeta == null
            ? null
            : giftBuyingProductsMeta!.toJson(),
        "gift_order_meta":
            giftOrderMeta == null ? null : giftOrderMeta!.toJson(),
        "id": id,
        "images": images,
        "is_order_valid": isOrderValid,
        "name": name,
        "promo_wallet_id": promoWalletId,
        "promotion_fee": promotionFee,
        "short_description": shortDescription,
        "spent_budget": spentBudget,
        "start_date": startDate,
        "start_time": startTime,
        "status": status,
        "top_up_meta": topUpMeta == null ? null : topUpMeta!.toJson(),
        "total_promotion_budget": totalPromotionBudget,
        "updated_at": updatedAt,
        "voucher_meta": voucherMeta == null ? null : voucherMeta!.toJson(),
      };
}

class AccumulationOrderMeta {
  AccumulationOrderMeta({
    this.items,
  });

  List<AccumulationOrderMetaItem>? items;

  factory AccumulationOrderMeta.fromJson(Map<String, dynamic> json) =>
      AccumulationOrderMeta(
        items: json["items"] == null
            ? null
            : List<AccumulationOrderMetaItem>.from(json["items"]
                .map((x) => AccumulationOrderMetaItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class AccumulationOrderMetaItem {
  AccumulationOrderMetaItem({
    this.accumulationLimit,
    this.accumulationRate,
    this.amount,
    this.isOrderValid,
    this.orderLimit,
  });

  int? accumulationLimit;
  int? accumulationRate;
  int? amount;
  bool? isOrderValid;
  int? orderLimit;

  factory AccumulationOrderMetaItem.fromJson(Map<String, dynamic> json) =>
      AccumulationOrderMetaItem(
        accumulationLimit: json["accumulation_limit"],
        accumulationRate: json["accumulation_rate"],
        amount: json["amount"],
        isOrderValid: json["is_order_valid"],
        orderLimit: json["order_limit"],
      );

  Map<String, dynamic> toJson() => {
        "accumulation_limit": accumulationLimit,
        "accumulation_rate": accumulationRate,
        "amount": amount,
        "is_order_valid": isOrderValid,
        "order_limit": orderLimit,
      };
}

class Meta {
  Meta({
    this.isGiftSelection,
    this.items,
  });

  bool? isGiftSelection;
  List<ComboAdvanceMetaItem>? items;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        isGiftSelection: json["is_gift_selection"],
        items: json["items"] == null
            ? null
            : List<ComboAdvanceMetaItem>.from(
                json["items"].map((x) => ComboAdvanceMetaItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "is_gift_selection": isGiftSelection,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class ComboAdvanceMetaItem {
  ComboAdvanceMetaItem({
    this.appliedProducts,
    this.giftSelectionLimit,
    this.gifts,
    this.isOrderValid,
    this.orderLimit,
  });

  List<AppliedProduct>? appliedProducts;
  int? giftSelectionLimit;
  List<AppliedProduct>? gifts;
  bool? isOrderValid;
  int? orderLimit;

  factory ComboAdvanceMetaItem.fromJson(Map<String, dynamic> json) =>
      ComboAdvanceMetaItem(
        appliedProducts: json["applied_products"] == null
            ? null
            : List<AppliedProduct>.from(json["applied_products"]
                .map((x) => AppliedProduct.fromJson(x))),
        giftSelectionLimit: json["gift_selection_limit"],
        gifts: json["gifts"] == null
            ? null
            : List<AppliedProduct>.from(
                json["gifts"].map((x) => AppliedProduct.fromJson(x))),
        isOrderValid: json["is_order_valid"],
        orderLimit: json["order_limit"],
      );

  Map<String, dynamic> toJson() => {
        "applied_products": appliedProducts == null
            ? null
            : List<dynamic>.from(appliedProducts!.map((x) => x.toJson())),
        "gift_selection_limit": giftSelectionLimit,
        "gifts": gifts == null
            ? null
            : List<dynamic>.from(gifts!.map((x) => x.toJson())),
        "is_order_valid": isOrderValid,
        "order_limit": orderLimit,
      };
}

class AppliedProduct {
  AppliedProduct({
    this.product,
    this.quantity,
  });

  Product? product;
  int? quantity;

  factory AppliedProduct.fromJson(Map<String, dynamic> json) => AppliedProduct(
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "product": product == null ? null : product!.toJson(),
        "quantity": quantity,
      };
}

class Product {
  Product({
    this.images,
    this.name,
    this.price,
    this.productId,
    this.salePrice,
    this.thumbnail,
  });

  List<String>? images;
  String? name;
  int? price;
  int? productId;
  int? salePrice;
  String? thumbnail;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"].map((x) => x)),
        name: json["name"],
        price: json["price"],
        productId: json["product_id"],
        salePrice: json["sale_price"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "images":
            images == null ? null : List<dynamic>.from(images!.map((x) => x)),
        "name": name,
        "price": price,
        "product_id": productId,
        "sale_price": salePrice,
        "thumbnail": thumbnail,
      };
}

class ComboMeta {
  ComboMeta({
    this.products,
  });

  List<Product>? products;

  factory ComboMeta.fromJson(Map<String, dynamic> json) => ComboMeta(
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": products == null
            ? null
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class DiscountBuyingProductsMeta {
  DiscountBuyingProductsMeta({
    this.appliedProducts,
    this.items,
  });

  List<Product>? appliedProducts;
  List<DiscountBuyingProductsMetaItem>? items;

  factory DiscountBuyingProductsMeta.fromJson(Map<String, dynamic> json) =>
      DiscountBuyingProductsMeta(
        appliedProducts: json["applied_products"] == null
            ? null
            : List<Product>.from(
                json["applied_products"].map((x) => Product.fromJson(x))),
        items: json["items"] == null
            ? null
            : List<DiscountBuyingProductsMetaItem>.from(json["items"]
                .map((x) => DiscountBuyingProductsMetaItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "applied_products": appliedProducts == null
            ? null
            : List<dynamic>.from(appliedProducts!.map((x) => x.toJson())),
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class DiscountBuyingProductsMetaItem {
  DiscountBuyingProductsMetaItem({
    this.amount,
    this.discountLimit,
    this.discountRate,
    this.isOrderValid,
    this.minAppliedQty,
    this.orderLimit,
  });

  int? amount;
  int? discountLimit;
  int? discountRate;
  bool? isOrderValid;
  int? minAppliedQty;
  int? orderLimit;

  factory DiscountBuyingProductsMetaItem.fromJson(Map<String, dynamic> json) =>
      DiscountBuyingProductsMetaItem(
        amount: json["amount"],
        discountLimit: json["discount_limit"],
        discountRate: json["discount_rate"],
        isOrderValid: json["is_order_valid"],
        minAppliedQty: json["min_applied_qty"],
        orderLimit: json["order_limit"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "discount_limit": discountLimit,
        "discount_rate": discountRate,
        "is_order_valid": isOrderValid,
        "min_applied_qty": minAppliedQty,
        "order_limit": orderLimit,
      };
}

class DiscountOrderMeta {
  DiscountOrderMeta({
    this.items,
  });

  List<DiscountBuyingProductsMetaItem>? items;

  factory DiscountOrderMeta.fromJson(Map<String, dynamic> json) =>
      DiscountOrderMeta(
        items: json["items"] == null
            ? null
            : List<DiscountBuyingProductsMetaItem>.from(json["items"]
                .map((x) => DiscountBuyingProductsMetaItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class PromotionDistributor {
  PromotionDistributor({
    this.businessRegistrationCertImages,
    this.id,
    this.logo,
    this.name,
    this.nameEn,
    this.nickName,
    this.registeredBusinessAddress,
    this.uploadFile,
  });

  String? businessRegistrationCertImages;
  int? id;
  String? logo;
  String? name;
  String? nameEn;
  String? nickName;
  String? registeredBusinessAddress;
  String? uploadFile;

  factory PromotionDistributor.fromJson(Map<String, dynamic> json) =>
      PromotionDistributor(
        businessRegistrationCertImages:
            json["business_registration_cert_images"],
        id: json["id"],
        logo: json["logo"],
        name: json["name"],
        nameEn: json["name_en"],
        nickName: json["nick_name"],
        registeredBusinessAddress: json["registered_business_address"],
        uploadFile: json["upload_file"],
      );

  Map<String, dynamic> toJson() => {
        "business_registration_cert_images": businessRegistrationCertImages,
        "id": id,
        "logo": logo,
        "name": name,
        "name_en": nameEn,
        "nick_name": nickName,
        "registered_business_address": registeredBusinessAddress,
        "upload_file": uploadFile,
      };
}

class GiftBuyingProductsMeta {
  GiftBuyingProductsMeta({
    this.appliedProducts,
    this.isGiftSelection,
    this.items,
  });

  List<Product>? appliedProducts;
  bool? isGiftSelection;
  List<GiftBuyingProductsMetaItem>? items;

  factory GiftBuyingProductsMeta.fromJson(Map<String, dynamic> json) =>
      GiftBuyingProductsMeta(
        appliedProducts: json["applied_products"] == null
            ? null
            : List<Product>.from(
                json["applied_products"].map((x) => Product.fromJson(x))),
        isGiftSelection: json["is_gift_selection"],
        items: json["items"] == null
            ? null
            : List<GiftBuyingProductsMetaItem>.from(json["items"]
                .map((x) => GiftBuyingProductsMetaItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "applied_products": appliedProducts == null
            ? null
            : List<dynamic>.from(appliedProducts!.map((x) => x.toJson())),
        "is_gift_selection": isGiftSelection,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class GiftBuyingProductsMetaItem {
  GiftBuyingProductsMetaItem({
    this.giftSelectionLimit,
    this.gifts,
    this.isOrderValid,
    this.minAppliedQty,
    this.orderLimit,
  });

  int? giftSelectionLimit;
  List<AppliedProduct>? gifts;
  bool? isOrderValid;
  int? minAppliedQty;
  int? orderLimit;

  factory GiftBuyingProductsMetaItem.fromJson(Map<String, dynamic> json) =>
      GiftBuyingProductsMetaItem(
        giftSelectionLimit: json["gift_selection_limit"],
        gifts: json["gifts"] == null
            ? null
            : List<AppliedProduct>.from(
                json["gifts"].map((x) => AppliedProduct.fromJson(x))),
        isOrderValid: json["is_order_valid"],
        minAppliedQty: json["min_applied_qty"],
        orderLimit: json["order_limit"],
      );

  Map<String, dynamic> toJson() => {
        "gift_selection_limit": giftSelectionLimit,
        "gifts": gifts == null
            ? null
            : List<dynamic>.from(gifts!.map((x) => x.toJson())),
        "is_order_valid": isOrderValid,
        "min_applied_qty": minAppliedQty,
        "order_limit": orderLimit,
      };
}

class TopUpMeta {
  TopUpMeta({
    this.items,
  });

  List<TopUpMetaItem>? items;

  factory TopUpMeta.fromJson(Map<String, dynamic> json) => TopUpMeta(
        items: json["items"] == null
            ? null
            : List<TopUpMetaItem>.from(
                json["items"].map((x) => TopUpMetaItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class TopUpMetaItem {
  TopUpMetaItem({
    this.amount,
    this.amountLimit,
    this.isValid,
    this.promoLimit,
    this.promoRate,
  });

  int? amount;
  int? amountLimit;
  bool? isValid;
  int? promoLimit;
  int? promoRate;

  factory TopUpMetaItem.fromJson(Map<String, dynamic> json) => TopUpMetaItem(
        amount: json["amount"],
        amountLimit: json["amount_limit"],
        isValid: json["is_valid"],
        promoLimit: json["promo_limit"],
        promoRate: json["promo_rate"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "amount_limit": amountLimit,
        "is_valid": isValid,
        "promo_limit": promoLimit,
        "promo_rate": promoRate,
      };
}

class VoucherMeta {
  VoucherMeta({
    this.items,
  });

  List<VoucherMetaItem>? items;

  factory VoucherMeta.fromJson(Map<String, dynamic> json) => VoucherMeta(
        items: json["items"] == null
            ? null
            : List<VoucherMetaItem>.from(
                json["items"].map((x) => VoucherMetaItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class VoucherMetaItem {
  VoucherMetaItem({
    this.description,
    this.discount,
    this.name,
    this.orderLimit,
  });

  String? description;
  int? discount;
  String? name;
  int? orderLimit;

  factory VoucherMetaItem.fromJson(Map<String, dynamic> json) =>
      VoucherMetaItem(
        description: json["description"],
        discount: json["discount"],
        name: json["name"],
        orderLimit: json["order_limit"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "discount": discount,
        "name": name,
        "order_limit": orderLimit,
      };
}

class NextStatus {
  NextStatus({
    this.status,
    this.subStatus,
  });

  int? status;
  int? subStatus;

  factory NextStatus.fromJson(Map<String, dynamic> json) => NextStatus(
        status: json["status"],
        subStatus: json["sub_status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "sub_status": subStatus,
      };
}

class StateHistory {
  StateHistory({
    this.state,
    this.stateText,
    this.subState,
    this.subStateText,
    this.time,
  });

  int? state;
  String? stateText;
  int? subState;
  String? subStateText;
  String? time;

  factory StateHistory.fromJson(Map<String, dynamic> json) => StateHistory(
        state: json["state"],
        stateText: json["state_text"],
        subState: json["sub_state"],
        subStateText: json["sub_state_text"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "state_text": stateText,
        "sub_state": subState,
        "sub_state_text": subStateText,
        "time": time,
      };
}

class TrackingInfo {
  TrackingInfo({
    this.currentStatus,
    this.statusText,
    this.time,
  });

  int? currentStatus;
  String? statusText;
  String? time;

  factory TrackingInfo.fromJson(Map<String, dynamic> json) => TrackingInfo(
        currentStatus: json["current_status"],
        statusText: json["status_text"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "current_status": currentStatus,
        "status_text": statusText,
        "time": time,
      };
}

class User {
  User({
    this.balance,
    this.email,
    this.fullName,
    this.gender,
    this.nationalId,
    this.phone,
    this.userId,
    this.userName,
  });

  int? balance;
  String? email;
  String? fullName;
  String? gender;
  String? nationalId;
  String? phone;
  int? userId;
  String? userName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        balance: json["balance"],
        email: json["email"],
        fullName: json["full_name"],
        gender: json["gender"],
        nationalId: json["national_id"],
        phone: json["phone"],
        userId: json["user_id"],
        userName: json["user_name"],
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
        "email": email,
        "full_name": fullName,
        "gender": gender,
        "national_id": nationalId,
        "phone": phone,
        "user_id": userId,
        "user_name": userName,
      };
}

class OrderAddress {
  OrderAddress({
    this.id,
    this.countryId,
    this.province,
    this.district,
    this.ward,
    this.street,
    this.deliveryAddressType,
    this.customerId,
    this.fullName,
    this.telephone,
    this.isDefault,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? countryId;
  Province? province;
  District? district;
  Ward? ward;
  String? street;
  String? deliveryAddressType;
  int? customerId;
  String? fullName;
  String? telephone;
  bool? isDefault;
  String? createdAt;
  String? updatedAt;

  factory OrderAddress.fromJson(Map<String, dynamic> json) => OrderAddress(
        id: json["id"],
        countryId: json["country_id"],
        province: json["province"] == null
            ? null
            : Province.fromJson(json["province"]),
        district: json["district"] == null
            ? null
            : District.fromJson(json["district"]),
        ward: json["ward"] == null ? null : Ward.fromJson(json["ward"]),
        street: json["street"],
        deliveryAddressType: json["delivery_address_type"],
        customerId: json["customer_id"],
        fullName: json["full_name"],
        telephone: json["telephone"],
        isDefault: json["is_default"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "country_id": countryId,
        "province": province == null ? null : province!.toJson(),
        "district": district == null ? null : district!.toJson(),
        "ward": ward == null ? null : ward!.toJson(),
        "street": street,
        "delivery_address_type": deliveryAddressType,
        "customer_id": customerId,
        "full_name": fullName,
        "telephone": telephone,
        "is_default": isDefault,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class District {
  District({
    this.id,
    this.name,
    this.districtType,
    this.provinceId,
  });

  String? id;
  String? name;
  String? districtType;
  String? provinceId;

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"],
        name: json["name"],
        districtType: json["district_type"],
        provinceId: json["province_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "district_type": districtType,
        "province_id": provinceId,
      };
}

class Province {
  Province({
    this.id,
    this.name,
    this.provinceType,
    this.countryId,
    this.priority,
  });

  String? id;
  String? name;
  String? provinceType;
  String? countryId;
  int? priority;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        id: json["id"],
        name: json["name"],
        provinceType: json["province_type"],
        countryId: json["country_id"],
        priority: json["priority"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "province_type": provinceType,
        "country_id": countryId,
        "priority": priority,
      };
}

class Ward {
  Ward({
    this.id,
    this.name,
    this.wardType,
    this.districtId,
  });

  String? id;
  String? name;
  String? wardType;
  String? districtId;

  factory Ward.fromJson(Map<String, dynamic> json) => Ward(
        id: json["id"],
        name: json["name"],
        wardType: json["ward_type"],
        districtId: json["district_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ward_type": wardType,
        "district_id": districtId,
      };
}

extension OrderExtension on Order {
  int get totalItemCount {
    if (items != null) {
      List<OrderItem> _item = List<OrderItem>.from(
          jsonDecode(items!).map((x) => OrderItem.fromJson(x)));
      int result = 0;
      for (var element in _item) {
        result += element.quantity ?? 0;
      }
      return result;
    }
    return 0;
  }

  List<OrderItem> get getOrderItems {
    if (items != null) {
      List<OrderItem> _item = List<OrderItem>.from(
          jsonDecode(items!).map((x) => OrderItem.fromJson(x)));
      return _item;
    }
    return [];
  }

  String get getAddress {
    if (address != null) {
      var json = jsonDecode(address!);
      List<String> result = [];
      OrderAddress orderAddress = OrderAddress.fromJson(json);
      if (orderAddress.ward?.name != null) {
        result.add(orderAddress.ward!.name!);
      }
      if (orderAddress.district?.name != null) {
        result.add(orderAddress.district!.name!);
      }
      if (orderAddress.province?.name != null) {
        result.add(orderAddress.province!.name!);
      }
      return result.join(", ");
    }
    return "";
  }

  String get getNameAndPhone {
    if (address != null) {
      var json = jsonDecode(address!);
      OrderAddress orderAddress = OrderAddress.fromJson(json);
      return (orderAddress.fullName ?? "") +
          (orderAddress.telephone == null
              ? ""
              : " (${orderAddress.telephone})");
    }
    return "";
  }
}
