// To parse this JSON data, do
//
//     final faqsModel = faqsModelFromJson(jsonString);

import 'dart:convert';

FaqsModel faqsModelFromJson(String str) => FaqsModel.fromJson(json.decode(str));

String faqsModelToJson(FaqsModel data) => json.encode(data.toJson());

class FaqsModel {
    bool status;
    String message;
    List<FaqsData> data;

    FaqsModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory FaqsModel.fromJson(Map<String, dynamic> json) => FaqsModel(
        status: json["status"],
        message: json["message"],
        data: List<FaqsData>.from(json["data"].map((x) => FaqsData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class FaqsData {
    String title;
    String description;

    FaqsData({
        required this.title,
        required this.description,
    });

    factory FaqsData.fromJson(Map<String, dynamic> json) => FaqsData(
        title: json["Title"],
        description: json["Description"],
    );

    Map<String, dynamic> toJson() => {
        "Title": title,
        "Description": description,
    };
}
