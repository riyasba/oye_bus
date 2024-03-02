import 'package:get/get.dart';

import '../controllers/pnr_statusview_controller.dart';

class PnrStatusviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PnrStatusviewController>(
      () => PnrStatusviewController(),
    );
  }
}
