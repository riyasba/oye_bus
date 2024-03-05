import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/data/api_service/api_provider/bus_review_api-services/bus_review_api_services.dart';
import 'package:dio/dio.dart' as dio;

class BustripReviewsController extends GetxController {
  //TODO: Implement BustripReviewsController

  final count = 0.obs;
  RxInt containercolor = 0.obs;
  RxDouble rating = 3.5.obs;
  @override
  void onInit() {
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

  BusReviewApiServices busReviewApiServices = BusReviewApiServices();

   reviewData({
  required int busId,
  required double rating,
  required String reviews,
  required String travellersLikedId,
}) async{
    dio.Response<dynamic> response = await busReviewApiServices.busReviewApiServices(busId: busId, rating: rating, reviews: reviews, travellersLikedId: travellersLikedId);


    if(response.data['status'] == true){
  Get.rawSnackbar(
    message: "Submitted Successfully",
    backgroundColor: Colors.green
  );
    }



}

}
