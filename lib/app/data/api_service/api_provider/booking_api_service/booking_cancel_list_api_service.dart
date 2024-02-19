import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:oye_bus/app/data/api_service/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingCancelledListApiService extends Config{

  Future bookingCanceledListApi()async{

    dynamic responseJson;

    try{
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString('auth_token');
      var response = await dio.get(bookingCancelledlistURL,
      options: Options(
        headers: {
          "Accept":"application/json",
          "Authorization":"Bearer $authtoken"
        },
        followRedirects: false,
        validateStatus: (status){
          return status!=500;
        }
      )
      );
      print('::::::::::Booking Cancelled List Api Service::::::::::<status code>:::::::::::');
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