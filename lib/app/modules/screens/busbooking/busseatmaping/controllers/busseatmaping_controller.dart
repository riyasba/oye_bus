import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/api_provider/booking_api_service/add_booking_api_service.dart';
import 'package:oye_bus/app/data/api_service/api_provider/booking_api_service/bus_seat_api_service.dart';
import 'package:oye_bus/app/data/api_service/api_provider/bus_api_service/bus_details_api_service.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/add_booking_model.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/bus_seats_model.dart';
import 'package:oye_bus/app/data/api_service/models/bus_model/bus_details_model.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/paymentsuccesfull_view.dart';
import 'package:oye_bus/app/services/ease_buzz_payment_api_services.dart';
import 'package:dio/dio.dart'as dio;

class BusseatmapingController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool ischeck =false.obs;
  final count = 0.obs;
  RxInt dropingIndex =0.obs;
  @override
  void onInit() {
    getBusdetails();
    busseats();
    super.onInit();
  }

  RxInt current = 0.obs;
  RxInt currentbording = 1.obs;

  int get index1 => current.value;
 // int get index3 => currentbording.value;

  void setIndex(int currentIndex) {
    current(currentIndex);
  }

  // void dropingIndex(int currentbordingindex) {
  //   currentbording(currentbordingindex);
  // }
List<bool> seats = List.generate(30, (_) => false);
List<bool> seats1 = List.generate(30, (_) => false);
List<bool> seats2 = List.generate(30, (_) => false);
List<bool> seats3 = List.generate(30, (_) => false);

   void seatSelection(int index) {
    seats[index] = !seats[index];
    // Perform other operations related to seat selection here
  }

 void seatSelection1(int index1) {
    seats1[index1] = !seats1[index1];
    // Perform other operations related to seat selection here
  }
 void seatSelection2(int index) {
    seats2[index] = !seats2[index];
    // Perform other operations related to seat selection here
  }

 void seatSelection3(int index) {
    seats3[index] = !seats3[index];
    // Perform other operations related to seat selection here
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


   String? mobilenumber;
   String?email;
   String?amount;
   String?name;

   static MethodChannel _channel = MethodChannel('easebuzz');
  EaseBuzzTokenApiService easeBuzzApi = EaseBuzzTokenApiService();

  payUseingEaseBuzzSubs(
      {required String mobilenumber,
      required String email,
      required String amount,
      required String name,
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
        name: name,);


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
      
      Get.to(() => PaymentsuccesfullView());
    } else {
      //Get.to(PaymentFailedScreen());
      Get.snackbar(
          "The last transaction has been cancelled!", "Please try again!",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

BusSeatApiService busseatapiservice = 
BusSeatApiService();

List<BusSeatData> busseatdata=[];

busseats()async{
  isLoading(true);
  dio.Response<dynamic>response = await busseatapiservice.busSeatapi();
  
  isLoading(false);
  if(response.data['status']==true){
    BusSeatsModel busSeatsModel = BusSeatsModel.fromJson(response.data);
    busseatdata=busSeatsModel.data;
    update();
  }
}

  BusDetailsApiService busdetailsapiservice = BusDetailsApiService();
   RouteData? routedata;
   AboutBus? aboutbusdata;
   BusDetails ? busDetailsdata;
   Trip?tripdata;
   List<Ing>droppointdata=[];
   List<RestStop>reststopdata=[];
   List<Amenity>amenitydata=[];
   Policies?policiesdata;
   List<String>busimages=[];
   List<Ing> boardingpointdata=[];


  getBusdetails()async{
    isLoading(true);
   dio.Response<dynamic>response = await busdetailsapiservice.busdetailsapi();

   isLoading(false);
   if(response.data['status']==true){
    BusDetailsModel busdetailsmodel = BusDetailsModel.fromJson(response.data);
    aboutbusdata=busdetailsmodel.aboutBus;
    droppointdata = busdetailsmodel.dropping;
    reststopdata = busdetailsmodel.restStop;
    amenitydata = busdetailsmodel.amenities;
    policiesdata = busdetailsmodel.policies;
    busimages = busdetailsmodel.busImages;
    boardingpointdata = busdetailsmodel.boarding;
    busDetailsdata = busdetailsmodel.busDetails;
    routedata = busdetailsmodel.route;
    tripdata = busdetailsmodel.trip;
    update();
   }else{
    
   }
  }
    
}
