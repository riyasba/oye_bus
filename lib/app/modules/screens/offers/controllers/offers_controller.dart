import 'package:get/get.dart';
import 'package:oye_bus/app/data/api_service/api_provider/bus_offers_api_service.dart';
import 'package:dio/dio.dart'as dio;
import 'package:oye_bus/app/data/api_service/models/get_offers_model.dart';


class OffersController extends GetxController {
  //TODO: Implement OffersController

  final count = 0.obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    getoffers();
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


  BusOffersApiService busoffersapiservice = BusOffersApiService();
  List<OffersData> offersdata=[];

  getoffers()async{
    isLoading(true);
   dio.Response<dynamic>response = await busoffersapiservice.busoffersAPi();
    
    isLoading(false);
    if(response.data['status']==true){
      OffersModel offersModel = OffersModel.fromJson(response.data);
      offersdata=offersModel.data;
      update();
    }
    else{

    }
  }
}
