import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/contsands.dart';

import '../controllers/bottumnavigation_controller.dart';

class BottumnavigationView extends GetView<BottumnavigationController> {
  const BottumnavigationView({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.screens[controller.currentIndex]),
      bottomNavigationBar: Obx(()=> AnimatedBottomNavigationBar.builder(
        backgroundColor: kred,
        itemCount: controller.iconsList.length,
       tabBuilder: (int index, bool isActive) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:isActive? Colors.white : Colors.transparent
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(controller.iconsList[index], fit: BoxFit.contain,color: isActive ? kred : Colors.white,),
                ],
              )),
          ],
        );
       },
        activeIndex: controller.currentIndex,
        leftCornerRadius: 15,
        rightCornerRadius: 15,
         gapLocation: GapLocation.none,
        onTap: (value)=> controller.setIndex(value),
        //other params
         ),
      ),
    );
  }
}
