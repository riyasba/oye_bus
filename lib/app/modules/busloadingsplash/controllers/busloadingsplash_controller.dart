import 'package:get/get.dart';
import 'package:oye_bus/app/routes/app_pages.dart';

class BusloadingsplashController extends GetxController {
  //TODO: Implement BusloadingsplashController

  final count = 0.obs;
  @override
  void onInit() {
    toHomePageMember();
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

  toHomePageMember() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offNamedUntil(
      //     Routes.LOCATION,
      Routes.BOTTUMNAVIGATION,
      (route) => false,
    );
  }

  void increment() => count.value++;
}
