import 'package:get/get.dart';

class PassengerInfoController extends GetxController {
  //TODO: Implement PassengerInfoController

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

  RxBool isWhatsappSend = true.obs;

  RxBool iHaveGstNumber = false.obs;



}
