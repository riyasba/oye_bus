import 'package:get/get.dart';
import 'package:oye_bus/app/data/api_service/api_provider/faqs_api_service.dart';
import 'package:dio/dio.dart'as dio;
import 'package:oye_bus/app/data/api_service/models/faqs_model.dart';

class HelpfaqController extends GetxController {
  //TODO: Implement HelpfaqController

  final count = 0.obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    getFaqs();
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

  FaqsApiservice faqsApiservice = FaqsApiservice();
  List<FaqsData>faqsdata=[];

  getFaqs()async{
    isLoading(true);
    dio.Response<dynamic>response= await faqsApiservice.faqsApi();

    isLoading(false);
    if(response.data['status']==true){
      FaqsModel faqsModel = FaqsModel.fromJson(response.data);
      faqsdata=faqsModel.data;
      update();
    }
    else{

    }
  }
}
