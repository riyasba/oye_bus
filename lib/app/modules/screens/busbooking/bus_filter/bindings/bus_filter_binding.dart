import 'package:get/get.dart';

import '../controllers/bus_filter_controller.dart';

class BusFilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusFilterController>(
      () => BusFilterController(),
    );
  }
}
