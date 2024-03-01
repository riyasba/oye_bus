import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oye_bus/app/data/api_service/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusOffersApiService extends Config{

  Future busoffersAPi()async{
    dynamic responseJson;

    try{
      var dio = Dio();
      final  prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString('auth_token');
      var response = await dio.get(busoffersURL,
      options: Options(
        headers: {
          'Accept':'application/json',
          // 'Authorization':'Bearer $authtoken'
        },
        followRedirects: false,
        validateStatus: (status){
          return status!<=500;
        }
      )
      );
      print(':::::::::Bus Offers Api::::::::<status code>:::::::::');
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