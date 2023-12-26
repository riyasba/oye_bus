class BusDetailsModel{


 String travelsName;
 String busName;
 String tag;
 dynamic promoLogo;
 String startTime;
 String arrivaltime;
 String bordingAt;
 String destination;
 String duration;
 String rating;
 String availableSeats;
 String price;

BusDetailsModel({
  required this.arrivaltime,
   required this.availableSeats,
 required   this.bordingAt,
 required   this.busName,
 required   this.destination,
 required   this.duration,
  required  this.price,
  this.promoLogo,
 required   this.rating,
 required   this.startTime,
 required   this.tag,
 required   this.travelsName
});


}