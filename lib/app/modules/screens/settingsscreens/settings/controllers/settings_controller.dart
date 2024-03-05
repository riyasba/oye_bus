
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/api_provider/feedback_api_service.dart';
import 'package:oye_bus/app/data/api_service/api_provider/settings_api_service/country_api_service.dart';
import 'package:oye_bus/app/data/api_service/api_provider/settings_api_service/currency_api_service.dart';
import 'package:oye_bus/app/data/api_service/api_provider/settings_api_service/deleteaccount_api_service.dart';
import 'package:oye_bus/app/data/api_service/api_provider/settings_api_service/language_api_service.dart';
import 'package:oye_bus/app/data/api_service/models/feedback_model.dart';
import 'package:oye_bus/app/data/api_service/models/settings_models/country_models.dart';
import 'package:oye_bus/app/data/api_service/models/settings_models/currency_model.dart';
import 'package:oye_bus/app/data/api_service/models/settings_models/language_model.dart';
import 'package:oye_bus/app/modules/authentication/login/views/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {

  final count = 0.obs;
  RxBool isLoading = false.obs;
    RxString feedbackdata = "".obs; 

  final index = Rx<int?>(null);
  int? get selectedIndex => index.value;

  void setIndex(int currentIndex) {
    index.value = currentIndex;
  }

  @override
  void onInit() {
    // getCountrys();
    // getcurrency();
    // getLanguage();
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

  final isontouch = true.obs;
  final isontouchcurrency = true.obs;
  final islanguage = true.obs;
  final isdeletacount = true.obs;

  void increment() => count.value++;

   
    var subjectController= TextEditingController();
   var feedbackController= TextEditingController();
  logout() async {
    final prefs = await SharedPreferences.getInstance();
  await  prefs.setString("auth_token", "null");
    Get.offAll(LoginView());
  }

  //country
  CountryApiService  countryApiService = CountryApiService();
  List<CountryData>countydata = [];

  getCountrys()async{
    isLoading(true);
    dio.Response<dynamic>response = await countryApiService.countryApi();

    isLoading(false);
    if(response.data['status']==true){
      CountryModel countryModel = CountryModel.fromJson(response.data);
      countydata=countryModel.data;
      // Get.rawSnackbar(
      //     backgroundColor: Colors.green,
      //     messageText: Text(
      //       response.data["message"],
      //       style: primaryFont.copyWith(color: Colors.white),
      //     )); 
      update();
    }
    else{
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
  }

  //currency
  CurrencyApiService currencyApiService = CurrencyApiService();
   List<CurrencyData> currencydata=[];
   
  getcurrency()async{
    isLoading(true);
    dio.Response<dynamic>response = await currencyApiService.currencyApi();

    isLoading(false);
    if(response.data['status']==true){
      CurrencyModel currencyModel = CurrencyModel.fromJson(response.data);
      currencydata=currencyModel.data;
      update();
    }
    else{
      
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    
    }
  }

  //language

  LanguageApiService languageApiService = LanguageApiService();
  List<LanguageData> languagedata=[];

  getLanguage()async{
    isLoading(true);
    dio.Response<dynamic>response = await languageApiService.languageApi();

    isLoading(false);
    if(response.data['status']==true){
      LanguageModel languageModel = LanguageModel.fromJson(response.data);
      languagedata = languageModel.data;
      update();
    }
    else{
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          messageText: Text(
            "Something went wrong",
            style: primaryFont.copyWith(color: Colors.white),
          ));
    }
      }
     //deleteaccount
     
      DeleteAccountApiService  deleteAccountApiService = 
      DeleteAccountApiService();

      deleteAccount()async{
        isLoading(true);
       dio.Response<dynamic>response = await deleteAccountApiService.deleteAccountApi();

       isLoading(false);
       if(response.data['status']==true){
         Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            response.data['message'],
            style: primaryFont.copyWith(color: Colors.white),
          ));
       }
      }
      //feedback

      FeedbackApiService feedbackApiService = FeedbackApiService();

       getfeedback({required FeedbackModel feedbackModel})
       async{
        isLoading(true);
        dio.Response<dynamic>response = await feedbackApiService.feedbackapi(
          feedbackModel: feedbackModel);
          
          isLoading(false);
          if(response.data['status']==true){
            Get.back();
          Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            response.data['message'],
            style: primaryFont.copyWith(color: Colors.white),
          ));
          update();
          }else{
            Get.rawSnackbar(
        messageText: Text(
          response.data['message'],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
          }
       }
      }
