// To parse this JSON data, do
//
//     final busSeatBlockedModel = busSeatBlockedModelFromJson(jsonString);


import 'package:oye_bus/app/data/api_service/models/get_bus_seat_layout_model.dart';

class SeatBlockedData {
    int busId;
    int userId;
    int tripId;
    int routeId;
    int vendorId;
    List<Seat> seatId;
    int seatCount;
   

    SeatBlockedData({
        required this.busId,
        required this.userId,
        required this.tripId,
        required this.routeId,
        required this.vendorId,
        required this.seatId,
        required this.seatCount,
       
    });

}
