import 'package:get/get.dart';

import '../controllers/bus_list_controller.dart';

class BusListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusListController>(
      () => BusListController(),
    );
  }
}
