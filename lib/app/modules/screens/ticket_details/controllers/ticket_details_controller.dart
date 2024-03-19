import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/api_provider/booking_api_service/booking_cancel_api_service.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bookinghistory/controllers/bookinghistory_controller.dart';

class TicketDetailsController extends GetxController {
  //TODO: Implement TicketDetailsController

  final count = 0.obs;
  RxBool isLoading  = false.obs;
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

  BookingCancelApiService bookingcancelapiservice = 
  BookingCancelApiService();
  
  bookingCancellation({required String bookingid})async{
    isLoading(true);
   dio.Response<dynamic>response = await bookingcancelapiservice.bookingCancelApi(
    bookingId: bookingid);

    isLoading(false);
    if(response.data['status']==true){
      Get.find<BookinghistoryController>(). bookinghistory();
      Get.find<BookinghistoryController>(). bookingCancelledList();
      Get.back();
       Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            response.data['message'],
            style: primaryFont.copyWith(color: Colors.white),
          ));
          
          
    }else{
       Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data['message'],
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
    
  }


}
