// To parse this JSON data, do
//
//     final launguageModel = launguageModelFromJson(jsonString);

import 'dart:convert';

LanguageModel launguageModelFromJson(String str) => LanguageModel.fromJson(json.decode(str));

String launguageModelToJson(LanguageModel data) => json.encode(data.toJson());

class LanguageModel {
    bool status;
    String message;
    List<LanguageData> data;

    LanguageModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        status: json["status"],
        message: json["message"],
        data: List<LanguageData>.from(json["data"].map((x) => LanguageData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class LanguageData {
    String languages;

    LanguageData({
        required this.languages,
    });

    factory LanguageData.fromJson(Map<String, dynamic> json) => LanguageData(
        languages: json["Languages"],
    );

    Map<String, dynamic> toJson() => {
        "Languages": languages,
    };
}
