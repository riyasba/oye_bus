import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/components/custom_button.dart';
import 'package:oye_bus/app/modules/home/controllers/home_controller.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/controllers/busseatmaping_controller.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/boardingselection_view.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/dropingselection_view.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/bording_droping/boarding_view.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/reviewbookingdetails_view.dart';
import 'package:oye_bus/app/modules/screens/passenger_info/controllers/passenger_info_controller.dart';
import 'package:oye_bus/app/modules/screens/passenger_info/views/passenger_info_view.dart';
import 'package:oye_bus/app/modules/screens/settingsscreens/copassengers/controllers/copassengers_controller.dart';

class PickanddropView extends StatefulWidget {
  PickanddropView({Key? key}) : super(key: key);

  @override
  State<PickanddropView> createState() => _PickanddropViewState();
}

class _PickanddropViewState extends State<PickanddropView> with SingleTickerProviderStateMixin {
  final boadingdroppingController = Get.find<BusseatmapingController>();

  final homeController = Get.find<HomeController>();

  int tabIndex = 0;


  @override
  void initState() {
    super.initState();
    homeController.tabBarcontroller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(PassengerInfoController());
    return DefaultTabController(
      initialIndex: tabIndex,
      length: 2, // Number of tabs
      child: GetBuilder<HomeController>(
              builder: (_) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                '${homeController.boardinglocation}  to  ${homeController.destinationlocation}',
                style: appbarfont,
              ),
              bottom: TabBar(
                // dividerHeight: 0,
                automaticIndicatorColorAdjustment: true,
                labelColor: kwhite,
                  controller: homeController.tabBarcontroller,
                padding: const EdgeInsets.only(right: 15, left: 15),
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: kred),
                tabs: [
                  Tab(text: '          BOARDING              '),
                  Tab(text: '        DROPPING         '),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: TabBarView(
                controller: homeController.tabBarcontroller,
                children: [
                  BoardingListView(),
                  DropingselectionView(),
                ],
              ),
            ),
            bottomNavigationBar: GetBuilder<BusseatmapingController>(builder: (_) {
              return Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                child: CustomElevatedButton(
                  height: 45.h,
                  width: 1.sw,
                  onPressed: () {
                    if (boadingdroppingController.boardinglocationvalue.value ==
                            "" ||
                        boadingdroppingController.destinationlocationvalue.value ==
                            "") {
                      Get.rawSnackbar(
                          message: 'Please Select Your Boarding and Dropping',
                          backgroundColor: Colors.red);
                    } else {
                      Get.find<CopassengersController>().copassangers();
                      Get.to(PassengerInfoView());
                    }
          
                    //    Get.toNamed(
                    // Routes.BUSLOADINGSPLASH,
                    //  );
                  },
                  text: 'proceed',
                  color: kred,
                  textColor: kwhite,
                ),
              );
            }),
          );
        }
      ),
    );
  }
}
