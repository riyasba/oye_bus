import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/data/api_service/config/config.dart';

class LoginApiService extends Config{
  
  Future LoginApi({required String mobile})async{
   dynamic responseJson;
   try{
    var dio = Dio();
    var respose = await dio.post(loginURL,
    options: Options(
      headers: {
        'Content-Type': 'application/json'
      },
      followRedirects: false,
      validateStatus: (status){
        return status!<=500;
      },
      
    ),
    data: {
      'mobile':mobile
    }
    );
    print(':::::::Login Api::::::::<status code>::::::::');
    print(respose.data);
    print(respose.statusCode);
    responseJson = respose;
   }
   on SocketException{
    print('no internet');

   }

    return responseJson;
  }
  //  dynamic returnResponse(Response<dynamic>response){
  //   switch(response.statusCode){
  //     case 200:
  //     dynamic responseJson = response.data;
  //     print('here.>>>>>>>');
  //     return responseJson;
  //      case 400:
  //     // throw BadRequestException(response.body.toString());
  //     case 401:
  //     case 403:
  //     // throw UnauthorisedException(response.body.toString());
  //     case 404:
  //     // throw UnauthorisedException(response.body.toString());
  //     case 500:
  //     default:
  //     // throw FetchDataException(
  //     //     'Error occured while communication with server' +
  //     //         ' with status code : ${response.statusCode}');
  //   }
  // }
}