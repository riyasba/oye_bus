import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/models/offers_models.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

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

  var fromPlaceTxtController = TextEditingController();
  var toPlaceTxtController = TextEditingController();

  RxBool isAcBusOnly = false.obs;

  List<OffersModel> offersList = [
    OffersModel(image: "assets/home_page/bus_offer_image.png",buttonName: "FIRST",title: "Save up to Rs.250 on bus tickets",validity: "30 Nov"),
    OffersModel(image: "assets/home_page/bus_offers2.png",buttonName: "SUPERHIT",title: "10% instant discount up to Rs.100",validity: "20 Nov"),
 OffersModel(image: "assets/home_page/bus_offer_image.png",buttonName: "FIRST",title: "Save up to Rs.250 on bus tickets",validity: "30 Nov"),
    OffersModel(image: "assets/home_page/bus_offers2.png",buttonName: "SUPERHIT",title: "10% instant discount up to Rs.100",validity: "20 Nov"),
  ];


   
  
  ulta() {

    String fromPlace = fromPlaceTxtController.text;
    String toPlace = toPlaceTxtController.text;


    fromPlaceTxtController.text = toPlace;
    toPlaceTxtController.text = fromPlace;

    
   update();
  }
}
