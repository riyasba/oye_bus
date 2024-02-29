// To parse this JSON data, do
//
//     final bookingCancelledListModel = bookingCancelledListModelFromJson(jsonString);

import 'dart:convert';

BookingCancelledListModel bookingCancelledListModelFromJson(String str) => BookingCancelledListModel.fromJson(json.decode(str));

String bookingCancelledListModelToJson(BookingCancelledListModel data) => json.encode(data.toJson());

class BookingCancelledListModel {
    bool? status;
    List<BookingCancelledDetail>? bookingDetails;

    BookingCancelledListModel({
        this.status,
        this.bookingDetails,
    });

    factory BookingCancelledListModel.fromJson(Map<String, dynamic> json) => BookingCancelledListModel(
        status: json["status"],
        bookingDetails: json["booking_details"] == null ? [] : List<BookingCancelledDetail>.from(json["booking_details"]!.map((x) => BookingCancelledDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "booking_details": bookingDetails == null ? [] : List<dynamic>.from(bookingDetails!.map((x) => x.toJson())),
    };
}

class BookingCancelledDetail {
    BookingData? bookingData;
    BusData? busData;
    BusRoute? busRoute;

    BookingCancelledDetail({
        this.bookingData,
        this.busData,
        this.busRoute,
    });

    factory BookingCancelledDetail.fromJson(Map<String, dynamic> json) => BookingCancelledDetail(
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
    String? ticketPrice;
    String? subTotal;
    String? totalPrice;
    String? dateOfJourney;
    String? transactionId;
    String? pnrNumber;
    String? pickupPoint;
    String? droppingPoint;
    String? boardingTime;
    String? droppingTime;
    List<String>? seats;
    List<Passenger>? passenger;
    String? isCancelled;
    String? primaryCustomerName;
    String? primaryCustomerEmail;
    String? primaryCustomerMobile;
    dynamic cancellationCharges;

    BookingData({
        this.bookingId,
        this.ticketPrice,
        this.subTotal,
        this.totalPrice,
        this.dateOfJourney,
        this.transactionId,
        this.pnrNumber,
        this.pickupPoint,
        this.droppingPoint,
        this.boardingTime,
        this.droppingTime,
        this.seats,
        this.passenger,
        this.isCancelled,
        this.primaryCustomerName,
        this.primaryCustomerEmail,
        this.primaryCustomerMobile,
        this.cancellationCharges,
    });

    factory BookingData.fromJson(Map<String, dynamic> json) => BookingData(
        bookingId: json["booking_id"],
        ticketPrice: json["ticket_price"],
        subTotal: json["sub_total"],
        totalPrice: json["total_price"],
        dateOfJourney: json["date_of_journey"],
        transactionId: json["transaction_id"],
        pnrNumber: json["pnr_number"],
        pickupPoint: json["pickup_point"],
        droppingPoint: json["dropping_point"],
        boardingTime: json["boarding_time"],
        droppingTime: json["dropping_time"],
        seats: json["seats"] == null ? [] : List<String>.from(json["seats"]!.map((x) => x)),
        passenger: json["passenger"] == null ? [] : List<Passenger>.from(json["passenger"]!.map((x) => Passenger.fromJson(x))),
        isCancelled: json["is_cancelled"],
        primaryCustomerName: json["primary_customer_name"],
        primaryCustomerEmail: json["primary_customer_email"],
        primaryCustomerMobile: json["primary_customer_mobile"],
        cancellationCharges: json["cancellation_charges"],
    );

    Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "ticket_price": ticketPrice,
        "sub_total": subTotal,
        "total_price": totalPrice,
        "date_of_journey": dateOfJourney,
        "transaction_id": transactionId,
        "pnr_number": pnrNumber,
        "pickup_point": pickupPoint,
        "dropping_point": droppingPoint,
        "boarding_time": boardingTime,
        "dropping_time": droppingTime,
        "seats": seats == null ? [] : List<dynamic>.from(seats!.map((x) => x)),
        "passenger": passenger == null ? [] : List<dynamic>.from(passenger!.map((x) => x.toJson())),
        "is_cancelled": isCancelled,
        "primary_customer_name": primaryCustomerName,
        "primary_customer_email": primaryCustomerEmail,
        "primary_customer_mobile": primaryCustomerMobile,
        "cancellation_charges": cancellationCharges,
    };
}

class Passenger {
    String? name;
    String? age;
    String? gender;
    String? seatNo;

    Passenger({
        this.name,
        this.age,
        this.gender,
        this.seatNo,
    });

    factory Passenger.fromJson(Map<String, dynamic> json) => Passenger(
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
        seatNo: json["seat_no"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "gender": gender,
        "seat_no": seatNo,
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
    dynamic departureTime;
    dynamic arrivalTime;
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
