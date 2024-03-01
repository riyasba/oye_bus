
abstract class Config{
  
   final String config = 'https://oye.batechnology.in';
   
  //auth
  final String registerURL = 'https://oye.batechnology.in/api/register';
  final String registerverifyURL =
  'https://oye.batechnology.in/api/register_verification';
  final String loginURL = 
  'https://oye.batechnology.in/api/login';
  final String loginverifyURL = 
  'https://oye.batechnology.in/api/login_verify';
   
  //profile
  final String getProfileURL =
      'https://oye.batechnology.in/api/auth/user-details';
  final String updateProfileURL =
   'https://oye.batechnology.in/api/auth/update-user';

   //passengers
   
   final String copassengersURL = 
   'https://oye.batechnology.in/api/auth/get_co_passenger';
   final String addcoPassengersURL =
   'https://oye.batechnology.in/api/auth/add_co_passenger';
   final String deletePassengersURL = 
   'https://oye.batechnology.in/api/delete_passenger';

  //faqs
  final String faqsURL = 'https://oye.batechnology.in/api/faqs';

  //aboutus
  final String aboutusURL = 'https://oye.batechnology.in/api/about_us';

  //settings
  final String countryURL = 'https://oye.batechnology.in/api/country';
  final String currencuURL = 'https://oye.batechnology.in/api/currency';
  final String languageURL = 'https://oye.batechnology.in/api/language';
  final String deleteaccountURL = 'https://oye.batechnology.in/api/auth/delete_account';

  //bus city search
  final String buscitySearchURL = 'https://oye.batechnology.in/api/searchCities';

  //bus get offers
   final String busoffersURL = 'https://oye.batechnology.in/api/allOffers';

   //feedback
   final String feedbackURL = 'https://oye.batechnology.in/api/auth/feedback';
  
  //bus 
  final String buslistURL = "https://oye.batechnology.in/api/searchtrips";
  final String busdetailsURL = "https://oye.batechnology.in/api/tripDetails"; 

  //booking
  final String addbookingURL = 'https://oye.batechnology.in/api/auth/addBooking';
  final String busSeatesURL = 'https://oye.batechnology.in/api/auth/get-seats';
  final String blockseatURL = "https://oye.batechnology.in/api/auth/blockSeat";
  final String bookinghistoryURL = 'https://oye.batechnology.in/api/auth/getBookingDetails';
  final String bookingCancelURl = "https://oye.batechnology.in/api/auth/cancelBooking";
  final String bookingCancelledlistURL = "https://oye.batechnology.in/api/auth/cancelledBookingList";
}
 

  

