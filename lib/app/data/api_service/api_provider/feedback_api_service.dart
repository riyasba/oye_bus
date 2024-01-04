import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oye_bus/app/data/api_service/config/config.dart';
import 'package:oye_bus/app/data/api_service/models/feedback_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedbackApiService extends Config{

  Future feedbackapi({
    required FeedbackModel feedbackModel
  })async{
    dynamic responseJson;
    try{
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString('auth_token');
      var response = await dio.post(feedbackURL,
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
        "role_id":2,
        "feedback":feedbackModel.feedback,
         "ratings":feedbackModel.rating,
         "subject":feedbackModel.subject
      }
      );
      print(':::::::::Feedback Api:::::::<status code>:::::::::::');
      print(response.data);
      print(response.statusCode);
      responseJson=response;
    }
    on SocketException{
      print('no internet');
    }
    return responseJson;
  }
}