import 'package:get/get.dart';

import '../modules/screens/bookinghistory/bindings/bookinghistory_binding.dart';
import '../modules/screens/bookinghistory/views/bookinghistory_view.dart';
import '../modules/screens/bottumnavigation/bindings/bottumnavigation_binding.dart';
import '../modules/screens/bottumnavigation/views/bottumnavigation_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/location/bindings/location_binding.dart';
import '../modules/location/views/location_view.dart';
import '../modules/authentication/login/bindings/login_binding.dart';
import '../modules/authentication/login/views/login_view.dart';
import '../modules/screens/notification/bindings/notification_binding.dart';
import '../modules/screens/notification/views/notification_view.dart';
import '../modules/screens/offers/bindings/offers_binding.dart';
import '../modules/screens/offers/views/offers_view.dart';
import '../modules/onbording/bindings/onbording_binding.dart';
import '../modules/onbording/views/onbording_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBORDING,
      page: () => const OnbordingView(),
      binding: OnbordingBinding(),
    ),
    GetPage(
      name: _Paths.LOCATION,
      page: () => const LocationView(),
      binding: LocationBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () =>  NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.OFFERS,
      page: () => const OffersView(),
      binding: OffersBinding(),
    ),
    GetPage(
      name: _Paths.BOTTUMNAVIGATION,
      page: () => const BottumnavigationView(),
      binding: BottumnavigationBinding(),
    ),
    GetPage(
      name: _Paths.BOOKINGHISTORY,
      page: () => const BookinghistoryView(),
      binding: BookinghistoryBinding(),
    ),
  ];
}
