import 'package:get/get.dart';
import 'package:oye_bus/app/data/api_service/models/bus_details_model.dart';
import 'package:oye_bus/app/modules/home/controllers/home_controller.dart';

class BusListController extends GetxController {
  //TODO: Implement BusListController

  final count = 0.obs;
  RxBool isHover = false.obs;
   final buslistController = Get.find<HomeController>();
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


  List<BusDetailsModel> busList = [
    
  ];
}
