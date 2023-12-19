// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    String name;
    String email;
    String mobile;
    int roleId;

    RegisterModel({
        required this.name,
        required this.email,
        required this.mobile,
        required this.roleId,
    });

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        roleId: json["role_id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "mobile": mobile,
        "role_id": roleId,
    };
}
