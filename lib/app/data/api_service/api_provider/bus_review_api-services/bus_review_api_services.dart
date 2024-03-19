import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oye_bus/app/data/api_service/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusReviewApiServices extends Config {
  Future busReviewApiServices({
    required int busId,
    required double rating, 
    required String reviews, 
    required String travellersLikedId, 
  }) async {
    dynamic responseJson;
    try {
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString('auth_token');
      var response = await dio.post(sendBusReview,
          options: Options(
            headers: {
              'Accept': "application/json",
              "Authorization": 'Bearer $authtoken'
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
          ),
          data: {
            "bus_id": busId,
            "ratings": rating,
            "reviews": reviews,
            "travellers_liked_id":travellersLikedId
          });
      print('::::::::Bus Reveiw Api:::::::::<status code>:::::::');
      print(response.data);
      print(response.statusCode);
      responseJson = response;
    } on SocketException {
      print('no internet');
    }
    return responseJson;
  }
}
