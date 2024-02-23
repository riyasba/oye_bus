
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
          "seat_id[0]":2,
          "per_ticket_price":addBookingModel.perticketPrice,
          "is_woman_seat":addBookingModel.iswomenseat,
          "boarding_point":addBookingModel.boardingPoint,
          "departure_point":addBookingModel.droppingPoint,
          "date":addBookingModel.date,
          "customer_mobile":addBookingModel.mobile,
          "customer_email":addBookingModel.emailId,
          "primary_customer_name":addBookingModel.primaryCustomerName,
          "passengers[0][name]":addBookingModel.passengerName,
          "passengers[0][age]":addBookingModel.passengerName,
          "passengers[0][gender]":addBookingModel.passengerName,
        
           "seat_count": 1

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