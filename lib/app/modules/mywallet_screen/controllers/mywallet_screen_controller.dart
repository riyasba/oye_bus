import 'package:dio/dio.dart'as dio;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/api_provider/wallet_api_service/wallet_history_api_service.dart';
import 'package:oye_bus/app/data/api_service/models/wallet_model/wallet_history_model.dart';

class MywalletScreenController extends GetxController {
  //TODO: Implement MywalletScreenController

  final count = 0.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getWallethistory();
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

  WalletHistoryApiService wallethistoryapiservice = WalletHistoryApiService();

  List<WalletHistoryData> wallethistorydata=[];

  getWallethistory()async{
   isLoading(true);
   dio.Response<dynamic>response= await wallethistoryapiservice.wallethistoryApi();
    
    isLoading(false);
    if(response.data['status']==true){
      WalletHistoryModel walletHistoryModel = WalletHistoryModel.fromJson(response.data);
      wallethistorydata = walletHistoryModel.data!;
      update();
    }
    Get.rawSnackbar(
          backgroundColor: Colors.green,
          messageText: Text(
            response.data["message"],
            style: primaryFont.copyWith(color: Colors.white),
          ));
  }
}
