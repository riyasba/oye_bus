import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/api_provider/bus_api_service/bus_list_api_service.dart';
import 'package:oye_bus/app/data/api_service/api_provider/check_pnr_api_service.dart';
import 'package:oye_bus/app/data/api_service/api_provider/filter_api_service/filter_api_service.dart';
import 'package:oye_bus/app/data/api_service/models/bus_model/buslist_model.dart';
import 'package:oye_bus/app/data/api_service/models/bus_model/check_pnr_model.dart';
import 'package:oye_bus/app/data/api_service/models/offers_models.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bus_list/views/bus_list_view.dart';
import 'package:oye_bus/app/modules/screens/notification/controllers/notification_controller.dart';
import 'package:oye_bus/app/modules/screens/profile/controllers/profile_controller.dart';
import 'package:oye_bus/app/modules/screens/search/controllers/search_controller.dart';
import 'package:oye_bus/app/routes/app_pages.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
 RxBool isLoading = false.obs;
 RxInt fromcityId = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _initializeDatabase();
    Get.put(NotificationController());
    Get.find<ProfileController>().getprofile();
    Get.find<BusSearchController>().getBoardingDestinations();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

   TabController? tabBarcontroller ;

  var fromPlaceTxtController = TextEditingController();
  var toPlaceTxtController = TextEditingController();
  var pnrController = TextEditingController(); 

  RxBool isAcBusOnly = false.obs;
 

  List<OffersModel> offersList = [
    OffersModel(
        image: "assets/home_page/bus_offer_image.png",
        buttonName: "FIRST",
        title: "Save up to Rs.250 on bus tickets",
        validity: "30 Nov"),
    OffersModel(
        image: "assets/home_page/bus_offers2.png",
        buttonName: "SUPERHIT",
        title: "10% instant discount up to Rs.100",
        validity: "20 Nov"),
    OffersModel(
        image: "assets/home_page/bus_offer_image.png",
        buttonName: "FIRST",
        title: "Save up to Rs.250 on bus tickets",
        validity: "30 Nov"),
    OffersModel(
        image: "assets/home_page/bus_offers2.png",
        buttonName: "SUPERHIT",
        title: "10% instant discount up to Rs.100",
        validity: "20 Nov"),
  ];

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(), // Set the starting date for the picker
      lastDate: DateTime(2101), // Set the ending date for the picker
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      update();
    }
  }

  DateTime selectedDate = DateTime.now();

  ulta() {
    String fromPlace = fromPlaceTxtController.text;
    String toPlace = toPlaceTxtController.text;


    fromPlaceTxtController.text = toPlace;
    toPlaceTxtController.text = fromPlace;
    fromcityid = toPlace;
    tocityid = fromPlace;
    fromCity = toPlace;
    toCity = fromPlace;

    update();
  }
dynamic fromcityid=0;
dynamic tocityid=0;

String fromCity = "";
String toCity = "";

var cityid=0;
  RxInt currenttap = 1.obs;
  void ontapindex(int currentontouchindex) {
    currenttap(currentontouchindex);
  }

  BusListApiService buslistapiservice = BusListApiService();
  List<BusData>busdata=[];

  BusData? selectedBusData;
   
   RxString selectedBookingDate="".obs;
   RxString boardinglocation =''.obs;
   RxString destinationlocation =''.obs;
  getbuslist({
    required String boardingname,
    required String destinationname,
    required String date})async{  
     selectedBookingDate(date);
     boardinglocation(boardingname);
     destinationlocation(destinationname);
     Get.to(() => BusListView());
      isLoading(true);
      dio.Response<dynamic>response = await buslistapiservice.buslistapi(
        boardingname: boardingname, 
        destinationname: destinationname, 
        date: date);
         print('statuscode::::::::::::::');
         print(response.statusCode);
         print('datas::::::::::::::::::');
         print(response.data["status"]==true);
         isLoading(false);
         if(response.data['status'] == true){ 
          print("----------->> here");
          BusListModel buslistModel = BusListModel.fromJson(response.data);
          busdata=buslistModel.data;
          update();
        
         
      
      }else{
        busdata.clear();
        update();
        Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
      }
    
    }

 FilterApiService filterapiservice = FilterApiService();
  
    
  getFilter({
    required String boardingname,
    required String destinationname,
    required String date,
    String? busType,
    String?acornonac, 
    String?amenities,
    String?busname,
    String? depaturetime,
    String? priceorder})async{
    isLoading(true);
    dio.Response<dynamic>response = await filterapiservice.filterApi(
      boardingname: boardingname, 
      destinationname: destinationname, 
      busType: busType,
      acornonac: acornonac,
      amenities: amenities,busname: busname,
       priceorder: priceorder,
      depaturetime:depaturetime ,
      date: date);
             isLoading(false);
         if(response.data['status'] == true){ 
          print("----------->> here");
          BusListModel buslistModel = BusListModel.fromJson(response.data);
          busdata=buslistModel.data;
          
          update(); 
          Get.back();
      }else{
        Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
      }
        
  }
    //checkpnrnumber

    CheckPnrApiService checkpnrapiservice = CheckPnrApiService();

    List<PnrData?> checkpnrdata =[];

    checkPnrstatus({required String pnrnumber})async{
      isLoading(true);
      dio.Response<dynamic>response = await checkpnrapiservice.checkPnrApi(pnrnumber: pnrnumber);
      isLoading(false);
      if(response.data['status']==true){
        CheckPnrModel checkPnrModel = CheckPnrModel.fromJson(response.data);
        checkpnrdata.add(checkPnrModel.data);
        Get.toNamed(Routes.PNR_STATUSVIEW);
         Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
         update();
      }else{
        Get.rawSnackbar( 
          backgroundColor: Colors.red,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
      } 
    }
 




   void _initializeDatabase() async {
    // Initialize your database here
    // Example:
    final database = openDatabase(
      path.join(await getDatabasesPath(), 'your_database_name.db'), // Fully qualify join
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE boarding_destinations(id INTEGER PRIMARY KEY, boardingName TEXT, destinationName TEXT)"
        );
      },
      version: 1,
    );
  }





}
