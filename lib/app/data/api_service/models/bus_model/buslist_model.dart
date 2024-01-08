// To parse this JSON data, do
//
//     final buslistModel = buslistModelFromJson(jsonString);

import 'dart:convert';

BuslistModel buslistModelFromJson(String str) => BuslistModel.fromJson(json.decode(str));

String buslistModelToJson(BuslistModel data) => json.encode(data.toJson());

class BuslistModel {
    String status;
    List<BusData> data;

    BuslistModel({
        required this.status,
        required this.data,
    });

    factory BuslistModel.fromJson(Map<String, dynamic> json) => BuslistModel(
        status: json["status"],
        data: List<BusData>.from(json["data"].map((x) => BusData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class BusData {
    DateTime date;
    int busId;
    int availableBuses;
    String busName;
    String boardingTime;
    String droppingTime;
    String totalHours;
    String boardingPlace;
    String droppingPlace;
    String registerNumber;
    String busType;
    String seatType;
    String lowerDeck;
    String upperDeck;
    String doubleSeatPrice;
    String singleSeatPrice;
    String sleepSeatPrice;

    BusData({
        required this.date,
        required this.busId,
        required this.availableBuses,
        required this.busName,
        required this.boardingTime,
        required this.droppingTime,
        required this.totalHours,
        required this.boardingPlace,
        required this.droppingPlace,
        required this.registerNumber,
        required this.busType,
        required this.seatType,
        required this.lowerDeck,
        required this.upperDeck,
        required this.doubleSeatPrice,
        required this.singleSeatPrice,
        required this.sleepSeatPrice,
    });

    factory BusData.fromJson(Map<String, dynamic> json) => BusData(
        date: DateTime.parse(json["date"]),
        busId: json["bus_id"],
        availableBuses: json["available_buses"],
        busName: json["bus_name"],
        boardingTime: json["boarding_time"],
        droppingTime: json["dropping_time"],
        totalHours: json["total_hours"],
        boardingPlace: json["boarding_place"],
        droppingPlace: json["dropping_place"],
        registerNumber: json["register_number"],
        busType: json["bus_type"],
        seatType: json["seat_type"],
        lowerDeck: json["lower_deck"],
        upperDeck: json["upper_deck"],
        doubleSeatPrice: json["double_seat_price"],
        singleSeatPrice: json["single_seat_price"],
        sleepSeatPrice: json["sleep_seat_price"],
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "bus_id": busId,
        "available_buses": availableBuses,
        "bus_name": busName,
        "boarding_time": boardingTime,
        "dropping_time": droppingTime,
        "total_hours": totalHours,
        "boarding_place": boardingPlace,
        "dropping_place": droppingPlace,
        "register_number": registerNumber,
        "bus_type": busType,
        "seat_type": seatType,
        "lower_deck": lowerDeck,
        "upper_deck": upperDeck,
        "double_seat_price": doubleSeatPrice,
        "single_seat_price": singleSeatPrice,
        "sleep_seat_price": sleepSeatPrice,
    };
}
