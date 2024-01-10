import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/api_provider/profile_api_service/profile_api_service.dart';
import 'package:oye_bus/app/data/api_service/api_provider/profile_api_service/update_profile_api_service.dart';
import 'package:oye_bus/app/data/api_service/models/profile/profile_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:oye_bus/app/data/api_service/models/profile/profile_update_model.dart';
import 'package:oye_bus/app/modules/bottumnavigation/controllers/bottumnavigation_controller.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isEdited = false.obs;

  @override
  void onInit() {
    super.onInit();
    setDefault();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var ageController = TextEditingController();
  var genderController = TextEditingController();
    
      setDefault()async{
 WidgetsBinding.instance.addPostFrameCallback((_) async{
   await getprofile();
   print('profiledata-------------------------->>');
   print('profiledata-------------------------->>');
   print('profiledata-------------------------->>');
   print('profiledata-------------------------->>');
  // print(profiledata.first.name);
  
    if(profiledata.isNotEmpty){
      nameController.text = profiledata.first.name;
      emailController.text = profiledata.first.email;
      mobileController.text = profiledata.first.mobile;
      emailController.text = profiledata.first.email;
    }
    update();
 });
  update();
  }

  //getprofile
  ProfileApiService pofileapiservice = ProfileApiService();
  List<ProfileData>profiledata=[];

  getprofile()async{
   isLoading(true);
   profiledata.clear();
   dio.Response<dynamic>response = await pofileapiservice.getProfileApi();

   isLoading(false);
   if(response.data['status']==true){
    ProfileModel profileModel = ProfileModel.fromJson(response.data);
    profiledata.add(profileModel.data);
    update();
   }else{
    
   }
  }
  //profileupdater
  
  UpdateProfileApiservice updateProfileApiservice = 
  UpdateProfileApiservice();

  updateprofile({required ProfileUpdateModel profileUpdateModel})
  async{
     isLoading(true);
     dio.Response<dynamic>response = await updateProfileApiservice.updateprofileApi(
      profileUpdateModel: profileUpdateModel);
      isLoading(false);
        if(response.data['status']==true){ 
      
         Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            response.data['message'],
            style: primaryFont.copyWith(color: Colors.white),
          ));
      }
      update();
  }
}
