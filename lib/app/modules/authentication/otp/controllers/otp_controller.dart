import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/api_provider/auth_api_service/loginverify_api_service.dart';
import 'package:oye_bus/app/modules/authentication/otp/views/otpsucess.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpController extends GetxController {
  //TODO: Implement OtpController

  final count = 0.obs;
     RxBool isLoading = false.obs;
          int start = 60; // Timer duration in seconds
  RxBool isActive = false.obs;
  late Timer _timer;

  void startTimer(){
    const oneSec = Duration(seconds: 1);
     _timer = Timer.periodic(oneSec, 
     (timer) {
        if(start==1){
          isActive(false);
          timer.cancel();
          start = 60;
        }
        else{
          start--;
        }
      });
  }
  @override
  void onInit() {
    super.onInit();
    startTimer();
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {

    super.onClose();
      _timer.cancel();
     update(); 
     
  }

  void increment() => count.value++;

  //Loginverify
    
    LoginVerificationApiservice loginverificationapiservice =
     LoginVerificationApiservice();

     loginVerify({required String mobile,
     required String otp})async{

      isLoading(true);
      dio.Response<dynamic>response = await loginverificationapiservice.LoginVerifyApi(
        otp: otp, mobile: mobile);

        isLoading(false);
        if(response.data['status']==true){
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString("auth_token", response.data['token'].toString());
          Get.offAll(SuccessfulScreen());
        }
           else {
        Get.rawSnackbar(
            backgroundColor: Colors.red,
            messageText: Text(
              response.data["message"],
              style: primaryFont.copyWith(color: Colors.white),
            ));  
       } 
     }
}
