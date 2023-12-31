import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:oye_bus/app/modules/authentication/login/controllers/login_controller.dart';
import 'package:oye_bus/app/modules/authentication/otp/controllers/otp_controller.dart';
import 'package:oye_bus/app/modules/onbording/controllers/onbording_controller.dart';
import 'package:oye_bus/app/modules/screens/offers/controllers/offers_controller.dart';
import 'package:oye_bus/app/modules/screens/profile/controllers/profile_controller.dart';
import 'package:oye_bus/app/modules/screens/settingsscreens/settings/controllers/settings_controller.dart';
import 'package:oye_bus/app/routes/app_pages.dart';
void main() {
  Get.put(LoginController());
  Get.put(OtpController());
  Get.put(ProfileController());
  Get.put(SettingsController());
   Get.put(OnbordingController());
   Get.put(OffersController());
  // runApp(DevicePreview(
  //   builder: (context) => MyApp(), // Wrap your app
  // ));
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        360,
        690,
      ),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    );
  }
}
