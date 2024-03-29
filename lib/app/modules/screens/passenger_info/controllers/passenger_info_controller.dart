import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/api_provider/booking_api_service/add_booking_api_service.dart';
import 'package:oye_bus/app/data/api_service/api_provider/booking_api_service/seat_block_api_service.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/add_booking_model.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/bus_seat_blocked_model.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/pickanddrop_view.dart';
import 'package:oye_bus/app/services/ease_buzz_payment_api_services.dart';

import '../../busbooking/busseatmaping/views/paymentsuccesfull_view.dart';

class PassengerInfoController extends GetxController {
  //TODO: Implement PassengerInfoController

  final count = 0.obs;
    RxBool isLoading = false.obs;
  RxBool ischeckvalue = false.obs;
   RxString gender=''.obs;
   RxString editender=''.obs;
     RxBool istogglevalue = false.obs;
  
  
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
        Get.offAll(()=> PaymentsuccesfullView());
        Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            response.data['message'],
            style: primaryFont.copyWith(color: Colors.white),
          ));
      }
      else{
         Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data['message'],
            style: primaryFont.copyWith(color: Colors.white),
          ));
      }
   }

   int blockedid = 0;
   SeatBlockApiService seatblockapiservice = 
   SeatBlockApiService();
    
   seatblock({required SeatBlockedData busSeatBlockedModel})async{
    isLoading(true);
    
    dio.Response<dynamic> response = await seatblockapiservice.seatblockapi(
      seatBlockedData:busSeatBlockedModel );
      
      isLoading(false);
      print('::::::::seat block data::::::::::');
      print(response.data);
      if(response.data['success']==true){
        blockedid =response.data['data']['id'];
        Get.to(PickanddropView());
        // Get.rawSnackbar(
        // backgroundColor: Colors.green,
        // messageText: Text(
        // response.data['message'],
        // style: primaryFont.copyWith(color: Colors.white),
        // ));
        print(':::::::bloack seat id');
        print(response.data);
      }
   }

   static MethodChannel _channel = MethodChannel('easebuzz');
  EaseBuzzTokenApiService easeBuzzApi = EaseBuzzTokenApiService();

  payAndBook({
    required String mobilenumber,
    required String email,
    required String amount,
    required String name,
     required AddBookingModel addBookingModel
  }) async {
    print('mobile number');
    print(mobilenumber);
    print('emailid');
    print(email);
    print('amount');
    print(amount);
    print('name');
    print(name);

    var response = await easeBuzzApi.getPaymentToken(
      amount: amount,
      email: email,
      phone: mobilenumber,
      id: "${DateTime.now().day}${DateTime.now().year}${DateTime.now().minute}${DateTime.now().second}${DateTime.now().millisecond}${DateTime.now().microsecond}",
      name: name,
    );

    print('::::::transaction easebusz id:::::::::');
    print(response['data']);

    String access_key = response["data"];
    String pay_mode = "test";

    print("access_key >>$access_key");
    Object parameters = {"access_key": access_key, "pay_mode": pay_mode};
    // isPayLoading(false);
    isLoading(false);
    final payment_response =
        await _channel.invokeMethod("payWithEasebuzz", parameters);
    print(payment_response);
    isLoading(false);
    if (payment_response["result"] == "payment_successfull") {
      //need to give id
      String transactionId = "";

      addbooking(addBookingModel: addBookingModel);
    } else {
      //Get.to(PaymentFailedScreen());
      Get.snackbar(
          "The last transaction has been cancelled!", "Please try again!",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

}
