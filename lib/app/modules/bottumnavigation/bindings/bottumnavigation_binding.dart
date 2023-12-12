import 'package:get/get.dart';

import '../controllers/bottumnavigation_controller.dart';

class BottumnavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottumnavigationController>(
      () => BottumnavigationController(),
    );
  }
}
