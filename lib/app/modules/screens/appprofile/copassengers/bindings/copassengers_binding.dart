import 'package:get/get.dart';

import '../controllers/copassengers_controller.dart';

class CopassengersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CopassengersController>(
      () => CopassengersController(),
    );
  }
}
