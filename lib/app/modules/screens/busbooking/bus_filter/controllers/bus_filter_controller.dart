import 'package:dio/dio.dart'as dio;
import 'package:get/get.dart';

import 'package:oye_bus/app/data/api_service/api_provider/filter_api_service/filter_api_service.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/booking_canceled_list_model.dart';
import 'package:oye_bus/app/data/api_service/models/bus_model/buslist_model.dart';

class BusFilterController extends GetxController {
  //TODO: Implement BusFilterController

  final count = 0.obs;
    final colorindex = 0.obs;
    RxBool isLoading = false.obs;
    RxBool checkbox1= false.obs;
    RxBool checkbox2= false.obs;
    RxBool checkbox3= false.obs;
    RxBool checkbox4= false.obs;
    RxBool checkbox5= false.obs;
    RxBool depatcheck1 = false.obs;
    RxBool depatcheck2 = false.obs;
    RxBool depatcheck3 = false.obs;
    RxBool depatcheck4 = false.obs;
    RxBool bustypecheck1=false.obs;
    RxBool bustypecheck2=false.obs;
    RxBool bustypecheck3=false.obs;
    RxBool bustypecheck4=false.obs;

    RxBool singlewindcheck=false.obs;

    RxInt dropcheckindex = 0.obs;
    RxInt bordingcheckindex = 0.obs;
    RxInt operatorcheckindex = 0.obs;
    RxInt facilitiescheckindex = 0.obs;
     RxInt featurescheckindex = 0.obs;
     RxInt busarriavlatdestinationcheckindex = 0.obs;
  List dropinglist  =[
    'Bengaluru',
    'Electronic City',
    'Hosur',
    'Krishnagri',
    'Amabur ',
    'Vellore Bus Stand',
    'Poonamalle',
    'Maduravoyal',
    'Koyambedu',
    'Egmore',
    'Central Railway Station',
    'Ashok Pillar',
    'Adyar'
  ];
    List bordinglist  =[
    'Adyar',
    'Ashok Pillar',
    'Central Railway Station',
    'Egmore',
    'Koyambedu',
    'Maduravoyal',
    'Poonamalle',
    'Vellore Bus Stand',
    'Amabur ',
    'Krishnagri',
    'Hosur',
    'Electronic City',
    'Bengaluru'
  ];
      List operatorlist  =[
    'Anand Travels',
    'Alaguthangam Travels',
    'Asian Travels',
    'Bharathi Travels',
    'DLT Bus',
    'Dream Line Travels',
    'GEE PEE Travels',
    'GO Link',
    'Gokualm Travels',
    'Mp Travels',
    'Wasim Travels',
    'Ezhil Travesl',
    'Anas Travesl'
  ];
   List facilitieslist  =[
    'Track My Bus',
    'Toilet',
    'Water Bottle',
    'Blankets',
    'Bed Sheet',
    'Charging Point',
    'Movie',
    'Wifi',
    'Emergency Contact Number'
  ];
   List featureslist  =[
    'Live Tracking',
    'Primo Bus',
    'High Rated Buses',
 
  ];
  List busarraivaltimelist  =[
    '06:00 - 12:00',
    '12:00 - 18:00',
    '18:00 - 24:00',
    '00:00 - 06:00'
 
  ];
  List busdestinationlist = [
    'Morning',
    'Afternoon',
    'Evening',
    'Night'
  ];
  List busarraivalatdestinationicon = [
    'assets/offers_icon/depatureicon1.png',
     'assets/offers_icon/depatureicon2.png',
     'assets/offers_icon/depatureicon3.png',
     'assets/offers_icon/depatureicon4.png'
  ];
  List facilitiesiconlist = [
    'assets/offers_icon/bustracicon.png',
    'assets/offers_icon/bustoileticon.png',
    'assets/offers_icon/buswaterbottleicon.png',
    'assets/offers_icon/busblanketiocn.png',
    'assets/offers_icon/busbedsheeticon.png',
    'assets/offers_icon/buschargingpointicon.png',
    'assets/offers_icon/busmovieicon.png',
    'assets/offers_icon/buswifiicon.png',
    'assets/offers_icon/busemergencycallicon.png'
  ];
  List featureiconlist = [
    'assets/offers_icon/busfeatureslivetrackicon.png',
     'assets/offers_icon/busfeaturesprimobusicon.png',
    'assets/offers_icon/busfeaturesbusratedicon.png'
  ];
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

 FilterApiService filterapiservice = FilterApiService();
  
}
