import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oye_bus/app/data/api_service/config/config.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/bus_seat_blocked_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SeatBlockApiService extends Config{

  Future seatblockapi({required SeatBlockedData seatBlockedData})
  async{
     dynamic responseJson;
      try{
        var dio = Dio();
        final prefs = await SharedPreferences.getInstance();
        String? authtoken = prefs.getString('auth_token');

        var response = await dio.post(blockseatURL,
        options: Options(
          headers: {
            "Accept":"application/json",
            "Authorization":"Bearer $authtoken",
          },
          followRedirects:false,
          validateStatus: (status){
            return status!<=500;
          } 
        ),
        data: {
         "bus_id":seatBlockedData.busId,
          "trip_id":seatBlockedData.tripId,
          "route_id":seatBlockedData.routeId,
          "vendor_id":seatBlockedData.vendorId,
          "seat_id[0]":seatBlockedData.seatId,
          "seat_count":seatBlockedData.seatCount
        }
        );
        print('::::::::seat_block_api_service::::::::<status code>:::::::');
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