import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/data/api_service/api_provider/profile_api_service/profile_api_service.dart';
import 'package:oye_bus/app/data/api_service/models/profile_model.dart';
import 'package:dio/dio.dart' as dio;

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    setDefault();
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

  void increment() => count.value++;
   var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
    
      setDefault()async{
 WidgetsBinding.instance.addPostFrameCallback((_) async{
   await getprofile();
  
    if(profiledata.isNotEmpty){
      nameController.text=profiledata.first.name;
      emailController.text = profiledata.first.email;
      mobileController.text = profiledata.first.mobile;
      emailController.text = profiledata.first.email;
    }
    update();
 });
  }

  //getprofile
  ProfileApiService pofileapiservice = ProfileApiService();
  List<ProfileData>profiledata=[];

  getprofile()async{
   isLoading(true);
   profiledata.clear();
   dio.Response<dynamic>response = await pofileapiservice.GetProfileApi();

   isLoading(false);
   if(response.data['status']==true){
    ProfileModel profileModel = ProfileModel.fromJson(response.data);
    profiledata.add(profileModel.data);
    update();
   }else{
    
   }
  }
}
