import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oye_bus/app/data/api_service/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusListApiService extends Config{

  Future buslistapi({ 
    required String boardingname,
    required String destinationname,
    required String date,
  })async{
    dynamic responseJson;

    try{
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString('auth_token');
      var response = await dio.post(buslistURL,
      options: Options(
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $authtoken'
        },
        followRedirects: false,
        validateStatus: (status){
          return status!<=500;
        }
      ),
      data: {
        "date":date,
         "from_city":boardingname,
          "to_city":destinationname
      },
      
      );
      print(':::::::::BusList Api:::::::::<status code>::::::$boardingname::$destinationname:');
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