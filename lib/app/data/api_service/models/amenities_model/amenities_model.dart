// To parse this JSON data, do
//
//     final amenitiesModel = amenitiesModelFromJson(jsonString);

import 'dart:convert';

AmenitiesModel amenitiesModelFromJson(String str) => AmenitiesModel.fromJson(json.decode(str));

String amenitiesModelToJson(AmenitiesModel data) => json.encode(data.toJson());

class AmenitiesModel {
    bool? status;
    String? message;
    List<AmenitiesData>? data;

    AmenitiesModel({
        this.status,
        this.message,
        this.data,
    });

    factory AmenitiesModel.fromJson(Map<String, dynamic> json) => AmenitiesModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<AmenitiesData>.from(json["data"]!.map((x) => AmenitiesData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class AmenitiesData {
    int? amenitiesId;
    String? title;
    String? image; 
    bool ischeck;

    AmenitiesData({
        this.amenitiesId,
        this.title,
        this.image,
         this.ischeck = false
    });

    factory AmenitiesData.fromJson(Map<String, dynamic> json) => AmenitiesData(
        amenitiesId: json["amenities_id"],
        title: json["title"],
        image: json["image"], 
        
    );

    Map<String, dynamic> toJson() => {
        "amenities_id": amenitiesId,
        "title": title,
        "image": image,
    };
}
