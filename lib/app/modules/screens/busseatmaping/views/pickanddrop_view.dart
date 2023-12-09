import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/comon_custombutton.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/components/custom_button.dart';
import 'package:oye_bus/app/modules/screens/busseatmaping/views/boardingselection_view.dart';
import 'package:oye_bus/app/modules/screens/busseatmaping/views/dropingselection_view.dart';
import 'package:oye_bus/app/modules/screens/busseatmaping/views/reviewbookingdetails_view.dart';

class PickanddropView extends GetView {
  const PickanddropView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            automaticIndicatorColorAdjustment: true,
            labelColor: kwhite,
            padding: const EdgeInsets.only(right: 15, left: 15),
            unselectedLabelColor: Colors.black,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: kred),
            tabs: [
              Tab(text: '        BOARDING        '),
              Tab(text: '        DROPPING        '),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BoardingselectionView(),
            DropingselectionView(),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomElevatedButton(
            height: 45.h,
            width: 1.sw,
            onPressed: () {
              Get.to(ReviewbookingdetailsView());
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
