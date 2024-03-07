import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:oye_bus/app/modules/authentication/login/controllers/login_controller.dart';
import 'package:oye_bus/app/modules/authentication/otp/controllers/otp_controller.dart';
import 'package:oye_bus/app/modules/bottumnavigation/controllers/bottumnavigation_controller.dart';
import 'package:oye_bus/app/modules/guestlogin_view/controllers/guestlogin_view_controller.dart';
import 'package:oye_bus/app/modules/guestotp/controllers/guestotp_controller.dart';
import 'package:oye_bus/app/modules/home/controllers/home_controller.dart';
import 'package:oye_bus/app/modules/onbording/controllers/onbording_controller.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bookinghistory/controllers/bookinghistory_controller.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/controllers/busseatmaping_controller.dart';
import 'package:oye_bus/app/modules/screens/offers/controllers/offers_controller.dart';
import 'package:oye_bus/app/modules/screens/passenger_info/controllers/passenger_info_controller.dart';
import 'package:oye_bus/app/modules/screens/profile/controllers/profile_controller.dart';
import 'package:oye_bus/app/modules/screens/search/controllers/search_controller.dart';
import 'package:oye_bus/app/modules/screens/settingsscreens/copassengers/controllers/copassengers_controller.dart';
import 'package:oye_bus/app/modules/screens/settingsscreens/settings/controllers/settings_controller.dart';
import 'package:oye_bus/app/modules/screens/ticket_details/controllers/ticket_details_controller.dart';
import 'package:oye_bus/app/routes/app_pages.dart';


void main() {
   Get.put(LoginController());
   Get.put(OtpController());
   Get.put(BusseatmapingController());
   Get.put(ProfileController());
   Get.put(SettingsController());
   Get.put(OnbordingController());
   Get.put(OffersController());
   Get.put(BottumnavigationController());
   Get.put(CopassengersController());
   Get.put(PassengerInfoController());
   Get.put(BusSearchController());
   Get.put(BookinghistoryController());
   Get.put(TicketDetailsController());
   Get.put(GuestloginViewController());
   Get.put(GuestotpController());
   Get.put(HomeController());

  // Get.put(dynamic());
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
