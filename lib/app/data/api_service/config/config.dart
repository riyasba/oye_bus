
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
   final String busoffersURL = 'https://oye.batechnology.in/api/getOffers';

   //feedback
   final String feedbackURL = 'https://oye.batechnology.in/api/auth/feedback';
  
  //bus
  final String buslistURL = "https://oye.batechnology.in/api/auth/getBusList";
  final String busdetailsURL = "https://oye.batechnology.in/api/auth/getbusDetails"; 

  
}
 

  

