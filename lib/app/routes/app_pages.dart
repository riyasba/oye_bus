import 'package:get/get.dart';
import 'package:oye_bus/app/modules/bus_filter/bindings/bus_filter_binding.dart';
import 'package:oye_bus/app/modules/bus_filter/views/bus_filter_view.dart';
import 'package:oye_bus/app/modules/reservation_details/bindings/reservation_details_binding.dart';
import 'package:oye_bus/app/modules/reservation_details/views/reservation_details_view.dart';

import '../modules/authentication/login/bindings/login_binding.dart';
import '../modules/authentication/login/views/login_view.dart';
import '../modules/authentication/otp/bindings/otp_binding.dart';
import '../modules/authentication/otp/views/otp_view.dart';
import '../modules/authentication/register/bindings/register_binding.dart';
import '../modules/authentication/register/views/register_view.dart';
import '../modules/booking_cancellation/bindings/booking_cancellation_binding.dart';
import '../modules/booking_cancellation/views/booking_cancellation_view.dart';
import '../modules/busloadingsplash/bindings/busloadingsplash_binding.dart';
import '../modules/busloadingsplash/views/busloadingsplash_view.dart';
import '../modules/screens/busseatmaping/bindings/busseatmaping_binding.dart';
import '../modules/screens/busseatmaping/views/busseatmaping_view.dart';
import '../modules/bustrip_reviews/bindings/bustrip_reviews_binding.dart';
import '../modules/bustrip_reviews/views/bustrip_reviews_view.dart';
import '../modules/onbording/bindings/onbording_binding.dart';
import '../modules/onbording/location/bindings/location_binding.dart';
import '../modules/onbording/location/views/location_view.dart';
import '../modules/onbording/views/onbording_view.dart';
import '../modules/screens/passenger_info/bindings/passenger_info_binding.dart';
import '../modules/screens/passenger_info/views/passenger_info_view.dart';
import '../modules/review_refund_details/bindings/review_refund_details_binding.dart';
import '../modules/review_refund_details/views/review_refund_details_view.dart';
import '../modules/screens/appprofile/aboutus/bindings/aboutus_binding.dart';
import '../modules/screens/appprofile/aboutus/views/aboutus_view.dart';
import '../modules/screens/appprofile/card/bindings/card_binding.dart';
import '../modules/screens/appprofile/card/views/card_view.dart';
import '../modules/screens/appprofile/copassengers/bindings/copassengers_binding.dart';
import '../modules/screens/appprofile/copassengers/views/copassengers_view.dart';
import '../modules/screens/appprofile/helpfaq/bindings/helpfaq_binding.dart';
import '../modules/screens/appprofile/helpfaq/views/helpfaq_view.dart';
import '../modules/screens/appprofile/profile/bindings/profile_binding.dart';
import '../modules/screens/appprofile/profile/views/profile_view.dart';
import '../modules/screens/appprofile/referfriends/bindings/referfriends_binding.dart';
import '../modules/screens/appprofile/referfriends/views/referfriends_view.dart';
import '../modules/screens/appprofile/settings/bindings/settings_binding.dart';
import '../modules/screens/appprofile/settings/views/settings_view.dart';
import '../modules/screens/bookinghistory/bindings/bookinghistory_binding.dart';
import '../modules/screens/bookinghistory/views/bookinghistory_view.dart';
import '../modules/screens/bottumnavigation/bindings/bottumnavigation_binding.dart';
import '../modules/screens/bottumnavigation/views/bottumnavigation_view.dart';
import '../modules/screens/bus_list/bindings/bus_list_binding.dart';
import '../modules/screens/bus_list/views/bus_list_view.dart';
import '../modules/screens/home/bindings/home_binding.dart';
import '../modules/screens/home/views/home_view.dart';
import '../modules/screens/locationpermisson/bindings/locationpermisson_binding.dart';
import '../modules/screens/locationpermisson/views/locationpermisson_view.dart';
import '../modules/screens/notification/bindings/notification_binding.dart';
import '../modules/screens/notification/views/notification_view.dart';
import '../modules/screens/offers/bindings/offers_binding.dart';
import '../modules/screens/offers/views/offers_view.dart';
import '../modules/screens/search/bindings/search_binding.dart';
import '../modules/screens/search/views/search_view.dart';
import '../modules/screens/ticket_details/bindings/ticket_details_binding.dart';
import '../modules/screens/ticket_details/views/ticket_details_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/ticket_cancellation/bindings/ticket_cancellation_binding.dart';
import '../modules/ticket_cancellation/views/ticket_cancellation_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

   static const INITIAL = Routes.SPLASH;
  // static const INITIAL = Routes.HOME;

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
    GetPage(
      name: _Paths.HELPFAQ,
      page: () => const HelpfaqView(),
      binding: HelpfaqBinding(),
    ),
    GetPage(
      name: _Paths.ABOUTUS,
      page: () => const AboutusView(),
      binding: AboutusBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.TICKET_DETAILS,
      page: () => const TicketDetailsView(),
      binding: TicketDetailsBinding(),
    ),
    GetPage(
      name: _Paths.BUSTRIP_REVIEWS,
      page: () => const BustripReviewsView(),
      binding: BustripReviewsBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_CANCELLATION,
      page: () => BookingCancellationView(),
      binding: BookingCancellationBinding(),
    ),
    GetPage(
      name: _Paths.REVIEW_REFUND_DETAILS,
      page: () => const ReviewRefundDetailsView(),
      binding: ReviewRefundDetailsBinding(),
    ),
    GetPage(
      name: _Paths.TICKET_CANCELLATION,
      page: () => const TicketCancellationView(),
      binding: TicketCancellationBinding(),
    ),
    GetPage(
      name: _Paths.BUSSEATMAPING,
      page: () => const BusseatmapingView(),
      binding: BusseatmapingBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.BUS_LIST,
      page: () => const BusListView(),
      binding: BusListBinding(),
    ),
    GetPage(
      name: _Paths.PASSENGER_INFO,
      page: () => const PassengerInfoView(),
      binding: PassengerInfoBinding(),
    ),
    GetPage(name: _Paths.BUSFILTER, 
    page: ()=>BusFilterView(),
    binding: BusFilterBinding()),

    GetPage(
      name: _Paths.RESERVATIONDETAILS, 
      page: ()=>ReservationDetailsView(),
      binding: ReservationDetailsBinding()
      ),

  ];
}
