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
import 'package:oye_bus/app/data/api_service/models/bus_seat_model.dart';
import 'package:oye_bus/app/data/api_service/models/get_bus_seat_layout_model.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/paymentsuccesfull_view.dart';
import 'package:oye_bus/app/services/ease_buzz_payment_api_services.dart';
import 'package:dio/dio.dart'as dio;

import '../../../../../components/bus_seat_components.dart';

class BusseatmapingController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool ischeck =false.obs;
  final count = 0.obs;
  RxInt dropingIndex =0.obs;
  RxString boardinglocationvalue=''.obs;
  RxString destinationlocationvalue=''.obs;
List seatname=[];
  @override
  void onInit() {
    
    // busseats();
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


   Seat emptySeat = Seat(columnNo: "0",fareKey: "",isBookable: "",isWindowSeat: "",ladiesSeat: "",layout: "Empty",layoutId: "0",length: "0",position: "Empty",rowNo: "0",seatNo: "0",width: "0",busId: "",id: 0,seatPrice: ""
   );

   Seat driverSeat = Seat(columnNo: "0",fareKey: "",isBookable: "",isWindowSeat: "",ladiesSeat: "",layout: "Driver",layoutId: "0",length: "0",position: "Driver",rowNo: "0",seatNo: "0",width: "0",busId: "",id: 0,seatPrice: ""
   );

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

// List<BusSeatData> busseatdata=[];


Future<BusModel?> busseats(int busId)async{
  BusModel? busModel;
  isLoading(true);
  dio.Response<dynamic>response = await busseatapiservice.busSeatapi(busId);
  
  isLoading(false);
  if(response.data['status']==true){
    BusModel busSeatsModel = BusModel.fromJson(response.data);
    // busseatdata=busSeatsModel.data;
    busModel = busSeatsModel;
    update();
  }

  return busModel;
}

  BusDetailsApiService busdetailsapiservice = BusDetailsApiService();
   RouteData? routedata;
   AboutBus? aboutbusdata;
   BusDetails ? busDetailsdata;
   Trip?tripdata;
   List<dynamic>droppointdata=[];
   List<RestStop>reststopdata=[];
   List<Amenity>amenitydata=[];
   Policies?policiesdata;
   List<String>busimages=[];
   List<dynamic> boardingpointdata=[];
   RxString boardingtime = ''.obs;
   RxString destinationtime = ''.obs;

  getBusdetails({required String busId,required String tripId })async{
    isLoading(true);
   dio.Response<dynamic>response = await busdetailsapiservice.busdetailsapi(busId: busId, 
   tripId: tripId);
    
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
    // tripdata = busdetailsmodel.trip;
    update();
   }else{
    
   }
  }




  List<List<Seat>> generateSeatLayoutLower(BusModel busModel){
      //  var seats =
    List<Seat> seatList = busModel.seatMap;
  
    List<Seat> rowLower1 = sortListPositionsLower(rowNumber: 1,seatList: seatList);
    List<Seat> rowLower2 = sortListPositionsLower(rowNumber: 2,seatList: seatList);
    List<Seat> rowLower3 = sortListPositionsLower(rowNumber: 3,seatList: seatList);
    List<Seat> rowLower4 = sortListPositionsLower(rowNumber: 4,seatList: seatList);
    List<Seat> rowLower5 = sortListPositionsLower(rowNumber: 5,seatList: seatList);
    List<Seat> rowLower6 = sortListPositionsLower(rowNumber: 6,seatList: seatList);
    List<Seat> rowLower7 = sortListPositionsLower(rowNumber: 7,seatList: seatList);
    List<Seat> rowLower8 = sortListPositionsLower(rowNumber: 8,seatList: seatList);
    List<Seat> rowLower9 = sortListPositionsLower(rowNumber: 9,seatList: seatList);
    List<Seat> rowLower10 = sortListPositionsLower(rowNumber: 10,seatList: seatList);

    List<Seat> row1LowerSeats = arrangeSeats(rowLower1);
    List<Seat> row2LowerSeats = arrangeSeats(rowLower2);
    List<Seat> row3LowerSeats = arrangeSeats(rowLower3);
    List<Seat> row4LowerSeats = arrangeSeats(rowLower4);
    List<Seat> row5LowerSeats = arrangeSeats(rowLower5);
    List<Seat> row6LowerSeats = arrangeSeats(rowLower6);
    List<Seat> row7LowerSeats = arrangeSeats(rowLower7);
    List<Seat> row8LowerSeats = arrangeSeats(rowLower8);
    List<Seat> row9LowerSeats = arrangeSeats(rowLower9);
    List<Seat> row10LowerSeats = arrangeSeats(rowLower10);

List<Seat> driverList = [emptySeat,emptySeat,emptySeat,emptySeat,emptySeat,emptySeat,emptySeat,emptySeat,emptySeat,driverSeat];

    List<List<Seat>> lowerSeats = [
      driverList,
      row1LowerSeats,
      row2LowerSeats,
      row3LowerSeats,
      row4LowerSeats,
      row5LowerSeats,
      row6LowerSeats,
      row7LowerSeats,
      row8LowerSeats,
      row9LowerSeats,
      row10LowerSeats,
    ];

 return lowerSeats;
}

 List<List<Seat>> generateSeatLayoutUpper(BusModel busModel){
    //  var seats =
    List<Seat> seatList = busModel.seatMap;
    
    List<Seat> rowUpper1 = sortListPositionsUpper(rowNumber: 1,seatList: seatList);
    List<Seat> rowUpper2 = sortListPositionsUpper(rowNumber: 2,seatList: seatList);
    List<Seat> rowUpper3 = sortListPositionsUpper(rowNumber: 3,seatList: seatList);
    List<Seat> rowUpper4 = sortListPositionsUpper(rowNumber: 4,seatList: seatList);
    List<Seat> rowUpper5 = sortListPositionsUpper(rowNumber: 5,seatList: seatList);
    List<Seat> rowUpper6 = sortListPositionsUpper(rowNumber: 6,seatList: seatList);
    List<Seat> rowUpper7 = sortListPositionsUpper(rowNumber: 7,seatList: seatList);
    List<Seat> rowUpper8 = sortListPositionsUpper(rowNumber: 8,seatList: seatList);
    List<Seat> rowUpper9 = sortListPositionsUpper(rowNumber: 9,seatList: seatList);
    List<Seat> rowUpper10 = sortListPositionsUpper(rowNumber: 10,seatList: seatList);

      
    List<Seat> row1UpperSeats = arrangeSeats(rowUpper1);
    List<Seat> row2UpperSeats = arrangeSeats(rowUpper2);
    List<Seat> row3UpperSeats = arrangeSeats(rowUpper3);
    List<Seat> row4UpperSeats = arrangeSeats(rowUpper4);
    List<Seat> row5UpperSeats = arrangeSeats(rowUpper5);
    List<Seat> row6UpperSeats = arrangeSeats(rowUpper6);
    List<Seat> row7UpperSeats = arrangeSeats(rowUpper7);
    List<Seat> row8UpperSeats = arrangeSeats(rowUpper8);
    List<Seat> row9UpperSeats = arrangeSeats(rowUpper9);
    List<Seat> row10UpperSeats = arrangeSeats(rowUpper10);

    List<List<Seat>> upperSeats = [];

   if (row1UpperSeats.isNotEmpty) {
      upperSeats = [
    
      row1UpperSeats,
      row2UpperSeats,
      row3UpperSeats,
      row4UpperSeats,
      row5UpperSeats,
      row6UpperSeats,
      row7UpperSeats,
      row8UpperSeats,
      row9UpperSeats,
      row10UpperSeats,
      ];
}

  return upperSeats;
}


 List<Seat> arrangeSeats(List<Seat> rowDataList){
 List<Seat> _row = [];
 print("<<---------------layout---------------->>");
// print(rowDataList.first.row);
String tempLayout = "";
rowDataList.forEach((element) {
  tempLayout += element.layout;
  // print(element.layout);
});
print(tempLayout);

  if (tempLayout.length > 5) {
   var tempList = [rowDataList[0],emptySeat,emptySeat,emptySeat,rowDataList[1],rowDataList[2],rowDataList[3],rowDataList[4]];

   _row = swapSeatList(tempList);
   } else {
  for (var i = 0; i < rowDataList.length; i++) {
  // List<Widget> _row = [];
      
if (rowDataList[i].width == 1) {
    print('THE WIDTH IS 1 (NORMAL SEAT)');

    if(rowDataList[i].length == 1){
    print("The seat is seater type");

    if(rowDataList[i].layout == "1"){
      _row.add(rowDataList[i]);
    }else if(rowDataList[i].layout == "10"){
      _row.add(rowDataList[i]);
      _row.add(emptySeat);
    }else if(rowDataList[i].layout == "01"){
      _row.add(emptySeat);
      _row.add(rowDataList[i]);
    }else if(rowDataList[i].layout == "001"){
      _row.add(emptySeat);
      _row.add(emptySeat);
      _row.add(rowDataList[i]);
    }else if(rowDataList[i].layout == "100"){
      _row.add(rowDataList[i]);
      _row.add(emptySeat);
      _row.add(emptySeat);
    }else if(rowDataList[i].layout == "11"){
      print("--:::::::::::::::::::::::--------------------------------::::::::::::::::::::::--------------------------::::::::::::");
      _row.add(emptySeat);
      _row.add(rowDataList[i]);
    }else{
      _row.add(rowDataList[i]);
    }
  } else{
       print("The seat is sleeper type");
     if(rowDataList[i].layout == "1"){
      _row.add(rowDataList[i]);
    }else if(rowDataList[i].layout == "10"){
      _row.add(rowDataList[i]);
      _row.add(emptySeat);
    }else if(rowDataList[i].layout == "01"){
      _row.add(emptySeat);
      _row.add(rowDataList[i]);
    }else if(rowDataList[i].layout == "001"){
      _row.add(emptySeat);
      _row.add(emptySeat);
      _row.add(rowDataList[i]);
    }else if(rowDataList[i].layout == "100"){
      _row.add(emptySeat);
      _row.add(emptySeat);
      _row.add(rowDataList[i]);
    }else{
       _row.add(rowDataList[i]);
    }
  }    
} else {
      _row.add(emptySeat);
      _row.add(rowDataList[i]);
 }
  }
}



// print("Widget list ${_row.length}");

  return _row;
  }
      

        

 //for sorting the seats based on 
 List<Seat> sortListPositionsLower({required List<Seat> seatList,required int rowNumber}){

  List<Seat> rowData = [];
     
  for(int i = 0; i< seatList.length; i++){
    if(int.parse(seatList[i].rowNo) == rowNumber && seatList[i].position.trim().toLowerCase() == "lower".toLowerCase()){
       rowData.add(seatList[i]);
    }
  }
  
   rowData.sort((a, b) => a.layoutId.compareTo(b.layoutId));

  //  print("Lower--------------->>Row $rowNumber length ${rowData.length}");

   return rowData;
  }

  List<Seat> sortListPositionsUpper({required List<Seat> seatList,required int rowNumber }){

  List<Seat> rowData = [];
     
  for(int i = 0; i< seatList.length; i++){
    if(int.parse(seatList[i].rowNo) == rowNumber && seatList[i].position.toLowerCase() == "Upper".toLowerCase()){
       rowData.add(seatList[i]);
    }
  }
  
   rowData.sort((a, b) => a.layoutId.compareTo(b.layoutId));
//  print("Upper--------------->>Row $rowNumber length ${rowData.length}");
   return rowData;
  }





 swapSeatList(List<Seat> test) {
  List<Seat> swapedList = [];
  for(int k = 0; k < test.length;k++){
    if(k == 4){
       swapedList.add(test[k+1]);
       swapedList.add(test[k]);
       swapedList.add(test[k+2]);
       break;
    }else{
      swapedList.add(test[k]);
    }
  }
  return swapedList;
 }



  getSeatbySeatData(Seat seatSata){
    if(seatSata.length == 1 && seatSata.width == 1){
      return seater;
    }

  }




    
}
