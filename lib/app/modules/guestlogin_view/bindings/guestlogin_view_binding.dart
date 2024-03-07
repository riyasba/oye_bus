import 'package:get/get.dart';

import '../controllers/guestlogin_view_controller.dart';

class GuestloginViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuestloginViewController>(
      () => GuestloginViewController(),
    );
  }
}
