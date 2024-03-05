// To parse this JSON data, do
//
//     final walletHistoryModel = walletHistoryModelFromJson(jsonString);

import 'dart:convert';

WalletHistoryModel walletHistoryModelFromJson(String str) => WalletHistoryModel.fromJson(json.decode(str));

String walletHistoryModelToJson(WalletHistoryModel data) => json.encode(data.toJson());

class WalletHistoryModel {
    bool? status;
    String? message;
    String? totalWalletAmount;
    List<WalletHistoryData>? data;

    WalletHistoryModel({
        this.status,
        this.message,
        this.totalWalletAmount,
        this.data,
    });

    factory WalletHistoryModel.fromJson(Map<String, dynamic> json) => WalletHistoryModel(
        status: json["status"],
        message: json["message"],
        totalWalletAmount: json["total_wallet_amount"],
        data: json["data"] == null ? [] : List<WalletHistoryData>.from(json["data"]!.map((x) => WalletHistoryData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "total_wallet_amount": totalWalletAmount,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class WalletHistoryData {
    int? id;
    String? userId;
    String? bookingId;
    String? totalPrice;
    String? serviceTax;
    DateTime? cancelledDate;
    String? walletAmount;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? type;

    WalletHistoryData({
        this.id,
        this.userId,
        this.bookingId,
        this.totalPrice,
        this.serviceTax,
        this.cancelledDate,
        this.walletAmount,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.type,
    });

    factory WalletHistoryData.fromJson(Map<String, dynamic> json) => WalletHistoryData(
        id: json["id"],
        userId: json["user_id"],
        bookingId: json["booking_id"],
        totalPrice: json["total_price"],
        serviceTax: json["service_tax"],
        cancelledDate: json["cancelled_date"] == null ? null : DateTime.parse(json["cancelled_date"]),
        walletAmount: json["wallet_amount"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "booking_id": bookingId,
        "total_price": totalPrice,
        "service_tax": serviceTax,
        "cancelled_date": cancelledDate?.toIso8601String(),
        "wallet_amount": walletAmount,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "type": type,
    };
}
