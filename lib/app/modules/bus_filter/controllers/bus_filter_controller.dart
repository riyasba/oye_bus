import 'package:get/get.dart';

class BusFilterController extends GetxController {
  //TODO: Implement BusFilterController

  final count = 0.obs;
    final colorindex = 0.obs;
    RxBool checkbox1= false.obs;
    RxBool checkbox2= false.obs;
    RxBool checkbox3= false.obs;
    RxBool checkbox4= false.obs;
    RxBool checkbox5= false.obs;
    RxBool depatcheck1 = false.obs;
    RxBool depatcheck2 = false.obs;
    RxBool depatcheck3 = false.obs;
    RxBool depatcheck4 = false.obs;
    RxBool bustypecheck1=false.obs;
    RxBool bustypecheck2=false.obs;
    RxBool bustypecheck3=false.obs;
    RxBool bustypecheck4=false.obs;

    RxBool singlewindcheck=false.obs;
    RxBool dropcheck1 = false.obs;
    RxBool dropcheck2 = false.obs;
    RxBool dropcheck3 = false.obs;
    RxBool dropcheck4 = false.obs;
    RxBool dropcheck5 = false.obs;
    RxBool dropcheck6 = false.obs;
      RxInt dropcheckindex =0.obs;
  List dropinglist  =[
    'Adyar',
    'Ashok Pillar',
    'Central Railway Station',
    'Egmore',
    'Koyambedu',
    'Maduravoyal',
    'Poonamalle',
    'Vellore Bus Stand',
    'Amabur ',
    'Krishnagri',
    'Hosur',
    'Electronic City',
    'Bengaluru'
  ];
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
}
