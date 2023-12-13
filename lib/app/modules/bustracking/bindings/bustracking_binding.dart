import 'package:get/get.dart';

import '../controllers/bustracking_controller.dart';

class BustrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BustrackingController>(
      () => BustrackingController(),
    );
  }
}
