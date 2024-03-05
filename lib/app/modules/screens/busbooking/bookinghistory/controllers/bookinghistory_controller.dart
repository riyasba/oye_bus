import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import 'package:oye_bus/app/data/api_service/api_provider/booking_api_service/booking_cancel_api_service.dart';
import 'package:oye_bus/app/data/api_service/api_provider/booking_api_service/booking_cancel_list_api_service.dart';
import 'package:oye_bus/app/data/api_service/api_provider/booking_api_service/booking_history_api_service.dart';
import 'package:oye_bus/app/data/api_service/api_provider/bus_review_api-services/bus_review_api_services.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/booking_canceled_list_model.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/booking_history_model.dart';

class BookinghistoryController extends GetxController {
  //TODO: Implement BookinghistoryController

  final count = 0.obs;
  RxBool isLoading = false.obs;
 RxInt containerindex =0.obs; 
 
  @override
  void onInit() {
    super.onInit();
     bookinghistory();
     bookingCancelledList();
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

  BookingHistoryApiService bookinghistoryapiservice =
   BookingHistoryApiService();

   List<BookingDetail>? bookinghistorydata=[];

   bookinghistory()async{
    isLoading(true);
    dio.Response<dynamic>response = await bookinghistoryapiservice.bookingHistoryApi();
    
    isLoading(false);
    if(response.data['status']==true){
      BookingHistoryModel bookingHistoryModel = BookingHistoryModel.fromJson(response.data);
      bookinghistorydata = bookingHistoryModel.bookingDetails;
    }
    update();
   }
   BookingCancelledListApiService bookingcancelledlistapiservice = 
   BookingCancelledListApiService();

   List<BookingCancelledDetail> bookingcancelledlistdata = [];

   bookingCancelledList()async{
    isLoading(true);
    dio.Response<dynamic> response = await bookingcancelledlistapiservice.bookingCanceledListApi();

    isLoading(false);
    if(response.data['status']==true){
      BookingCancelledListModel bookingcancellistModel = 
      BookingCancelledListModel.fromJson(response.data);
    bookingcancelledlistdata =  bookingcancellistModel.bookingDetails!;
    
    }
    update();
   }





   



}
