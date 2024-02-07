// To parse this JSON data, do
//
//     final busSeatBlockedModel = busSeatBlockedModelFromJson(jsonString);


class SeatBlockedData {
    int busId;
    int userId;
    int tripId;
    int routeId;
    int vendorId;
    String seatId;
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
