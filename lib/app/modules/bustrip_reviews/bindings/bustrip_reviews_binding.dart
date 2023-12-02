import 'package:get/get.dart';

import '../controllers/bustrip_reviews_controller.dart';

class BustripReviewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BustripReviewsController>(
      () => BustripReviewsController(),
    );
  }
}
