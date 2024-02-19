// To parse this JSON data, do
//
//     final seatModel = seatModelFromJson(jsonString);

import 'dart:convert';

BusModel seatModelFromJson(String str) => BusModel.fromJson(json.decode(str));

String seatModelToJson(BusModel data) => json.encode(data.toJson());

class BusModel {
    bool status;
    String message;
    List<Seat> seatMap;

    BusModel({
        required this.status,
        required this.message,
        required this.seatMap,
    });

    factory BusModel.fromJson(Map<String, dynamic> json) => BusModel(
        status: json["status"],
        message: json["message"],
        seatMap: List<Seat>.from(json["data"].map((x) => Seat.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(seatMap.map((x) => x.toJson())),
    };
}

class Seat {
    int id;
    String busId;
    String seatNo;
    String seatPrice;
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
    bool isSelected;

    Seat({
        required this.id,
        required this.busId,
        required this.seatNo,
        required this.seatPrice,
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
         this.isSelected = false,
    });

    factory Seat.fromJson(Map<String, dynamic> json) => Seat(
        id: json["id"]??0,
        busId: json["bus_id"]??"",
        seatNo: json["seat_no"]??'',
        seatPrice: json["seat_price"]??'',
        rowNo: json["row_no"]??'',
        columnNo: json["column_no"]??'',
        length: json["length"]??'',
        width: json["width"]??'',
        position: json["position"]!,
        layout: json["layout"],
        layoutId: json["layout_id"],
        isWindowSeat: json["is_window_seat"],
        ladiesSeat: json["ladies_seat"],
        fareKey: json["fare_key"],
        isBookable: json["is_bookable"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "bus_id": busId,
        "seat_no": seatNo,
        "seat_price": seatPrice,
        "row_no": rowNo,
        "column_no": columnNo,
        "length": length,
        "width": width,
        "position": positionValues.reverse[position],
        "layout": layout,
        "layout_id": layoutId,
        "is_window_seat": isWindowSeat,
        "ladies_seat": ladiesSeat,
        "fare_key": fareKeyValues.reverse[fareKey],
        "is_bookable": isBookable,
    };
}

enum FareKey {
    PREMIUM
}

final fareKeyValues = EnumValues({
    "premium": FareKey.PREMIUM
});

enum Position {
    LOWER,
    UPPER
}

final positionValues = EnumValues({
    "lower": Position.LOWER,
    "Upper": Position.UPPER
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
