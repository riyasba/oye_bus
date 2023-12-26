import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/data/api_service/models/offers_models.dart';
import 'package:oye_bus/app/modules/screens/notification/controllers/notification_controller.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  @override
  void onInit() {
    super.onInit();
    Get.put(NotificationController());
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
      firstDate: DateTime(2000), // Set the starting date for the picker
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

    update();
  }

  RxInt currenttap = 1.obs;
  void ontapindex(int currentontouchindex) {
    currenttap(currentontouchindex);
  }
}
