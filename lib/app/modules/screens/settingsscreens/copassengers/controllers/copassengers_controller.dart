import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/api_provider/passengers/add_co_passengers_api_service.dart';
import 'package:oye_bus/app/data/api_service/api_provider/passengers/co_passengers_api_service.dart';
import 'package:oye_bus/app/data/api_service/api_provider/passengers/delete_co_passengers_api_service.dart';
import 'package:oye_bus/app/data/api_service/models/passengers/add_copassengers_model.dart';
import 'package:dio/dio.dart'as dio;
import 'package:oye_bus/app/data/api_service/models/passengers/co_passangers_model.dart';

class CopassengersController extends GetxController {
  //TODO: Implement CopassengersController

  final count = 0.obs;
  RxBool isLoading = false.obs;
   var dropdownvalue;
  @override
  void onInit() {
   chosenValue;
    setDefault();
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
  var chosenValue;

  List<String> genderlist =['Male','Female'];

  setDefault()async{
   
    WidgetsBinding.instance.addPostFrameCallback((_) async{ 
       await copassangers();
       print('copassangers data');
       print(passengersdata);
       if(passengersdata.isNotEmpty){
        nameController.text= passengersdata.first.name;
        ageController.text = passengersdata.first.age;
        genderController.text = passengersdata.first.gender;

       }
       update();
    });
   
  }
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var genderController = TextEditingController();

  //copassengers
  CopassengersApiService copassengersApiService = 
  CopassengersApiService();
  List<PassangersData> passengersdata=[];

  copassangers()async{
    isLoading(true);
    passengersdata.clear();
    dio.Response<dynamic> response= await copassengersApiService.copassengersApi();
    isLoading(false);
    if(response.data['status']==true){
      CoPassangersModel coPassangersModel = CoPassangersModel.fromJson(response.data);
      passengersdata=coPassangersModel.data;
      update();
    }
    else{

    }

  }
  //addcopassengers
   AddCoPassangersApiService addcopassangersapiservice =
   AddCoPassangersApiService();

   addCopassangers ({
    required AddCoPassangersModel addCoPassangersModel})async{
  
    isLoading(true);
    dio.Response<dynamic>response = await addcopassangersapiservice.addCoPassangersApi(
      addCoPassangersModel: addCoPassangersModel);
      
      isLoading(false);
      if(response.data['status']==true){
        Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            response.data['message'],
            style: primaryFont.copyWith(color: Colors.white),
          ));
      }
      copassangers();
      update();

   }

   //deletepassengers

   DeletePassengersApiService deletePassengersApiService =
   DeletePassengersApiService();

   deletepassenger({required String passengerid})async{
    isLoading(true);
    dio.Response<dynamic>response = await deletePassengersApiService.deletePassengersApi(
      passengerId: passengerid);

      isLoading(false);
      if(response.data['status']==true){
         Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
          copassangers();
          update();
      }else{
         Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
      }
      update();
   }

}
