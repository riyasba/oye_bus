// To parse this JSON data, do
//
//     final busListModel = busListModelFromJson(jsonString);

import 'dart:convert';

BusListModel busListModelFromJson(String str) => BusListModel.fromJson(json.decode(str));

String busListModelToJson(BusListModel data) => json.encode(data.toJson());

class BusListModel {
    bool status;
    String message;
    List<BusData> data;

    BusListModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory BusListModel.fromJson(Map<String, dynamic> json) => BusListModel(
        status: json["status"],
        message: json["message"],
        data: List<BusData>.from(json["data"].map((x) => BusData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class BusData {
    int busId;
    String busName;
    String busRegisterNumber;
    String busType;
    String noOfDeck;
    String totalSeat;
    String acOrNonAc;
    String ownerName;
    String ownerPhone;
    int routeId;
    String sourceLocation;
    String destinationLocation;
    String totalKm;
    String totalHours;
    String departureTime;
    String arrivalTime;
    String price;
    int tripId;
    String vendorId;
    DateTime startTime;
    DateTime endTime;
    bool ischeck;

    BusData({
        required this.busId,
        required this.busName,
        required this.vendorId,
        required this.busRegisterNumber,
        required this.busType,
        required this.noOfDeck,
        required this.totalSeat,
        required this.acOrNonAc,
        required this.ownerName,
        required this.ownerPhone,
        required this.routeId,
        required this.sourceLocation,
        required this.destinationLocation,
        required this.totalKm,
        required this.totalHours,
        required this.departureTime,
        required this.arrivalTime,
        required this.price,
        required this.tripId,
        required this.startTime,
        required this.endTime,
        this.ischeck=false,
    });

    factory BusData.fromJson(Map<String, dynamic> json) => BusData(
        busId: json["bus_id"],
        busName: json["bus_name"],
        vendorId: json["vendor_id"].toString(),
        busRegisterNumber: json["bus_register_number"],
        busType: json["bus_type"],
        noOfDeck: json["no_of_deck"],
        totalSeat: json["total_seat"],
        acOrNonAc: json["ac_or_non_ac"],
        ownerName: json["owner_name"],
        ownerPhone: json["owner_phone"],
        routeId: json["route_id"],
        sourceLocation: json["source_location"],
        destinationLocation: json["destination_location"],
        totalKm: json["total_km"],
        totalHours: json["total_hours"],
        departureTime: json["departure_time"],
        arrivalTime: json["arrival_time"],
        price: json["price"],
        tripId: json["trip_id"],
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
    );

    Map<String, dynamic> toJson() => {
        "bus_id": busId,
        "bus_name": busName,
        "bus_register_number": busRegisterNumber,
        "bus_type": busType,
        "no_of_deck": noOfDeck,
        "total_seat": totalSeat,
        "ac_or_non_ac": acOrNonAc,
        "owner_name": ownerName,
        "owner_phone": ownerPhone,
        "route_id": routeId,
        "source_location": sourceLocation,
        "destination_location": destinationLocation,
        "total_km": totalKm,
        "total_hours": totalHours,
        "departure_time": departureTime,
        "arrival_time": arrivalTime,
        "price": price,
        "trip_id": tripId,
        "start_time": startTime.toIso8601String(),
        "end_time": endTime.toIso8601String(),
    };
}
