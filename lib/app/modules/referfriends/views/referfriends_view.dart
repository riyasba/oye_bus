import 'package:dotted_border/dotted_border.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/contsands.dart';
import 'package:oye_bus/app/components/custom_button.dart';

import '../controllers/referfriends_controller.dart';

class ReferfriendsView extends GetView<ReferfriendsController> {
  const ReferfriendsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kwhite,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[300],
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back),
            ),
            title: Text(
              'Refer Friends',
              style: appbarfont,
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Group 59 (1).png'),
                  ksizedbox10,
                  Text(
                    'When your friend completes his / her first trip with use',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                  ),
                  ksizedbox20,
                  DottedBorder(
                    color: Colors.black,
                    strokeWidth: 1,
                    radius:
                        Radius.circular(16), // Add this line for border radius
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                        
                          Text(
                            'Your Code:',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          Text(
                            'OYE32BUS',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: kred,
                            ),
                          ),kwidth10,kwidth10,
                          Text(
                            'Copy',
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue),
                          ),
                          Image.asset('assets/images/copy 1.png')
                        ],
                      ),
                    ),
                  ),
                  ksizedbox40,
                  CustomElevatedButton(
                    height: 45.h,
                    width: 1.sw,
                    onPressed: () {
                      // Get.to(
                      //   AddcopassengersView(),
                      // );
                    },
                    text: 'REFER NOW',
                    color: kred,
                    textColor: kwhite,
                  ),
                  ksizedbox10,
                  CustomElevatedButton(
                    height: 45.h,
                    width: 1.sw,
                    onPressed: () {
                      // Get.to(
                      //   AddcopassengersView(),
                      // );
                    },
                    text: 'Cancel',
                    color: kwhite,
                    textColor: kred,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
