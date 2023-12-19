import 'dart:io';
import 'package:dio/dio.dart';
import 'package:oye_bus/app/data/api_service/config/config.dart';
import 'package:oye_bus/app/data/api_service/models/register_model.dart';

class RegistrationApiservice extends Config {
  Future registrationApi(RegisterModel registerModel,
      ) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      var response = await dio.post(
        registerURL,
        options: Options(
          headers: {'Content-Type': 'application/json'},
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
        data: {
          "name": registerModel.name,
          "email":registerModel. email,
          "mobile":registerModel. mobile,
          "role_id": 2,
        },
      );
      print(':::::::rigister Verify Api:::::::::<status code>::${registerModel. mobile}::::::');
      print(response.data);
      print(response.statusCode);
      responseJson = response;
    } on SocketException {
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
