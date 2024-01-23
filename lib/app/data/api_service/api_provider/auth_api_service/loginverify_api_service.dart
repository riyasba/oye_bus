import 'dart:io';
import 'package:dio/dio.dart';
import 'package:oye_bus/app/data/api_service/config/config.dart';



class LoginVerificationApiservice extends Config{
  
  Future LoginVerifyApi({required String otp,
  required String mobile,})async{

    dynamic responseJson;
    try{
      var dio = Dio();
      var response = await dio.post(loginverifyURL,
      options: Options(
        headers: {
          'Content-Type': 'application/json'
        },
        validateStatus: (status){
          return status!<=500;
        }
      ),
      data: {
         "mobile":mobile,
          "otp":otp,
          "role_id":3
      }
      );
      print(':::::::Login Verify Api:::::::::<status code>:::::::$otp:');
      print(response.data);
      print(response.statusCode);
      responseJson=response;
    }
    on SocketException{
      print('no internet');
     
    }
     return responseJson;
  }
   dynamic returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        print("here.>>>>>>>>>>>>");
        return responseJson;
      case 400:
      // throw BadRequestException(response.body.toString());
      case 401:
      case 403:
      // throw UnauthorisedException(response.body.toString());
      case 404:
      // throw UnauthorisedException(response.body.toString());
      case 500:
      default:
      // throw FetchDataException(
      //     'Error occured while communication with server' +
      //         ' with status code : ${response.statusCode}');
    }
  }
}