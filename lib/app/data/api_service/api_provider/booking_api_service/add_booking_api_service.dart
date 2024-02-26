
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oye_bus/app/data/api_service/config/config.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/add_booking_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class  AddBookingApiService extends Config{

  Future addBookingApi({
    required AddBookingModel addBookingModel})async{
    dynamic responseJson;
    try{
     var dio = Dio();
     FormData formData = FormData.fromMap(
      {
        "seat_map_id":addBookingModel.seatmapid,
        "vendor_id":addBookingModel.vendorid,
         "trip_id":addBookingModel.tripid,
         "route_id":addBookingModel.routeid,
         "bus_id":addBookingModel.busid,
           for(int i = 0;i<addBookingModel.selectedSeats.length;i++)
          "seat_id[$i]": addBookingModel.selectedSeats[i].id,
          for(int i = 0;i<addBookingModel.selectedSeats.length;i++)
          "passengers[$i][seats_id]": addBookingModel.selectedSeats[i].id,
          "per_ticket_price":addBookingModel.perticketPrice,
          "is_woman_seat":addBookingModel.iswomenseat,
          "boarding_point":addBookingModel.boardingPoint,
          "departure_point":addBookingModel.droppingPoint,
          "date": addBookingModel.date,
          "customer_mobile":addBookingModel.mobile,
          "customer_email":addBookingModel.emailId,
          "primary_customer_name": addBookingModel.primaryCustomerName,
           for(int i = 0; i< addBookingModel.passengermodel.length;i++)
          "passengers[$i][name]": addBookingModel.passengermodel[i].name,
           for(int i = 0; i< addBookingModel.passengermodel.length;i++)
          "passengers[$i][age]": addBookingModel.passengermodel[i].age,
           for(int i = 0; i< addBookingModel.passengermodel.length;i++)
          "passengers[$i][gender]": addBookingModel.passengermodel[i].gender,
          "seat_count": addBookingModel.selectedSeats.length
      }
     );
     
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString('auth_token');


      print(formData.fields);
    
      
      var response =await dio.post(addbookingURL,
      options: Options(
        headers: {
          'Accept':"application/json",
          "Authorization":"Bearer $authtoken"
        },
        followRedirects: false,
        validateStatus: (status){
          return status!<=500;
          
        },
        
      ),
      data: formData
      );
      
       print('::::::::::Add booking api service:::::::::::<status code>::::::::::');
       print(response.data);
       print(response.statusCode);
       responseJson = response;
    }
    on SocketException{
      print('no internet');
     
    }
     return responseJson;
  }
}