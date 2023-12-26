import 'package:country_picker/country_picker.dart';
import 'package:dio/dio.dart'as dio;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/api_provider/auth_api_service/login_api_service.dart';
import 'package:oye_bus/app/data/api_service/api_provider/auth_api_service/loginverify_api_service.dart';
import 'package:oye_bus/app/modules/authentication/otp/views/otp_view.dart';
import 'package:oye_bus/app/modules/authentication/otp/views/otpsucess.dart';
import 'package:oye_bus/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

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
  
  //Login
   LoginApiService loginapiservice = LoginApiService();

   getLoginUser({required String mobile})async{
    isLoading(true); 
     dio.Response<dynamic>response = 
     await loginapiservice.LoginApi(mobile: mobile);

  isLoading(false);
  print(response.data);
  if(response.data['status']==true){
    Get.to(OtpView(mobile: mobile,));
  }
   else{
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
         )
      );
    }
   }
    

}
