// To parse this JSON data, do
//
//     final offersModel = offersModelFromJson(jsonString);

import 'dart:convert';

OffersModel offersModelFromJson(String str) => OffersModel.fromJson(json.decode(str));

String offersModelToJson(OffersModel data) => json.encode(data.toJson());

class OffersModel {
    bool? status;
    String? message;
    List<OffersData>? offers;

    OffersModel({
        this.status,
        this.message,
        this.offers,
    });

    factory OffersModel.fromJson(Map<String, dynamic> json) => OffersModel(
        status: json["status"],
        message: json["message"],
        offers: json["offers"] == null ? [] : List<OffersData>.from(json["offers"]!.map((x) => OffersData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "offers": offers == null ? [] : List<dynamic>.from(offers!.map((x) => x.toJson())),
    };
}

class OffersData {
    int? id;
    String? title;
    String? description;
    String? couponCode;
    String? validTill;
    String? image;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? images;
    String? offerFrom;
    String? vendorId;
    String? isDeleted;
    DateTime? deletedAt;

    OffersData({
        this.id,
        this.title,
        this.description,
        this.couponCode,
        this.validTill,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.images,
        this.offerFrom,
        this.vendorId,
        this.isDeleted,
        this.deletedAt,
    });

    factory OffersData.fromJson(Map<String, dynamic> json) => OffersData(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        couponCode: json["coupon_code"],
        validTill: json["valid_till"],
        image: json["image"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        images: json["images"],
        offerFrom: json["offer_from"],
        vendorId: json["vendor_id"],
        isDeleted: json["is_deleted"],
        deletedAt: json["deleted_at"] == null ? null : DateTime.parse(json["deleted_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "coupon_code": couponCode,
        "valid_till": validTill,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "images": images,
        "offer_from": offerFrom,
        "vendor_id": vendorId,
        "is_deleted": isDeleted,
        "deleted_at": deletedAt?.toIso8601String(),
    };
}
