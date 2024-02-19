// To parse this JSON data, do
//
//     final bookingCancelledListModel = bookingCancelledListModelFromJson(jsonString);

import 'dart:convert';

BookingCancelledListModel bookingCancelledListModelFromJson(String str) => BookingCancelledListModel.fromJson(json.decode(str));

String bookingCancelledListModelToJson(BookingCancelledListModel data) => json.encode(data.toJson());

class BookingCancelledListModel {
    bool status;
    List<BookingCancelledDetail> bookingDetails;

    BookingCancelledListModel({
        required this.status,
        required this.bookingDetails,
    });

    factory BookingCancelledListModel.fromJson(Map<String, dynamic> json) => BookingCancelledListModel(
        status: json["status"],
        bookingDetails: List<BookingCancelledDetail>.from(json["booking_details"].map((x) => BookingCancelledDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "booking_details": List<dynamic>.from(bookingDetails.map((x) => x.toJson())),
    };
}

class BookingCancelledDetail {
    BookingData bookingData;
    BusData busData;
    BusRoute busRoute;

    BookingCancelledDetail({
        required this.bookingData,
        required this.busData,
        required this.busRoute,
    });

    factory BookingCancelledDetail.fromJson(Map<String, dynamic> json) => BookingCancelledDetail(
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
    List<String> seats;
    String isCancelled;
    dynamic cancellationCharges;

    BookingData({
        required this.bookingId,
        required this.perTicketPrice,
        required this.totalPrice,
        required this.date,
        required this.transactionId,
        required this.boarding,
        required this.dropping,
        required this.seats,
        required this.isCancelled,
        required this.cancellationCharges,
    });

    factory BookingData.fromJson(Map<String, dynamic> json) => BookingData(
        bookingId: json["booking_id"],
        perTicketPrice: json["per_ticket_price"],
        totalPrice: json["total_price"],
        date: json["date"],
        transactionId: json["transaction_id"],
        boarding: json["boarding"],
        dropping: json["dropping"],
        seats: List<String>.from(json["seats"].map((x) => x)),
        isCancelled: json["is_cancelled"],
        cancellationCharges: json["cancellation_charges"],
    );

    Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "per_ticket_price": perTicketPrice,
        "total_price": totalPrice,
        "date": date,
        "transaction_id": transactionId,
        "boarding": boarding,
        "dropping": dropping,
        "seats": List<dynamic>.from(seats.map((x) => x)),
        "is_cancelled": isCancelled,
        "cancellation_charges": cancellationCharges,
    };
}

class BusData {
    String busName;
    String busRegisterNumber;
    String busType;
    String contactNumber;

    BusData({
        required this.busName,
        required this.busRegisterNumber,
        required this.busType,
        required this.contactNumber,
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
    String startLocation;
    String endLocation;
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
