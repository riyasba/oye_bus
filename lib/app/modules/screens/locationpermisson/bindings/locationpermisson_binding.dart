import 'package:get/get.dart';

import '../controllers/locationpermisson_controller.dart';

class LocationpermissonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationpermissonController>(
      () => LocationpermissonController(),
    );
  }
}
