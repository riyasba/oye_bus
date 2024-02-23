// To parse this JSON data, do
//
//     final bookingHistoryModel = bookingHistoryModelFromJson(jsonString);

import 'dart:convert';

BookingHistoryModel bookingHistoryModelFromJson(String str) => BookingHistoryModel.fromJson(json.decode(str));

String bookingHistoryModelToJson(BookingHistoryModel data) => json.encode(data.toJson());

class BookingHistoryModel {
    bool? status;
    List<BookingDetail> bookingDetails;

    BookingHistoryModel({
        this.status,
        required this.bookingDetails,
    });

    factory BookingHistoryModel.fromJson(Map<String, dynamic> json) => BookingHistoryModel(
        status: json["status"],
        bookingDetails: json["booking_details"] == null ? [] : List<BookingDetail>.from(json["booking_details"]!.map((x) => BookingDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "booking_details": bookingDetails == null ? [] : List<dynamic>.from(bookingDetails!.map((x) => x.toJson())),
    };
}

class BookingDetail {
    BookingData? bookingData;
    BusData? busData;
    BusRoute? busRoute;

    BookingDetail({
        this.bookingData,
        this.busData,
        this.busRoute,
    });

    factory BookingDetail.fromJson(Map<String, dynamic> json) => BookingDetail(
        bookingData: json["booking_data"] == null ? null : BookingData.fromJson(json["booking_data"]),
        busData: json["bus_data"] == null ? null : BusData.fromJson(json["bus_data"]),
        busRoute: json["bus_route"] == null ? null : BusRoute.fromJson(json["bus_route"]),
    );

    Map<String, dynamic> toJson() => {
        "booking_data": bookingData?.toJson(),
        "bus_data": busData?.toJson(),
        "bus_route": busRoute?.toJson(),
    };
}

class BookingData {
    int? bookingId;
    String? perTicketPrice;
    String? totalPrice;
    String? date;
    String? transactionId;
    String? boarding;
    String? dropping;
    String boardingtime;
    String droppingtime;
    String boardingcityname;
    String droppingcityname;
    List<String>? seats;
    List<Passenger>? passenger;
    String? isCancelled;
    dynamic cancellationCharges;

    BookingData({
        this.bookingId,
        this.perTicketPrice,
        this.totalPrice,
        this.date,
        this.transactionId,
        this.boarding,
        this.dropping,
        this.seats,
        this.passenger,
        this.isCancelled,
        this.cancellationCharges,
        required this.boardingcityname,
        required this.boardingtime,
        required this.droppingcityname,
        required this.droppingtime,
    });

    factory BookingData.fromJson(Map<String, dynamic> json) => BookingData(
        bookingId: json["booking_id"],
        perTicketPrice: json["per_ticket_price"],
        totalPrice: json["total_price"],
        date: json["date"],
        transactionId: json["transaction_id"],
        boarding: json["boarding"],
        dropping: json["dropping"],
        seats: json["seats"] == null ? [] : List<String>.from(json["seats"]!.map((x) => x)),
        passenger: json["passenger"] == null ? [] : List<Passenger>.from(json["passenger"]!.map((x) => Passenger.fromJson(x))),
        isCancelled: json["is_cancelled"],
        cancellationCharges: json["cancellation_charges"], 
        boardingcityname: json["boarding_city_name"], 
        boardingtime: json["boarding_time"], 
        droppingcityname: json["dropping_city_name"], 
        droppingtime: json["dropping_time"],
    );

    Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "per_ticket_price": perTicketPrice,
        "total_price": totalPrice,
        "date": date,
        "transaction_id": transactionId,
        "boarding": boarding,
        "dropping": dropping,
        "seats": seats == null ? [] : List<dynamic>.from(seats!.map((x) => x)),
        "passenger": passenger == null ? [] : List<dynamic>.from(passenger!.map((x) => x.toJson())),
        "is_cancelled": isCancelled,
        "cancellation_charges": cancellationCharges, 
        "boarding_city_name":boardingcityname, 
        "boarding_time":boardingtime, 
        "dropping_city_name":droppingcityname, 
        "dropping_time":droppingtime,
    };
}

class Passenger {
    String? name;
    String? age;
    String? gender;

    Passenger({
        this.name,
        this.age,
        this.gender,
    });

    factory Passenger.fromJson(Map<String, dynamic> json) => Passenger(
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "gender": gender,
    };
}

class BusData {
    String? busName;
    String? busRegisterNumber;
    String? busType;
    String? contactNumber;

    BusData({
        this.busName,
        this.busRegisterNumber,
        this.busType,
        this.contactNumber,
    });

    factory BusData.fromJson(Map<String, dynamic> json) => BusData(
        busName: json["bus_name"],
        busRegisterNumber: json["bus_register_number"],
        busType: json["bus_type"],
        contactNumber: json["contact_number"],
    );

    Map<String, dynamic> toJson() => {
        "bus_name": busName,
        "bus_register_number": busRegisterNumber,
        "bus_type": busType,
        "contact_number": contactNumber,
    };
}

class BusRoute {
    String? startLocation;
    String? endLocation;
    String? departureTime;
    String? arrivalTime;
    String? price;
    String? totalKm;
    String? totalHours;

    BusRoute({
        this.startLocation,
        this.endLocation,
        this.departureTime,
        this.arrivalTime,
        this.price,
        this.totalKm,
        this.totalHours,
    });

    factory BusRoute.fromJson(Map<String, dynamic> json) => BusRoute(
        startLocation: json["start_location"],
        endLocation: json["end_location"],
        departureTime: json["departure_time"],
        arrivalTime: json["arrival_time"],
        price: json["price"],
        totalKm: json["total_km"],
        totalHours: json["total_hours"],
    );

    Map<String, dynamic> toJson() => {
        "start_location": startLocation,
        "end_location": endLocation,
        "departure_time": departureTime,
        "arrival_time": arrivalTime,
        "price": price,
        "total_km": totalKm,
        "total_hours": totalHours,
    };
}
