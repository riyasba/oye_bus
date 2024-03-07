import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/api_provider/auth_api_service/loginverify_api_service.dart';
import 'package:oye_bus/app/modules/guestotp/views/guestotp_scuess_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuestotpController extends GetxController {
  //TODO: Implement GuestotpController

  final count = 0.obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  
  //Loginverify
    
    LoginVerificationApiservice loginverificationapiservice =
     LoginVerificationApiservice();

     guestloginVerify({required String mobile,
     required String otp})async{

      isLoading(true);
      dio.Response<dynamic>response = await loginverificationapiservice.LoginVerifyApi(
        otp: otp, mobile: mobile);

        isLoading(false);
        if(response.data['status']==true){
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString("auth_token", response.data['token'].toString());
          Get.offAll(GuestSuccessfulScreen());
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
