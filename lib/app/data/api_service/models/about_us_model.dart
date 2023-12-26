// To parse this JSON data, do
//
//     final aboutUsModel = aboutUsModelFromJson(jsonString);

import 'dart:convert';

AboutUsModel aboutUsModelFromJson(String str) => AboutUsModel.fromJson(json.decode(str));

String aboutUsModelToJson(AboutUsModel data) => json.encode(data.toJson());

class AboutUsModel {
    bool status;
    String message;
    String aboutUs;

    AboutUsModel({
        required this.status,
        required this.message,
        required this.aboutUs,
    });

    factory AboutUsModel.fromJson(Map<String, dynamic> json) => AboutUsModel(
        status: json["status"],
        message: json["message"],
        aboutUs: json["AboutUs"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "AboutUs": aboutUs,
    };
}
