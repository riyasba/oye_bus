

import 'package:oye_bus/app/data/api_service/models/get_bus_seat_layout_model.dart';
import 'package:oye_bus/app/data/api_service/models/passengers/co_passangers_model.dart';

class AddBookingModel{
  String perticketPrice;
  String boardingPoint;
  String droppingPoint;
  String date;
  String mobile;
  String emailId;
  String passengerName;
  String age;
  String primaryCustomerName;
  String gender;
  String seatmapid;
  String vendorid;
  String tripid;
  String routeid;
  String busid;
  List seatid; 
  List<Seat> selectedSeats;
  List<PassangersData> passengermodel;
  String iswomenseat; 

  AddBookingModel({
    required this.age,
    required this.boardingPoint,
    required this.date,
    required this.droppingPoint,
    required this.emailId,
    required this.gender,
    required this.mobile,
    required this.passengerName,
    required this.perticketPrice,
    required this.primaryCustomerName,
    required this.busid,
    required this.routeid,
    required this.seatid,
    required this.seatmapid,
    required this.tripid,
    required this.vendorid,
    required this.selectedSeats,
    required this.iswomenseat,
    required this.passengermodel,
  });

}

class  PassengerModel{
  String passengerName;
  String gender;
  int age;

  PassengerModel({
    required this.age,
    required this.gender,
    required this.passengerName

  });
}

