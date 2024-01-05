import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oye_bus/app/data/api_service/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusCitySearchApiService extends Config{

  Future buscitySearchApi({required String city})
  async{ 
    dynamic responseJson;
    try{
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString('auth_token');
      var response = await dio.post(buscitySearchURL,
      options: Options(
        headers: {
          'Accept':"application/json",
          "Authorization":'Bearer $authtoken'
        },
        followRedirects: false,
        validateStatus: (status){
          return status!<=500;
        },
        
      ),
      data: {
         "city":city,
         "country_id":101
      }
      );
      print('::::::::Bus City Search Api:::::::::<status code>:::::::');
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