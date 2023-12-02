import 'package:get/get.dart';

import '../controllers/ticket_cancellation_controller.dart';

class TicketCancellationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicketCancellationController>(
      () => TicketCancellationController(),
    );
  }
}
