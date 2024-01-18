import 'dart:async';

import 'package:dio/dio.dart'as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/data/api_service/api_provider/bus_api_service/bus_city_search_api_service.dart';
import 'package:oye_bus/app/data/api_service/models/bus_city_search_model.dart';

class BusSearchController extends GetxController {
  //TODO: Implement SearchController

  final count = 0.obs;
  RxBool isLoading =false.obs;
   

  // Define a debouncer
  Timer? _debounce;

  // Function to debounce city search
  void debounceCitySearch(String city) async {
    

    await Future.delayed(Duration(microseconds: 100));
      buscitysearch(city: city);
    
  }  

  @override
  void onInit() {
    super.onInit();
    
    searchfromcontroller.addListener(triggerFunction2);
    searchtoController.addListener(triggerFunction);
     
  }



  triggerFunction(){
    debounceCitySearch( searchtoController.text);
  }

  triggerFunction2(){
    debounceCitySearch( searchfromcontroller.text);
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
  late final AnimationController _controller;
  var searchfromcontroller = TextEditingController();
  var searchtoController = TextEditingController();

 BusCitySearchApiService busCitySearchApiService = 
 BusCitySearchApiService();

 List<CityData> citydata=[];
 buscitysearch({required String city})async{

  isLoading(true);
  dio.Response<dynamic>response = await busCitySearchApiService.
  buscitySearchApi(city: city);
   
   isLoading(false);
   if(response.data['status']==true){
    CitySearchModel citySearchModel = CitySearchModel.fromJson(response.data);
    citydata= citySearchModel.data;
    update();
   }
 }

}
