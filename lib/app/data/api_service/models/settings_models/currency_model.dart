// To parse this JSON data, do
//
//     final currencyModel = currencyModelFromJson(jsonString);

import 'dart:convert';

CurrencyModel currencyModelFromJson(String str) => CurrencyModel.fromJson(json.decode(str));

String currencyModelToJson(CurrencyModel data) => json.encode(data.toJson());

class CurrencyModel {
    bool status;
    String message;
    List<CurrencyData> data;

    CurrencyModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        status: json["status"],
        message: json["message"],
        data: List<CurrencyData>.from(json["data"].map((x) => CurrencyData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CurrencyData {
    String currency;

    CurrencyData({
        required this.currency,
    });

    factory CurrencyData.fromJson(Map<String, dynamic> json) => CurrencyData(
        currency: json["Currency"],
    );

    Map<String, dynamic> toJson() => {
        "Currency": currency,
    };
}
