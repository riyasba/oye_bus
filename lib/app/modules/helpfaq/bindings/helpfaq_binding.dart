import 'package:get/get.dart';

import '../controllers/helpfaq_controller.dart';

class HelpfaqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpfaqController>(
      () => HelpfaqController(),
    );
  }
}
