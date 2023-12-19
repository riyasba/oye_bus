

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/api_provider/auth_api_service/register_api_service.dart';
import 'package:oye_bus/app/data/api_service/api_provider/auth_api_service/register_otp_verifiy_apisrvice.dart';
import 'package:oye_bus/app/data/api_service/models/register_model.dart';
import 'package:oye_bus/app/modules/authentication/otp/views/otpsucess.dart';
import 'package:oye_bus/app/modules/authentication/register/views/register_otp_verification.dart';
import 'package:oye_bus/app/routes/app_pages.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {


  final count = 0.obs;
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

  String get phoneCode => _phoneCode.value;

  final _phoneCode = ''.obs;

  void selectCountry({
    required BuildContext context,
  }) {
    showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
        flagSize: 25.sp,
        backgroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 16,
          color: Colors.blueGrey,
        ),
        bottomSheetHeight: 500.h,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            20.r,
          ),
          topRight: Radius.circular(
            20.r,
          ),
        ),
        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: const Icon(
            Icons.search,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withOpacity(0.2),
            ),
          ),
        ),
      ),
      onSelect: (Country country) {
        _phoneCode.value = country.phoneCode;
      },
    );
  }

  void increment() => count.value++;

  RegistrationApiservice registrationApiservice = RegistrationApiservice();
  RxBool isLoading = false.obs;

  registerUser(RegisterModel registerModel) async {
    isLoading(true);
    dio.Response<dynamic> response =
        await registrationApiservice.registrationApi(registerModel);
    isLoading(false);

    if (response.statusCode == 201) {
      // final prefs = await SharedPreferences.getInstance();
      // await prefs.setString("auth_token", response.data["token"]);
      //await prefs.setString("temp_auth_token", response.data["token"]);
      //await prefs.setString("verify", "false");
     Get.to(RegisterOtpView(mobile: registerModel.mobile,));
      // Get.to(
      //   otp_page(
      //   phoneNumber: registerModel.mobile,
      //   otp: response.data["user"]["otp"].toString(),
      // ));
    } else if (response.statusCode == 422) {
      Get.rawSnackbar(
        messageText: Text(
          response.data["errors"].first,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }
  }






    RegisterVerificationApiservice registerVerificationApiservice =
     RegisterVerificationApiservice();


//RegisterModel registerModel=RegisterModel();

  RegisterOtpVerify({required String mobile,
     required String otp})async{

      isLoading(true);
      dio.Response<dynamic>response = await registerVerificationApiservice.RegisterVerifyApi(
        otp: otp,   mobile: mobile);

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
