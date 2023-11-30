import 'package:get/get.dart';

import '../controllers/busloadingsplash_controller.dart';

class BusloadingsplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusloadingsplashController>(
      () => BusloadingsplashController(),
    );
  }
}
