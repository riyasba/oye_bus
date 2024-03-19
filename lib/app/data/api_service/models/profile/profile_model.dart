// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    bool status;
    String message;
    ProfileData data;

    ProfileModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        message: json["message"],
        data: ProfileData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class ProfileData {
    int id;
    String roleId;
    String name;
    String email;
    String mobile;
    String gender;
    dynamic age;
    String referralCode;
    String status;
    String walletamount;
    DateTime createdAt;

    ProfileData({
        required this.id,
        required this.roleId,
        required this.name,
        required this.email,
        required this.mobile,
        required this.age,
        required this.gender,
        required this.referralCode,
        required this.status,
        required this.createdAt,
        required this.walletamount,
    });

    factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        id: json["id"],
        roleId: json["role_id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        referralCode: json["referral_code"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
         age: json["age"] ?? "", 
         gender: json["gender"]?? "", 
         walletamount: json["wallet_amount"]??  "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "name": name,
        "email": email, 
        "mobile": mobile,
        "age":age,  
        "gender":gender,
        "referral_code": referralCode,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "wallet_amount":walletamount
    };
}
