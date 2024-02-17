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
    Route route;

    BusData({
        required this.route,
    });

    factory BusData.fromJson(Map<String, dynamic> json) => BusData(
        route: Route.fromJson(json["route"]),
    );

    Map<String, dynamic> toJson() => {
        "route": route.toJson(),
    };
}

class Route {
    int id;
    String vendorId;
    String sourceLocation;
    String destinationLocation;
    String departureTime;
    String price;
    String arrivalTime;
    String totalKm;
    String totalHours;
    DateTime createdAt;
    DateTime updatedAt;
    BusDetails busDetails;
    List<Amenity> amenities;
    List<Trip> trip;

    Route({
        required this.id,
        required this.vendorId,
        required this.sourceLocation,
        required this.destinationLocation,
        required this.departureTime,
        required this.price,
        required this.arrivalTime,
        required this.totalKm,
        required this.totalHours,
        required this.createdAt,
        required this.updatedAt,
        required this.busDetails,
        required this.amenities,
        required this.trip,
    });

    factory Route.fromJson(Map<String, dynamic> json) => Route(
        id: json["id"],
        vendorId: json["vendor_id"],
        sourceLocation: json["source_location"],
        destinationLocation: json["destination_location"],
        departureTime: json["departure_time"],
        price: json["price"],
        arrivalTime: json["arrival_time"],
        totalKm: json["total_km"],
        totalHours: json["total_hours"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        busDetails: BusDetails.fromJson(json["bus_details"]),
        amenities: List<Amenity>.from(json["amenities"].map((x) => Amenity.fromJson(x))),
        trip: List<Trip>.from(json["trip"].map((x) => Trip.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_id": vendorId,
        "source_location": sourceLocation,
        "destination_location": destinationLocation,
        "departure_time": departureTime,
        "price": price,
        "arrival_time": arrivalTime,
        "total_km": totalKm,
        "total_hours": totalHours,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "bus_details": busDetails.toJson(),
        "amenities": List<dynamic>.from(amenities.map((x) => x.toJson())),
        "trip": List<dynamic>.from(trip.map((x) => x.toJson())),
    };
}

class Amenity {
    int id;
    String title;
    String icon;

    Amenity({
        required this.id,
        required this.title,
        required this.icon,
    });

    factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
        id: json["id"],
        title: json["title"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "icon": icon,
    };
}

class BusDetails {
    int id;
    String vendorId;
    String busName;
    String busRegisterNumber;
    String busType;
    String registrationNumber;
    String engineNumber;
    String modelNumber;
    String chassisNumber;
    String ownerName;
    String ownerPhone;
    String brandName;
    String insuranceAgencyName;
    String engineCapacity;
    String fuelType;
    String busInsuranceIdNumber;
    DateTime fireExtinguisherDate;
    String contactNumber;
    String noOfDeck;
    String seatLayout;
    String totalSeat;
    String upperSeatCount;
    String lowerSeatCount;
    String acOrNonAc;
    DateTime ccPermitDate;
    dynamic roadTax;
    dynamic permit;
    dynamic rcBook;
    DateTime createdAt;
    DateTime updatedAt;
    String isDeleted;

    BusDetails({
        required this.id,
        required this.vendorId,
        required this.busName,
        required this.busRegisterNumber,
        required this.busType,
        required this.registrationNumber,
        required this.engineNumber,
        required this.modelNumber,
        required this.chassisNumber,
        required this.ownerName,
        required this.ownerPhone,
        required this.brandName,
        required this.insuranceAgencyName,
        required this.engineCapacity,
        required this.fuelType,
        required this.busInsuranceIdNumber,
        required this.fireExtinguisherDate,
        required this.contactNumber,
        required this.noOfDeck,
        required this.seatLayout,
        required this.totalSeat,
        required this.upperSeatCount,
        required this.lowerSeatCount,
        required this.acOrNonAc,
        required this.ccPermitDate,
        required this.roadTax,
        required this.permit,
        required this.rcBook,
        required this.createdAt,
        required this.updatedAt,
        required this.isDeleted,
    });

    factory BusDetails.fromJson(Map<String, dynamic> json) => BusDetails(
        id: json["id"],
        vendorId: json["vendor_id"],
        busName: json["bus_name"],
        busRegisterNumber: json["bus_register_number"],
        busType: json["bus_type"],
        registrationNumber: json["registration_number"],
        engineNumber: json["engine_number"],
        modelNumber: json["model_number"],
        chassisNumber: json["chassis_number"],
        ownerName: json["owner_name"],
        ownerPhone: json["owner_phone"],
        brandName: json["brand_name"],
        insuranceAgencyName: json["insurance_agency_name"],
        engineCapacity: json["engine_capacity"],
        fuelType: json["fuel_type"],
        busInsuranceIdNumber: json["bus_insurance_id_number"],
        fireExtinguisherDate: DateTime.parse(json["fire_extinguisher_date"]),
        contactNumber: json["contact_number"],
        noOfDeck: json["no_of_deck"],
        seatLayout: json["seat_layout"],
        totalSeat: json["total_seat"],
        upperSeatCount: json["upper_seat_count"],
        lowerSeatCount: json["lower_seat_count"],
        acOrNonAc: json["ac_or_non_ac"],
        ccPermitDate: DateTime.parse(json["cc_permit_date"]),
        roadTax: json["road_tax"],
        permit: json["permit"],
        rcBook: json["rc_book"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isDeleted: json["is_deleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_id": vendorId,
        "bus_name": busName,
        "bus_register_number": busRegisterNumber,
        "bus_type": busType,
        "registration_number": registrationNumber,
        "engine_number": engineNumber,
        "model_number": modelNumber,
        "chassis_number": chassisNumber,
        "owner_name": ownerName,
        "owner_phone": ownerPhone,
        "brand_name": brandName,
        "insurance_agency_name": insuranceAgencyName,
        "engine_capacity": engineCapacity,
        "fuel_type": fuelType,
        "bus_insurance_id_number": busInsuranceIdNumber,
        "fire_extinguisher_date": "${fireExtinguisherDate.year.toString().padLeft(4, '0')}-${fireExtinguisherDate.month.toString().padLeft(2, '0')}-${fireExtinguisherDate.day.toString().padLeft(2, '0')}",
        "contact_number": contactNumber,
        "no_of_deck": noOfDeck,
        "seat_layout": seatLayout,
        "total_seat": totalSeat,
        "upper_seat_count": upperSeatCount,
        "lower_seat_count": lowerSeatCount,
        "ac_or_non_ac": acOrNonAc,
        "cc_permit_date": "${ccPermitDate.year.toString().padLeft(4, '0')}-${ccPermitDate.month.toString().padLeft(2, '0')}-${ccPermitDate.day.toString().padLeft(2, '0')}",
        "road_tax": roadTax,
        "permit": permit,
        "rc_book": rcBook,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_deleted": isDeleted,
    };
}

class Trip {
    int id;
    String busId;
    String driverId;
    String routeId;
    String conductorId;
    DateTime startTime;
    DateTime endTime;
    DayOff dayOff;
    DateTime createdAt;
    DateTime updatedAt;

    Trip({
        required this.id,
        required this.busId,
        required this.driverId,
        required this.routeId,
        required this.conductorId,
        required this.startTime,
        required this.endTime,
        required this.dayOff,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Trip.fromJson(Map<String, dynamic> json) => Trip(
        id: json["id"],
        busId: json["bus_id"],
        driverId: json["driver_id"],
        routeId: json["route_id"],
        conductorId: json["conductor_id"],
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
        dayOff: dayOffValues.map[json["day_off"]]!,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "bus_id": busId,
        "driver_id": driverId,
        "route_id": routeId,
        "conductor_id": conductorId,
        "start_time": startTime.toIso8601String(),
        "end_time": endTime.toIso8601String(),
        "day_off": dayOffValues.reverse[dayOff],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

enum DayOff {
    THE_01234
}

final dayOffValues = EnumValues({
    "[\"0\",\"1\",\"2\",\"3\",\"4\"]": DayOff.THE_01234
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
