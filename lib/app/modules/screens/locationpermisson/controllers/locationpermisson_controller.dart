import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:oye_bus/app/routes/app_pages.dart';

class LocationpermissonController extends GetxController {
    final Location location = Location();

  PermissionStatus? permissionGranted;
  //TODO: Implement LocationpermissonController

  final count = 0.obs;
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
  Future<void> requestPermission() async {
    if (permissionGranted != PermissionStatus.granted) {
      final permissionRequestedResult = await location.requestPermission();
      
        permissionGranted = permissionRequestedResult;
    
    }
     Get.offAllNamed(
                    Routes.BUSLOADINGSPLASH,
                  );
  }





  void increment() => count.value++;
}
