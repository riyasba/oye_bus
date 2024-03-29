import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oye_bus/app/data/api_service/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusDetailsApiService extends Config{

  Future busdetailsapi({required String busId,required String tripId})async{
    dynamic responseJson;
    try{
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString('auth_token');
      var response = await dio.post(busdetailsURL,
      options: Options(
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $authtoken'
        },
        followRedirects: false,
        validateStatus: (status){
          return status!<=500;
        },
      ),
      data: {
      "bus_id":busId,
      "trip_id":tripId
      }
      );
      print('::::::::::::Bus details api:::::::::::<status code>:::::$busId:::$tripId::');

      print(busId);
      print('bus details ');
      print(response);
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