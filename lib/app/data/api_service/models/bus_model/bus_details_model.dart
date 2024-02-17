// To parse this JSON data, do
//
//     final busDetailsModel = busDetailsModelFromJson(jsonString);

import 'dart:convert';

BusDetailsModel busDetailsModelFromJson(String str) => BusDetailsModel.fromJson(json.decode(str));

String busDetailsModelToJson(BusDetailsModel data) => json.encode(data.toJson());

class BusDetailsModel {
    bool status;
    String message;
    Trip trip;
    BusDetails busDetails;
    List<Amenity> amenities;
    Policies policies;
    List<String> busImages;
    AboutBus aboutBus;
    RouteData route;
    List<dynamic> boarding;
    List<dynamic> dropping;
    List<RestStop> restStop;

    BusDetailsModel({
        required this.status,
        required this.message,
        required this.trip,
        required this.busDetails,
        required this.amenities,
        required this.policies,
        required this.busImages,
        required this.aboutBus,
        required this.route,
        required this.boarding,
        required this.dropping,
        required this.restStop,
    });

    factory BusDetailsModel.fromJson(Map<String, dynamic> json) => BusDetailsModel(
        status: json["status"],
        message: json["message"],
        trip: json["trip"],
        busDetails: BusDetails.fromJson(json["bus_details"]),
        amenities: List<Amenity>.from(json["amenities"].map((x) => Amenity.fromJson(x))),
        policies: Policies.fromJson(json["policies"]),
        busImages: List<String>.from(json["bus_images"].map((x) => x)),
        aboutBus: AboutBus.fromJson(json["AboutBus"]),
        route: RouteData.fromJson(json["Route"]),
        boarding: List<dynamic>.from(json["boarding"].map((x) => x)),
        dropping: List<dynamic>.from(json["dropping"].map((x) => x)),
        restStop: List<RestStop>.from(json["restStop"].map((x) => RestStop.fromJson(x))),
    );
//json['id'] != null ? (json['id'] as num?)?.toInt() : null
    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "trip": trip??trip,
        "bus_details": busDetails.toJson(),
        "amenities": List<dynamic>.from(amenities.map((x) => x.toJson())),
        "policies": policies.toJson(),
        "bus_images": List<dynamic>.from(busImages.map((x) => x)),
        "AboutBus": aboutBus.toJson(),
        "Route": route.toJson(),
        "boarding": List<dynamic>.from(boarding.map((x) => x)),
        "dropping": List<dynamic>.from(dropping.map((x) => x)),
        "restStop": List<dynamic>.from(restStop.map((x) => x.toJson())),
    };
}

class AboutBus {
    String safety;
    String onTime;
    String comfortable;
    String liveTracking;
    String flexiTicket;

    AboutBus({
        required this.safety,
        required this.onTime,
        required this.comfortable,
        required this.liveTracking,
        required this.flexiTicket,
    });

    factory AboutBus.fromJson(Map<String, dynamic> json) => AboutBus(
        safety: json["safety"],
        onTime: json["on_time"],
        comfortable: json["comfortable"],
        liveTracking: json["live_tracking"],
        flexiTicket: json["flexi_ticket"],
    );

    Map<String, dynamic> toJson() => {
        "safety": safety,
        "on_time": onTime,
        "comfortable": comfortable,
        "live_tracking": liveTracking,
        "flexi_ticket": flexiTicket,
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

class Policies {
    String childPolicy;
    String luggagePolicy;
    String cancelPolicy;

    Policies({
        required this.childPolicy,
        required this.luggagePolicy,
        required this.cancelPolicy,
    });

    factory Policies.fromJson(Map<String, dynamic> json) => Policies(
        childPolicy: json["child_policy"],
        luggagePolicy: json["luggage_policy"],
        cancelPolicy: json["cancel_policy"],
    );

    Map<String, dynamic> toJson() => {
        "child_policy": childPolicy,
        "luggage_policy": luggagePolicy,
        "cancel_policy": cancelPolicy,
    };
}

class RestStop {
    int id;
    String place;
    String time;

    RestStop({
        required this.id,
        required this.place,
        required this.time,
    });

    factory RestStop.fromJson(Map<String, dynamic> json) => RestStop(
        id: json["id"],
        place: json["place"],
        time: json["time"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "place": place,
        "time": time,
    };
}

class RouteData {
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

    RouteData({
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
    });

    factory RouteData.fromJson(Map<String, dynamic> json) => RouteData(
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
    String dayOff;
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
        dayOff: json["day_off"],
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
        "day_off": dayOff,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
