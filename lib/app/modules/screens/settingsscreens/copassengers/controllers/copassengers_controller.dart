import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CopassengersController extends GetxController {
  //TODO: Implement CopassengersController

  final count = 0.obs;
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
  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var ageController = TextEditingController();
  var genderController = TextEditingController();
}
