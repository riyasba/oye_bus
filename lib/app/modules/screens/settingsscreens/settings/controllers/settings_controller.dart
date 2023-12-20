
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:oye_bus/app/modules/authentication/login/views/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  final count = 0.obs;

  final index = Rx<int?>(null);
  int? get selectedIndex => index.value;

  void setIndex(int currentIndex) {
    index.value = currentIndex;
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

  final isontouch = true.obs;
  final isontouchcurrency = true.obs;
  final islanguage = true.obs;
  final isdeletacount = true.obs;

  void increment() => count.value++;
  logout() async {
    final prefs = await SharedPreferences.getInstance();
  await  prefs.setString("auth_token", "null");
    Get.offAll(LoginView());
  }
}
