import 'dart:io';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/contsands.dart';

import '../controllers/bottumnavigation_controller.dart';

class BottumnavigationView extends GetView<BottumnavigationController> {
  const BottumnavigationView({Key? key}) : super(key: key);
  back(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.white,
            title: Column(
              children: [
                Image.asset('assets/images/exit.png'),
              ],
            ),
            content: const Text(
              "Are you sure want to exit?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                          // ignore: unrelated_type_equality_checks
                          color: kwhite),
                      child: Center(
                          child: Text("Cancel",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      exit(0);
                    },
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                          color: kblue, borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text("Exit",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: kwhite)),
                      ),
                    ),
                  ),
                ],
              ),
              ksizedbox10
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return back(context);
      },
      child: Scaffold(
        body: Obx(() => controller.screens[controller.currentIndex]),
        bottomNavigationBar: Obx(
          () => AnimatedBottomNavigationBar.builder(
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
                          color: isActive ? Colors.white : Colors.transparent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            controller.iconsList[index],
                            fit: BoxFit.contain,
                            color: isActive ? kred : Colors.white,
                          ),
                        ],
                      )),
                ],
              );
            },
            activeIndex: controller.currentIndex,
            leftCornerRadius: 15,
            rightCornerRadius: 15,
            gapLocation: GapLocation.none,
            onTap: (value) => controller.setIndex(value),
            //other params
          ),
        ),
      ),
    );
  }
}
