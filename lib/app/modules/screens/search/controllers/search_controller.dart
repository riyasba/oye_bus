import 'package:dio/dio.dart'as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/data/api_service/api_provider/bus_api_service/bus_city_search_api_service.dart';
import 'package:oye_bus/app/data/api_service/models/bus_city_search_model.dart';

class BusSearchController extends GetxController {
  //TODO: Implement SearchController

  final count = 0.obs;
  RxBool isLoading =false.obs;
   

  @override
  void onInit() {
    super.onInit();
    searchfromcontroller.addListener(triggerFunction);
    searchtoController.addListener(triggerFunction);
     
  }


  triggerFunction(){
    buscitysearch(city: searchfromcontroller.text);
    buscitysearch(city: searchtoController.text);
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
