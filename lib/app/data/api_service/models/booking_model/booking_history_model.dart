// To parse this JSON data, do
//
//     final bookingHistoryModel = bookingHistoryModelFromJson(jsonString);

import 'dart:convert';

BookingHistoryModel bookingHistoryModelFromJson(String str) => BookingHistoryModel.fromJson(json.decode(str));

String bookingHistoryModelToJson(BookingHistoryModel data) => json.encode(data.toJson());

class BookingHistoryModel {
    bool status;
    List<BookingDetail> bookingDetails;

    BookingHistoryModel({
        required this.status,
        required this.bookingDetails,
    });

    factory BookingHistoryModel.fromJson(Map<String, dynamic> json) => BookingHistoryModel(
        status: json["status"],
        bookingDetails: List<BookingDetail>.from(json["booking_details"].map((x) => BookingDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "booking_details": List<dynamic>.from(bookingDetails.map((x) => x.toJson())),
    };
}

class BookingDetail {
    BookingData bookingData;
    BusData busData;
    BusRoute busRoute;

    BookingDetail({
        required this.bookingData,
        required this.busData,
        required this.busRoute,
    });

    factory BookingDetail.fromJson(Map<String, dynamic> json) => BookingDetail(
        bookingData: BookingData.fromJson(json["booking_data"]),
        busData: BusData.fromJson(json["bus_data"]),
        busRoute: BusRoute.fromJson(json["bus_route"]),
    );

    Map<String, dynamic> toJson() => {
        "booking_data": bookingData.toJson(),
        "bus_data": busData.toJson(),
        "bus_route": busRoute.toJson(),
    };
}

class BookingData {
    int bookingId;
    String perTicketPrice;
    String totalPrice;
    String date;
    String transactionId;
    String boarding;
    String dropping;
    List<Seat> seats;

    BookingData({
        required this.bookingId,
        required this.perTicketPrice,
        required this.totalPrice,
        required this.date,
        required this.transactionId,
        required this.boarding,
        required this.dropping,
        required this.seats,
    });

    factory BookingData.fromJson(Map<String, dynamic> json) => BookingData(
        bookingId: json["booking_id"],
        perTicketPrice: json["per_ticket_price"],
        totalPrice: json["total_price"],
        date: json["date"],
        transactionId: json["transaction_id"],
        boarding: json["boarding"],
        dropping: json["dropping"],
        seats: List<Seat>.from(json["seats"].map((x) => seatValues.map[x]!)),
    );

    Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "per_ticket_price": perTicketPrice,
        "total_price": totalPrice,
        "date": date,
        "transaction_id": transactionId,
        "boarding": boarding,
        "dropping": dropping,
        "seats": List<dynamic>.from(seats.map((x) => seatValues.reverse[x])),
    };
}



enum Seat {
    A4,
    B4
}

final seatValues = EnumValues({
    "A4": Seat.A4,
    "B4": Seat.B4
});

class BusData {
    BusName busName;
    BusRegisterNumber busRegisterNumber;
    BusType busType;
    String contactNumber;

    BusData({
        required this.busName,
        required this.busRegisterNumber,
        required this.busType,
        required this.contactNumber,
    });

    factory BusData.fromJson(Map<String, dynamic> json) => BusData(
        busName: busNameValues.map[json["bus_name"]]!,
        busRegisterNumber: busRegisterNumberValues.map[json["bus_register_number"]]!,
        busType: busTypeValues.map[json["bus_type"]]!,
        contactNumber: json["contact_number"],
    );

    Map<String, dynamic> toJson() => {
        "bus_name": busNameValues.reverse[busName],
        "bus_register_number": busRegisterNumberValues.reverse[busRegisterNumber],
        "bus_type": busTypeValues.reverse[busType],
        "contact_number": contactNumber,
    };
}

enum BusName {
    BUS_1
}

final busNameValues = EnumValues({
    "Bus 1": BusName.BUS_1
});

enum BusRegisterNumber {
    REG001
}

final busRegisterNumberValues = EnumValues({
    "REG001": BusRegisterNumber.REG001
});

enum BusType {
    SEATER
}

final busTypeValues = EnumValues({
    "Seater": BusType.SEATER
});

class BusRoute {
    StartLocation startLocation;
    EndLocation endLocation;
    String departureTime;
    String arrivalTime;
    String price;
    String totalKm;
    String totalHours;

    BusRoute({
        required this.startLocation,
        required this.endLocation,
        required this.departureTime,
        required this.arrivalTime,
        required this.price,
        required this.totalKm,
        required this.totalHours,
    });

    factory BusRoute.fromJson(Map<String, dynamic> json) => BusRoute(
        startLocation: startLocationValues.map[json["start_location"]]!,
        endLocation: endLocationValues.map[json["end_location"]]!,
        departureTime: json["departure_time"],
        arrivalTime: json["arrival_time"],
        price: json["price"],
        totalKm: json["total_km"],
        totalHours: json["total_hours"],
    );

    Map<String, dynamic> toJson() => {
        "start_location": startLocationValues.reverse[startLocation],
        "end_location": endLocationValues.reverse[endLocation],
        "departure_time": departureTime,
        "arrival_time": arrivalTime,
        "price": price,
        "total_km": totalKm,
        "total_hours": totalHours,
    };
}

enum EndLocation {
    TRICHY
}

final endLocationValues = EnumValues({
    "trichy": EndLocation.TRICHY
});

enum StartLocation {
    CHENNAI
}

final startLocationValues = EnumValues({
    "chennai": StartLocation.CHENNAI
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
