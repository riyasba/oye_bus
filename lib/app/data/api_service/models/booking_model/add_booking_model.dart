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
    required this.iswomenseat,
  });

}

