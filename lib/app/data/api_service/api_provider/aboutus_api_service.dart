import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:oye_bus/app/data/api_service/config/config.dart';
import 'package:oye_bus/app/data/api_service/models/about_us_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutUsApiService extends Config{

  Future aboutusApi()async{
    dynamic responseJson;
    try{
     var dio = Dio();
     final prefs = await SharedPreferences.getInstance();
     String? authtoken = prefs.getString('auth_token');
     var response =await dio.get(aboutusURL,
     options: Options(
      headers: {
        'Accept':'application/json',
        'Authorization':'Bearer $authtoken'
      },
      followRedirects: false,
      validateStatus: (status){
        return status!<=500;
      }
     )
     );
     print('::::::::AboutUs Api::::::::<status code>:::::::::');
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