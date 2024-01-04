// To parse this JSON data, do
//
//     final citySearchModel = citySearchModelFromJson(jsonString);

import 'dart:convert';

CitySearchModel citySearchModelFromJson(String str) => CitySearchModel.fromJson(json.decode(str));

String citySearchModelToJson(CitySearchModel data) => json.encode(data.toJson());

class CitySearchModel {
    bool status;
    String message;
    List<CityData> data;

    CitySearchModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory CitySearchModel.fromJson(Map<String, dynamic> json) => CitySearchModel(
        status: json["status"],
        message: json["message"],
        data: List<CityData>.from(json["data"].map((x) => CityData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CityData {
    int cityId;
    String city;

    CityData({
        required this.cityId,
        required this.city,
    });

    factory CityData.fromJson(Map<String, dynamic> json) => CityData(
        cityId: json["city_id"],
        city: json["city"],
    );

    Map<String, dynamic> toJson() => {
        "city_id": cityId,
        "city": city,
    };
}
