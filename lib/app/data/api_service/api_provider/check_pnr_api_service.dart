import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oye_bus/app/data/api_service/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckPnrApiService extends Config{

  Future checkPnrApi({required String pnrnumber})async{
    dynamic responseJson;

    try{
      var dio = Dio();
      FormData formData = FormData.fromMap({
       "pnr_number":pnrnumber
      });
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString('auth_token');
      var response = await dio.get(checkpnrURL,
      options: Options(
        headers: {
          "Accept":"application/json",
          'Authorizaton':'Bearer $authtoken'
        },
        followRedirects: false,
        validateStatus: (status){
          return status!<=500;
        }
      ),
      data: formData
      ); 
      print('::::::::::::Check Pnr Api Service :::::::::::::<status code>');
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