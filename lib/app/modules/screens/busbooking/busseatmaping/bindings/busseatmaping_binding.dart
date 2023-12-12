import 'package:get/get.dart';

import '../controllers/busseatmaping_controller.dart';

class BusseatmapingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusseatmapingController>(
      () => BusseatmapingController(),
    );
  }
}
