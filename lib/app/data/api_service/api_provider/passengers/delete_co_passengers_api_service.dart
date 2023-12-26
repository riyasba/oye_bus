import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oye_bus/app/data/api_service/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeletePassengersApiService extends Config{

  Future deletePassengersApi({required String passengerId})async{
  dynamic responseJson;
  try{
    var dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    String? authtoken = prefs.getString('auth_token');
    var response = await dio.post(deletePassengersURL,
    options: Options(
      headers: {
        "Accept":"application/json",
        "Authorization":"Bearer $authtoken"
      },
      followRedirects: false,
      validateStatus: (status){
        return status!<=500;
      }
    ),data: {
       "passenger_id":passengerId
    }
    );
    print('::::::::::passengers delete account api:::::::::::<status code>::::::::::');
    print(response.statusCode);
    print(response.data);
    responseJson = response;
  }
  on SocketException{
    print('no internet');
  }
  return responseJson;
  }
 
}