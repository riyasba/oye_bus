// To parse this JSON data, do
//
//     final busdetailsModel = busdetailsModelFromJson(jsonString);

import 'dart:convert';

BusdetailsModel busdetailsModelFromJson(String str) => BusdetailsModel.fromJson(json.decode(str));

String busdetailsModelToJson(BusdetailsModel data) => json.encode(data.toJson());

class BusdetailsModel {
    bool status;
    String message;
    AboutBus aboutBus;
    List<Ing> boarding;
    List<Ing> dropping;
    List<RestStop> restStop;
    List<Amenity> amenities;
    Policies policies;
    List<String> busImages;

    BusdetailsModel({
        required this.status,
        required this.message,
        required this.aboutBus,
        required this.boarding,
        required this.dropping,
        required this.restStop,
        required this.amenities,
        required this.policies,
        required this.busImages,
    });

    factory BusdetailsModel.fromJson(Map<String, dynamic> json) => BusdetailsModel(
        status: json["status"],
        message: json["message"],
        aboutBus: AboutBus.fromJson(json["AboutBus"]),
        boarding: List<Ing>.from(json["boarding"].map((x) => Ing.fromJson(x))),
        dropping: List<Ing>.from(json["dropping"].map((x) => Ing.fromJson(x))),
        restStop: List<RestStop>.from(json["restStop"].map((x) => RestStop.fromJson(x))),
        amenities: List<Amenity>.from(json["amenities"].map((x) => Amenity.fromJson(x))),
        policies: Policies.fromJson(json["policies"]),
        busImages: List<String>.from(json["bus_images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "AboutBus": aboutBus.toJson(),
        "boarding": List<dynamic>.from(boarding.map((x) => x.toJson())),
        "dropping": List<dynamic>.from(dropping.map((x) => x.toJson())),
        "restStop": List<dynamic>.from(restStop.map((x) => x.toJson())),
        "amenities": List<dynamic>.from(amenities.map((x) => x.toJson())),
        "policies": policies.toJson(),
        "bus_images": List<dynamic>.from(busImages.map((x) => x)),
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
        safety: json["safety"]??'',
        onTime: json["on_time"]??'',
        comfortable: json["comfortable"]??'',
        liveTracking: json["live_tracking"]??'',
        flexiTicket: json["flexi_ticket"]??'',
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
        id: json["id"]??'',
        title: json["title"]??'',
        icon: json["icon"]??'',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "icon": icon,
    };
}

class Ing {
    int id;
    String location;
    String time;

    Ing({
        required this.id,
        required this.location,
        required this.time,
    });

    factory Ing.fromJson(Map<String, dynamic> json) => Ing(
        id: json["id"]??'',
        location: json["location"]??'',
        time: json["time"]??'',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "location": location,
        "time": time,
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
        childPolicy: json["child_policy"]??'',
        luggagePolicy: json["luggage_policy"]??'',
        cancelPolicy: json["cancel_policy"]??'',
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
        id: json["id"]??'',
        place: json["place"]??'',
        time: json["time"]??'',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "place": place,
        "time": time,
    };
}
