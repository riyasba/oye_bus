// Inside SettingsController

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SettingsController extends GetxController {
  final count = 0.obs;

  final _index = Rx<int?>(null);
  int? get selectedIndex => _index.value;

  void setIndex(int currentIndex) {
    _index.value = currentIndex;
  }

  @override
  void onInit() {
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

  final isontouch = false.obs;

  void increment() => count.value++;
}
