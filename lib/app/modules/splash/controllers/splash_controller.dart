

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
   checkForAuth();
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
 checkForAuth() async {
    final prefs = await SharedPreferences.getInstance();
    String? authtoken = prefs.getString("auth_token");
    //String? role = prefs.getString("role");
    print("Token is here");
    print(authtoken);
    if (authtoken == "null" || authtoken == null) {
    Get.toNamed(Routes.ONBORDING);
    } else {
      Get.toNamed( Routes.BOTTUMNAVIGATION,);
    }
  }
  // toHomePageMember() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Get.offNamedUntil(
  //      Routes.LOCATION,
  //  //   Routes.BOTTUMNAVIGATION,
  //     (route) => false,
  //   );
  // }

  void increment() => count.value++;
}
