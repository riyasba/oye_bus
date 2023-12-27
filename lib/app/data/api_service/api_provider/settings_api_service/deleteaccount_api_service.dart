import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oye_bus/app/data/api_service/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteAccountApiService extends Config{
  
  Future deleteAccountApi()async{
    dynamic responseJson;
    try{
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString('auth_token');
      var response = await dio.post(deleteaccountURL,
      options: Options(
        headers: {
          'Accept':'application/json',
          'Authorization':'Bearer $authtoken',
        },
        followRedirects: false,
        validateStatus: (status){
          return status!<=500;
        }
      ));
      print('::::::::DeleteAccount Api:::::::<status code>::::::::');
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