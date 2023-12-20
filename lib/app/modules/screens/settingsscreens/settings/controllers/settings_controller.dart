// Inside SettingsController

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SettingsController extends GetxController {
  final count = 0.obs;

  final index = Rx<int?>(null);
  int? get selectedIndex => index.value;

  void setIndex(int currentIndex) {
    index.value = currentIndex;
  }

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

  final isontouch = true.obs;
  final isontouchcurrency = true.obs;
  final islanguage= true.obs;
    final isdeletacount= true.obs;

  void increment() => count.value++;

    var subjectController= TextEditingController();
   var feedbackController= TextEditingController();
}
