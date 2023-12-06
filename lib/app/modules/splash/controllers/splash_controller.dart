import 'package:get/get.dart';
import 'package:oye_bus/app/routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

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
       Routes.LOCATION,
   //   Routes.BOTTUMNAVIGATION,
      (route) => false,
    );
  }

  void increment() => count.value++;
}
