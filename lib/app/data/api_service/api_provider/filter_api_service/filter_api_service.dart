import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oye_bus/app/data/api_service/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterApiService extends Config{

  Future filterApi({required String boardingname,
    required String destinationname,
    required String date,
    String? busType,
    String?acornonac,
    String?amenities,
    String?busname,
    String? depaturetime,

    })async{
    dynamic responseJson;

    try{
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString('auth_token');
      var response = await dio.post(buslistURL,
      options: Options(
        headers: {
          "Accept":"application/json",
          "Authorization":"Bearer $authtoken"
        },
        followRedirects: false,
        validateStatus: (status){
          return status!<=500;
        }
      ),
      data: {
    "date":"2024-03-25",
    "from_city":"Chennai",
    "to_city":"Bangalore",
    if(busType != null) "bus_type":busType,
    if(acornonac !=null) "ac_or_non_ac":acornonac,
    if(amenities !=null)"amenities":amenities,
    if(busname !=null)"bus_name":busname,
    if(depaturetime !=null)"departure_time":depaturetime
}
      );
      print(":::::::::Fillter Api Service:::::::::<status code>:::::::::");
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