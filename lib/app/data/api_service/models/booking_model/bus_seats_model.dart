// To parse this JSON data, do
//
//     final busSeatsModel = busSeatsModelFromJson(jsonString);

import 'dart:convert';

BusSeatsModel busSeatsModelFromJson(String str) => BusSeatsModel.fromJson(json.decode(str));

String busSeatsModelToJson(BusSeatsModel data) => json.encode(data.toJson());

class BusSeatsModel {
    bool status;
    String message;
    List<BusSeatData> data;

    BusSeatsModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory BusSeatsModel.fromJson(Map<String, dynamic> json) => BusSeatsModel(
        status: json["status"],
        message: json["message"],
        data: List<BusSeatData>.from(json["data"].map((x) => BusSeatData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class BusSeatData {
    int id;
    String busId;
    String seatNo;
    String rowNo;
    String columnNo;
    String length;
    String width;
    String position;
    String layout;
    String layoutId;
    String isWindowSeat;
    String ladiesSeat;
    String fareKey;
    String isBookable;
    bool isbooked;

    BusSeatData({
        required this.id,
        required this.busId,
        required this.seatNo,
        required this.rowNo,
        required this.columnNo,
        required this.length,
        required this.width,
        required this.position,
        required this.layout,
        required this.layoutId,
        required this.isWindowSeat,
        required this.ladiesSeat,
        required this.fareKey,
        required this.isBookable,
        required this.isbooked,
    });

    factory BusSeatData.fromJson(Map<String, dynamic> json) => BusSeatData(
        id: json["id"],
        busId: json["bus_id"],
        seatNo: json["seat_no"],
        rowNo: json["row_no"],
        columnNo: json["column_no"],
        length: json["length"],
        width: json["width"],
        position: json["position"],
        layout: json["layout"],
        layoutId: json["layout_id"],
        isWindowSeat: json["is_window_seat"],
        ladiesSeat: json["ladies_seat"],
        fareKey: json["fare_key"],
        isBookable: json["is_bookable"], 
        isbooked: json['is_booked'],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "bus_id": busId,
        "seat_no": seatNo,
        "row_no": rowNo,
        "column_no": columnNo,
        "length": length,
        "width": width,
        "position": position,
        "layout": layout,
        "layout_id": layoutId,
        "is_window_seat": isWindowSeat,
        "ladies_seat": ladiesSeat,
        "fare_key": fareKey,
        "is_bookable": isBookable,
        "is_booked":isbooked
    };
}
