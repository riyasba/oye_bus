import 'package:get/get.dart';

import '../controllers/referfriends_controller.dart';

class ReferfriendsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReferfriendsController>(
      () => ReferfriendsController(),
    );
  }
}
