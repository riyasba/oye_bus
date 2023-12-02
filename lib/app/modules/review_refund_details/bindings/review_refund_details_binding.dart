import 'package:get/get.dart';

import '../controllers/review_refund_details_controller.dart';

class ReviewRefundDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewRefundDetailsController>(
      () => ReviewRefundDetailsController(),
    );
  }
}
