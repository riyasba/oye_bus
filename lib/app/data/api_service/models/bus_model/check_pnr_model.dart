// To parse this JSON data, do
//
//     final checkPnrModel = checkPnrModelFromJson(jsonString);

import 'dart:convert';

CheckPnrModel checkPnrModelFromJson(String str) => CheckPnrModel.fromJson(json.decode(str));

String checkPnrModelToJson(CheckPnrModel data) => json.encode(data.toJson());

class CheckPnrModel {
    bool? status;
    String? message;
    PnrData? data;

    CheckPnrModel({
        this.status,
        this.message,
        this.data,
    });

    factory CheckPnrModel.fromJson(Map<String, dynamic> json) => CheckPnrModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : PnrData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class PnrData {
    int? bookingId;
    String? userName;
    String? userMobile;
    String? userEmail;
    String? busName;
    String? busRegisterNumber;
    String? busType;
    String? totalPrice;
    String? transactionId;
    String? pnrNumber;
    List<String>? seatNumbers;
    List<Passenger>? passengers;

    PnrData({
        this.bookingId,
        this.userName,
        this.userMobile,
        this.userEmail,
        this.busName,
        this.busRegisterNumber,
        this.busType,
        this.totalPrice,
        this.transactionId,
        this.pnrNumber,
        this.seatNumbers,
        this.passengers,
    });

    factory PnrData.fromJson(Map<String, dynamic> json) => PnrData(
        bookingId: json["booking_id"],
        userName: json["user_name"],
        userMobile: json["user_mobile"],
        userEmail: json["user_email"],
        busName: json["bus_name"],
        busRegisterNumber: json["bus_register_number"],
        busType: json["bus_type"],
        totalPrice: json["total_price"],
        transactionId: json["transaction_id"],
        pnrNumber: json["pnr_number"],
        seatNumbers: json["seat_numbers"] == null ? [] : List<String>.from(json["seat_numbers"]!.map((x) => x)),
        passengers: json["passengers"] == null ? [] : List<Passenger>.from(json["passengers"]!.map((x) => Passenger.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "user_name": userName,
        "user_mobile": userMobile,
        "user_email": userEmail,
        "bus_name": busName,
        "bus_register_number": busRegisterNumber,
        "bus_type": busType,
        "total_price": totalPrice,
        "transaction_id": transactionId,
        "pnr_number": pnrNumber,
        "seat_numbers": seatNumbers == null ? [] : List<dynamic>.from(seatNumbers!.map((x) => x)),
        "passengers": passengers == null ? [] : List<dynamic>.from(passengers!.map((x) => x.toJson())),
    };
}

class Passenger {
    String? name;
    String? age;
    String? gender;
    String? seat;
    String? price;

    Passenger({
        this.name,
        this.age,
        this.gender,
        this.seat,
        this.price,
    });

    factory Passenger.fromJson(Map<String, dynamic> json) => Passenger(
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
        seat: json["seat"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "gender": gender,
        "seat": seat,
        "price": price,
    };
}
