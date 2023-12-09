import 'package:get/get.dart';

class BusseatmapingController extends GetxController {
  //TODO: Implement BusseatmapingController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  RxInt current = 0.obs;
  RxInt currentbording = 1.obs;

  int get index1 => current.value;
 // int get index3 => currentbording.value;

  void setIndex(int currentIndex) {
    current(currentIndex);
  }

  void dropingIndex(int currentbordingindex) {
    currentbording(currentbordingindex);
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
