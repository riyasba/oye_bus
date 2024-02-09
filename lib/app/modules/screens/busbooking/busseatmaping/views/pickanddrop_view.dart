import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/components/custom_button.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/controllers/busseatmaping_controller.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/boardingselection_view.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/dropingselection_view.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/bording_droping/boarding_view.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/reviewbookingdetails_view.dart';
import 'package:oye_bus/app/modules/screens/passenger_info/controllers/passenger_info_controller.dart';
import 'package:oye_bus/app/modules/screens/passenger_info/views/passenger_info_view.dart';

class PickanddropView extends GetView {
   PickanddropView({Key? key}) : super(key: key);
    final boadingdroppingController = Get.find<BusseatmapingController>();
  @override
  Widget build(BuildContext context) {
    Get.put(PassengerInfoController());
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Chennai to Bangalore',
            style: appbarfont,
          ),
          bottom: TabBar(
           // dividerHeight: 0,
            automaticIndicatorColorAdjustment: true,
            labelColor: kwhite,
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
          padding: const EdgeInsets.only(top: 8,bottom: 8),
          child: TabBarView(
            children: [
              BoardingListView(),
              DropingselectionView(),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 12,right: 12,bottom: 12),
          child: CustomElevatedButton(
            height: 45.h,
            width: 1.sw,
            onPressed: () {
            
              if (boadingdroppingController.boardinglocationvalue.isEmpty||
              boadingdroppingController.destinationlocationvalue.isEmpty) {
        Get.rawSnackbar(
          title: 'Information',
          message: 'please Enter Your Details',
          backgroundColor: Colors.red 
        );
              }else{
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
        ),
      ),
    );
  }
}
