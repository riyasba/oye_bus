import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
import 'package:oye_bus/app/modules/screens/notification/views/firebase_notification.dart';
import 'package:oye_bus/app/modules/screens/offers/controllers/offers_controller.dart';
import 'package:oye_bus/app/modules/screens/passenger_info/controllers/passenger_info_controller.dart';
import 'package:oye_bus/app/modules/screens/profile/controllers/profile_controller.dart';
import 'package:oye_bus/app/modules/screens/search/controllers/search_controller.dart';
import 'package:oye_bus/app/modules/screens/settingsscreens/copassengers/controllers/copassengers_controller.dart';
import 'package:oye_bus/app/modules/screens/settingsscreens/settings/controllers/settings_controller.dart';
import 'package:oye_bus/app/modules/screens/ticket_details/controllers/ticket_details_controller.dart';
import 'package:oye_bus/app/routes/app_pages.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_noti_channel_group',
            channelKey: 'basic_noti_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: const Color(0xFF9D50DD),
            importance: NotificationImportance.High,
            playSound: true,
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupName: 'Basic group', channelGroupKey: '')
      ],
      debug: true);

  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      // This is just a basic example. For real apps, you must show some
      // friendly dialog box before call the request method.
      // This is very important to not harm the user experience
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  firebaseNotification();

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');

      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 15,
          channelKey: 'basic_noti_channel',
          title: message.notification!.title,
          body: message.notification!.body,
        ),
      );
    }
  });

  // AwesomeNotifications()
  //     .setListeners(( receivedNotification) {
  //   print(
  //       ":::--------:::::::notification datas:>>>>>>>>>>>>>>>:::-------------------::::::");
  //   // Get.offAll(() => MemberBottomNavBar(
  //   //       index: 3,    
  //   //     ));
  // });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print(message.data);
    print(message.notification);
    if (message.data.isNotEmpty) {
      Map<String, String>? data = Map.from(message.data);

      // Get.offAll(() => MemberBottomNavBar(
      //       index: 3,
      //     ));
    }
  });
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

  // await FirebaseApi().initNotifications();
   runApp(MyApp());
}


firebaseNotification() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
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
