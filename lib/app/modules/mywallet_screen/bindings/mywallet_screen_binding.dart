import 'package:get/get.dart';

import '../controllers/mywallet_screen_controller.dart';

class MywalletScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MywalletScreenController>(
      () => MywalletScreenController(),
    );
  }
}
