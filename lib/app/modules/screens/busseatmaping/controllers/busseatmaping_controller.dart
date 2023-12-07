import 'package:get/get.dart';

class BusseatmapingController extends GetxController {
  //TODO: Implement BusseatmapingController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }




  
 RxInt current = 0.obs;


  int get index1 => current.value;


  void setIndex(int currentIndex) {
    current(currentIndex);
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
