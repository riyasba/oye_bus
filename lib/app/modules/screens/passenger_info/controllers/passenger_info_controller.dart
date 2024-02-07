import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/api_provider/booking_api_service/add_booking_api_service.dart';
import 'package:oye_bus/app/data/api_service/api_provider/booking_api_service/seat_block_api_service.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/add_booking_model.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/bus_seat_blocked_model.dart';

class PassengerInfoController extends GetxController {
  //TODO: Implement PassengerInfoController

  final count = 0.obs;
    RxBool isLoading = false.obs;
  RxBool ischeckvalue = false.obs;
  
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

   var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var ageController = TextEditingController();
  var genderController = TextEditingController();
    

  void increment() => count.value++;
  
  RxBool isWhatsappSend = true.obs;

  RxBool iHaveGstNumber = false.obs;


  AddBookingApiService addbookingapiservice =
   AddBookingApiService();

   addbooking({required AddBookingModel 
   addBookingModel})async{
    isLoading(true);
    dio.Response<dynamic> response = await addbookingapiservice.addBookingApi(
      addBookingModel: addBookingModel);

      isLoading(false);
      print('>>>>>>>>>>>>>>>>>>>>>>>>>');
      print(response);
      if(response.data['status']==true){
            Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            response.data['message'],
            style: primaryFont.copyWith(color: Colors.white),
          ));
      }
   }

   SeatBlockApiService seatblockapiservice = 
   SeatBlockApiService();

   seatblock({required SeatBlockedData busSeatBlockedModel})async{
    isLoading(true);
    dio.Response<dynamic> response = await seatblockapiservice.seatblockapi(
      seatBlockedData:busSeatBlockedModel );

      isLoading(false);
      if(response.data['status']==true){
        Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            response.data['message'],
            style: primaryFont.copyWith(color: Colors.white),
          ));
      }
   }

}
