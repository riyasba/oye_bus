// To parse this JSON data, do
//
//     final coPassangersModel = coPassangersModelFromJson(jsonString);

import 'dart:convert';

CoPassangersModel coPassangersModelFromJson(String str) => CoPassangersModel.fromJson(json.decode(str));

String coPassangersModelToJson(CoPassangersModel data) => json.encode(data.toJson());

class CoPassangersModel {
    bool status;
    String message;
    List<PassangersData> data;

    CoPassangersModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory CoPassangersModel.fromJson(Map<String, dynamic> json) => CoPassangersModel(
        status: json["status"],
        message: json["message"],
        data: List<PassangersData>.from(json["data"].map((x) => PassangersData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class PassangersData {
    String name;
    String age;
    String gender;
    int id;

    PassangersData({
        required this.name,
        required this.age,
        required this.gender,
        required this.id,
    });

    factory PassangersData.fromJson(Map<String, dynamic> json) => PassangersData(
        name: json["name"],
        age: json["age"],
        gender: json["gender"], 
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "gender": gender,
        "id":id
    };
}
