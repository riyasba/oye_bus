import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/api_provider/aboutus_api_service.dart';
import 'package:dio/dio.dart'as dio;
import 'package:oye_bus/app/data/api_service/models/about_us_model.dart';

class AboutusController extends GetxController {
  //TODO: Implement AboutusController

  final count = 0.obs;
  RxBool isLoading = false.obs;
  RxString aboutdata = "".obs; 

  @override
  void onInit() {
   getAboutus();
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

  AboutUsApiService aboutUsApiService = AboutUsApiService();

  getAboutus()async{
    isLoading(true);
  dio.Response<dynamic>response = await aboutUsApiService.aboutusApi();


  isLoading(false);
    if(response.data['status']==true){
    AboutUsModel aboutUsModel = AboutUsModel.fromJson(response.data);
     aboutdata(aboutUsModel.aboutUs);
      //  Get.rawSnackbar(
      //     backgroundColor: Colors.green,
      //     messageText: Text(
      //       response.data["message"],
      //       style: primaryFont.copyWith(color: Colors.white),
      //     ));
    }
    else{
      // Get.rawSnackbar(
      //     backgroundColor: Colors.red,
      //     messageText: Text(
      //       "Something went wrong",
      //       style: primaryFont.copyWith(color: Colors.white),
      //     ));
    }
  }
}
