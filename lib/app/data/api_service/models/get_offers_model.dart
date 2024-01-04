// To parse this JSON data, do
//
//     final offersModel = offersModelFromJson(jsonString);

import 'dart:convert';

OffersModel offersModelFromJson(String str) => OffersModel.fromJson(json.decode(str));

String offersModelToJson(OffersModel data) => json.encode(data.toJson());

class OffersModel {
    bool status;
    String message;
    List<OffersData> data;

    OffersModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory OffersModel.fromJson(Map<String, dynamic> json) => OffersModel(
        status: json["status"],
        message: json["message"],
        data: List<OffersData>.from(json["data"].map((x) => OffersData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class OffersData {
    String offerId;
    String couponCode;
    String validTill;
    String image;

    OffersData({
        required this.offerId,
        required this.couponCode,
        required this.validTill,
        required this.image,
    });

    factory OffersData.fromJson(Map<String, dynamic> json) => OffersData(
        offerId: json["offer_id"],
        couponCode: json["coupon_code"],
        validTill: json["valid_till"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "offer_id": offerId,
        "coupon_code": couponCode,
        "valid_till": validTill,
        "image": image,
    };
}
