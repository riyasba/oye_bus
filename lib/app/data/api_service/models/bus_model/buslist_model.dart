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
    dynamic ccPermitDate;
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
        ccPermitDate: json["cc_permit_date"],
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
        "cc_permit_date": ccPermitDate,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_deleted": isDeleted,
    };
}
