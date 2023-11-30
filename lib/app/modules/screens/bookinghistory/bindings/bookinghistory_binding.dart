import 'package:get/get.dart';

import '../controllers/bookinghistory_controller.dart';

class BookinghistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookinghistoryController>(
      () => BookinghistoryController(),
    );
  }
}
