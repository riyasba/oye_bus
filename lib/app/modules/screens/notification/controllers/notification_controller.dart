import 'package:get/get.dart';

class NotificationController extends GetxController {
  //TODO: Implement NotificationController
   RxInt containerindex=0.obs;
  final count = 0.obs;

 RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
   setDefault();
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
  setDefault() async{
    isLoading(false);
    await Future.delayed(Duration(seconds: 5));
      isLoading(true);
  }
}
