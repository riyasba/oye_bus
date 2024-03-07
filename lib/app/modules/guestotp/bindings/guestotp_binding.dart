import 'package:get/get.dart';

import '../controllers/guestotp_controller.dart';

class GuestotpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuestotpController>(
      () => GuestotpController(),
    );
  }
}
