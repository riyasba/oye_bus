import 'package:get/get.dart';

import '../modules/authentication/login/bindings/login_binding.dart';
import '../modules/authentication/login/views/login_view.dart';
import '../modules/authentication/otp/bindings/otp_binding.dart';
import '../modules/authentication/otp/views/otp_view.dart';
import '../modules/authentication/register/bindings/register_binding.dart';
import '../modules/authentication/register/views/register_view.dart';
import '../modules/busloadingsplash/bindings/busloadingsplash_binding.dart';
import '../modules/busloadingsplash/views/busloadingsplash_view.dart';
import '../modules/card/bindings/card_binding.dart';
import '../modules/card/views/card_view.dart';
import '../modules/copassengers/bindings/copassengers_binding.dart';
import '../modules/copassengers/views/copassengers_view.dart';
import '../modules/onbording/bindings/onbording_binding.dart';
import '../modules/onbording/location/bindings/location_binding.dart';
import '../modules/onbording/location/views/location_view.dart';
import '../modules/onbording/views/onbording_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/referfriends/bindings/referfriends_binding.dart';
import '../modules/referfriends/views/referfriends_view.dart';
import '../modules/screens/bookinghistory/bindings/bookinghistory_binding.dart';
import '../modules/screens/bookinghistory/views/bookinghistory_view.dart';
import '../modules/screens/bottumnavigation/bindings/bottumnavigation_binding.dart';
import '../modules/screens/bottumnavigation/views/bottumnavigation_view.dart';
import '../modules/screens/home/bindings/home_binding.dart';
import '../modules/screens/home/views/home_view.dart';
import '../modules/screens/locationpermisson/bindings/locationpermisson_binding.dart';
import '../modules/screens/locationpermisson/views/locationpermisson_view.dart';
import '../modules/screens/notification/bindings/notification_binding.dart';
import '../modules/screens/notification/views/notification_view.dart';
import '../modules/screens/offers/bindings/offers_binding.dart';
import '../modules/screens/offers/views/offers_view.dart';
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
      children: [
        GetPage(
          name: _Paths.LOGIN,
          page: () => const LoginView(),
          binding: LoginBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.OFFERS,
      page: () => OffersView(),
      binding: OffersBinding(),
    ),
    GetPage(
      name: _Paths.BOTTUMNAVIGATION,
      page: () => const BottumnavigationView(),
      binding: BottumnavigationBinding(),
    ),
    GetPage(
      name: _Paths.BOOKINGHISTORY,
      page: () => BookinghistoryView(),
      binding: BookinghistoryBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.LOCATIONPERMISSON,
      page: () => const LocationpermissonView(),
      binding: LocationpermissonBinding(),
    ),
    GetPage(
      name: _Paths.BUSLOADINGSPLASH,
      page: () => const BusloadingsplashView(),
      binding: BusloadingsplashBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CARD,
      page: () => const CardView(),
      binding: CardBinding(),
    ),
    GetPage(
      name: _Paths.COPASSENGERS,
      page: () => const CopassengersView(),
      binding: CopassengersBinding(),
    ),
    GetPage(
      name: _Paths.REFERFRIENDS,
      page: () => const ReferfriendsView(),
      binding: ReferfriendsBinding(),
    ),
  ];
}
