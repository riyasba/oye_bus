import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/data/api_service/api_provider/booking_api_service/booking_history_api_service.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/booking_history_model.dart';
import 'package:oye_bus/app/modules/screens/profile/views/profile_view.dart';

import 'package:oye_bus/app/modules/screens/busbooking/bookinghistory/views/bookinghistory_view.dart';
import 'package:oye_bus/app/modules/home/views/home_view.dart';
import 'package:oye_bus/app/modules/screens/notification/controllers/notification_controller.dart';
import 'package:oye_bus/app/modules/screens/offers/views/offers_view.dart';


class BottumnavigationController extends GetxController {


  final _currrentIndex = 0.obs;
  
  final _screens = Rx<List<Widget>>([
    // BusseatmapingView(),
      HomeView(),
    OffersView(),
    BookinghistoryView(),
    ProfileView(),
                           
                          
    //  HomeView(),
  ]);

  final _bottomNavIconsList = Rx<List<String>>([
    "assets/bottom_nav_icons/home_page_icon.svg",
    "assets/bottom_nav_icons/offers_icon.svg",
    "assets/bottom_nav_icons/booking_history_icon.svg",
    "assets/bottom_nav_icons/profile_icon.svg",
  ]);

  //  SvgPicture.asset("assets/bottom_nav_icons/home_page_icon.svg") ,

  int get currentIndex => _currrentIndex.value;
  List<Widget> get screens => _screens.value;
  List<String> get iconsList => _bottomNavIconsList.value;

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

  void setIndex(int index) {
    _currrentIndex.value = index;
  }

  
}
