import 'package:get/get.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bookinghistory/controllers/bookinghistory_controller.dart';

class BookingCancellationController extends GetxController {
  //TODO: Implement BookingCancellationController

  final count = 0.obs;
    RxBool ischeck = false.obs;
     final bookingCancelledlistController = Get.find<BookinghistoryController>();
  @override
  void onInit() {
    ischeck;
    bookingCancelledlistController.bookingCancelledList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
