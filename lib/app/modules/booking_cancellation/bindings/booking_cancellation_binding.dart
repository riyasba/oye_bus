import 'package:get/get.dart';

import '../controllers/booking_cancellation_controller.dart';

class BookingCancellationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingCancellationController>(
      () => BookingCancellationController(),
    );
  }
}
