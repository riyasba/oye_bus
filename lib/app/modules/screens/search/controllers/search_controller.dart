import 'dart:async';

import 'package:dio/dio.dart'as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/data/api_service/api_provider/bus_api_service/bus_city_search_api_service.dart';
import 'package:oye_bus/app/data/api_service/models/bus_city_search_model.dart';
import 'package:oye_bus/app/data/local_data/sqflite_data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class BusSearchController extends GetxController {
  //TODO: Implement SearchController

  final count = 0.obs;
  RxBool isLoading =false.obs;
   

  // Define a debouncer
  Timer? _debounce;

  // Function to debounce city search
  void debounceCitySearch(String city) async {
    
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
  dio.Response<dynamic> response = await busCitySearchApiService.
  buscitySearchApi(city: city);
   
   isLoading(false);
   if(response.data['status'] == true){
    CitySearchModel citySearchModel = CitySearchModel.fromJson(response.data);
    citydata = citySearchModel.data;
    update();
   }else{
    citydata.clear();
    update();
   }
 }







 List<BoardingDestination> boardingDestinations = [];

 

  Future<void> getBoardingDestinations() async {
    final Database database = await openDatabase(
          path.  join(await getDatabasesPath(), 'your_database_name.db'),
    );

    final List<Map<String, dynamic>> maps = await database.query('boarding_destinations');


    print("Get destinations-------->>");
    print(maps.length);

   
   // setState(() {
      boardingDestinations = List.generate(
        maps.length,
        (index) {
          return BoardingDestination(
            boardingName: maps[index]['boardingName'],
            destinationName: maps[index]['destinationName'],
          );
        },
      );
   // });

   update();
  }

}
