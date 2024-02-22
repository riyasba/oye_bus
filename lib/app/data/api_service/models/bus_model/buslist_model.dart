// To parse this JSON data, do
//
//     final busListModel = busListModelFromJson(jsonString);

import 'dart:convert';

BusListModel busListModelFromJson(String str) => BusListModel.fromJson(json.decode(str));

String busListModelToJson(BusListModel data) => json.encode(data.toJson());

class BusListModel {
    bool? status;
    String? message;
    List<BusData>? data;

    BusListModel({
        this.status,
        this.message,
        this.data,
    });

    factory BusListModel.fromJson(Map<String, dynamic> json) => BusListModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<BusData>.from(json["data"]!.map((x) => BusData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class BusData {
    int? id;
    String? vendorId;
    String? busName;
    String? busRegisterNumber;
    BusType? busType;
    String? registrationNumber;
    String? engineNumber;
    String? modelNumber;
    String? chassisNumber;
    String? ownerName;
    String? ownerPhone;
    String? brandName;
    String? insuranceAgencyName;
    String? engineCapacity;
    FuelType? fuelType;
    String? busInsuranceIdNumber;
    DateTime? fireExtinguisherDate;
    String? contactNumber;
    String? noOfDeck;
    SeatLayout? seatLayout;
    String? totalSeat;
    String? upperSeatCount;
    String? lowerSeatCount;
    AcOrNonAc? acOrNonAc;
    DateTime? ccPermitDate;
    dynamic roadTax;
    dynamic permit;
    dynamic rcBook;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? isDeleted;
    Trip? trip;
    Route? route;

    BusData({
        this.id,
        this.vendorId,
        this.busName,
        this.busRegisterNumber,
        this.busType,
        this.registrationNumber,
        this.engineNumber,
        this.modelNumber,
        this.chassisNumber,
        this.ownerName,
        this.ownerPhone,
        this.brandName,
        this.insuranceAgencyName,
        this.engineCapacity,
        this.fuelType,
        this.busInsuranceIdNumber,
        this.fireExtinguisherDate,
        this.contactNumber,
        this.noOfDeck,
        this.seatLayout,
        this.totalSeat,
        this.upperSeatCount,
        this.lowerSeatCount,
        this.acOrNonAc,
        this.ccPermitDate,
        this.roadTax,
        this.permit,
        this.rcBook,
        this.createdAt,
        this.updatedAt,
        this.isDeleted,
        this.trip,
        this.route,
    });

    factory BusData.fromJson(Map<String, dynamic> json) => BusData(
        id: json["id"],
        vendorId: json["vendor_id"],
        busName: json["bus_name"],
        busRegisterNumber: json["bus_register_number"],
        busType: busTypeValues.map[json["bus_type"]]!,
        registrationNumber: json["registration_number"],
        engineNumber: json["engine_number"],
        modelNumber: json["model_number"],
        chassisNumber: json["chassis_number"],
        ownerName: json["owner_name"],
        ownerPhone: json["owner_phone"],
        brandName: json["brand_name"],
        insuranceAgencyName: json["insurance_agency_name"],
        engineCapacity: json["engine_capacity"],
        fuelType: fuelTypeValues.map[json["fuel_type"]]!,
        busInsuranceIdNumber: json["bus_insurance_id_number"],
        fireExtinguisherDate: json["fire_extinguisher_date"] == null ? null : DateTime.parse(json["fire_extinguisher_date"]),
        contactNumber: json["contact_number"],
        noOfDeck: json["no_of_deck"],
        seatLayout: seatLayoutValues.map[json["seat_layout"]]!,
        totalSeat: json["total_seat"],
        upperSeatCount: json["upper_seat_count"],
        lowerSeatCount: json["lower_seat_count"],
        acOrNonAc: acOrNonAcValues.map[json["ac_or_non_ac"]]!,
        ccPermitDate: json["cc_permit_date"] == null ? null : DateTime.parse(json["cc_permit_date"]),
        roadTax: json["road_tax"],
        permit: json["permit"],
        rcBook: json["rc_book"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        isDeleted: json["is_deleted"],
        trip: json["trip"] == null ? null : Trip.fromJson(json["trip"]),
        route: json["route"] == null ? null : Route.fromJson(json["route"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_id": vendorId,
        "bus_name": busName,
        "bus_register_number": busRegisterNumber,
        "bus_type": busTypeValues.reverse[busType],
        "registration_number": registrationNumber,
        "engine_number": engineNumber,
        "model_number": modelNumber,
        "chassis_number": chassisNumber,
        "owner_name": ownerName,
        "owner_phone": ownerPhone,
        "brand_name": brandName,
        "insurance_agency_name": insuranceAgencyName,
        "engine_capacity": engineCapacity,
        "fuel_type": fuelTypeValues.reverse[fuelType],
        "bus_insurance_id_number": busInsuranceIdNumber,
        "fire_extinguisher_date": "${fireExtinguisherDate!.year.toString().padLeft(4, '0')}-${fireExtinguisherDate!.month.toString().padLeft(2, '0')}-${fireExtinguisherDate!.day.toString().padLeft(2, '0')}",
        "contact_number": contactNumber,
        "no_of_deck": noOfDeck,
        "seat_layout": seatLayoutValues.reverse[seatLayout],
        "total_seat": totalSeat,
        "upper_seat_count": upperSeatCount,
        "lower_seat_count": lowerSeatCount,
        "ac_or_non_ac": acOrNonAcValues.reverse[acOrNonAc],
        "cc_permit_date": "${ccPermitDate!.year.toString().padLeft(4, '0')}-${ccPermitDate!.month.toString().padLeft(2, '0')}-${ccPermitDate!.day.toString().padLeft(2, '0')}",
        "road_tax": roadTax,
        "permit": permit,
        "rc_book": rcBook,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "is_deleted": isDeleted,
        "trip": trip?.toJson(),
        "route": route?.toJson(),
    };
}

enum AcOrNonAc {
    AC,
    NON_AC
}

final acOrNonAcValues = EnumValues({
    "AC": AcOrNonAc.AC,
    "Non AC": AcOrNonAc.NON_AC
});

enum BusType {
    SEATER,
    SEATER_SLEEPER,
    SLEEPER
}

final busTypeValues = EnumValues({
    "Seater": BusType.SEATER,
    "Seater/Sleeper": BusType.SEATER_SLEEPER,
    "Sleeper": BusType.SLEEPER
});

enum FuelType {
    DIESEL,
    ELECTRIC,
    PETROL
}

final fuelTypeValues = EnumValues({
    "Diesel": FuelType.DIESEL,
    "Electric": FuelType.ELECTRIC,
    "Petrol": FuelType.PETROL
});

class Route {
    int? id;
    String? vendorId;
    String? sourceLocation;
    String? destinationLocation;
    String? departureTime;
    String? price;
    String? arrivalTime;
    String? totalKm;
    String? totalHours;
    DateTime? createdAt;
    DateTime? updatedAt;

    Route({
        this.id,
        this.vendorId,
        this.sourceLocation,
        this.destinationLocation,
        this.departureTime,
        this.price,
        this.arrivalTime,
        this.totalKm,
        this.totalHours,
        this.createdAt,
        this.updatedAt,
    });

    factory Route.fromJson(Map<String, dynamic> json) => Route(
        id: json["id"],
        vendorId: json["vendor_id"],
        sourceLocation:json["source_location"],
        destinationLocation: json["destination_location"],
        departureTime: json["departure_time"],
        price: json["price"],
        arrivalTime: json["arrival_time"],
        totalKm: json["total_km"],
        totalHours: json["total_hours"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_id": vendorId,
        "source_location": sourceLocationValues.reverse[sourceLocation],
        "destination_location": destinationLocation,
        "departure_time": departureTime,
        "price": price,
        "arrival_time": arrivalTime,
        "total_km": totalKm,
        "total_hours": totalHours,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

enum SourceLocation {
    CHENNAI
}

final sourceLocationValues = EnumValues({
    "Chennai": SourceLocation.CHENNAI
});

enum SeatLayout {
    DOUBLE_DECKER,
    THE_510
}

final seatLayoutValues = EnumValues({
    "Double decker": SeatLayout.DOUBLE_DECKER,
    "5*10": SeatLayout.THE_510
});

class Trip {
    int? id;
    String? busId;
    String? driverId;
    String? routeId;
    String? conductorId;
    DateTime? startTime;
    DateTime? endTime;
   
    DateTime? createdAt;
    DateTime? updatedAt;

    Trip({
        this.id,
        this.busId,
        this.driverId,
        this.routeId,
        this.conductorId,
        this.startTime,
        this.endTime,
     
        this.createdAt,
        this.updatedAt,
    });

    factory Trip.fromJson(Map<String, dynamic> json) => Trip(
        id: json["id"],
        busId: json["bus_id"],
        driverId: json["driver_id"],
        routeId: json["route_id"],
        conductorId: json["conductor_id"],
        startTime: json["start_time"] == null ? null : DateTime.parse(json["start_time"]),
        endTime: json["end_time"] == null ? null : DateTime.parse(json["end_time"]),
       
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "bus_id": busId,
        "driver_id": driverId,
        "route_id": routeId,
        "conductor_id": conductorId,
        "start_time": startTime?.toIso8601String(),
        "end_time": endTime?.toIso8601String(),
     
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
