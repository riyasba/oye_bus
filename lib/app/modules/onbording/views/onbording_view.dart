import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/contsands.dart';
import 'package:oye_bus/app/components/custom_button.dart';
import '../controllers/onbording_controller.dart';



class OnbordingView extends GetView<OnbordingController> {
  const OnbordingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset('assets/images/Seart 1.svg')),
      bottomNavigationBar: Container(
        height: 150.h,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomElevatedButton(
                text: 'CONTINUE',
                color: kred,
                textColor: kwhite,
                onPressed: () {
                  // Get.offNamedUntil(
                  //   Routes.ONBORDING,
                  //   (route) => false,
                  // );
                },
                width: double.infinity,
                height: 45,
              ),
              ksizedbox10,
              CustomElevatedButton(
                text: 'Cancel',
                color: kwhite,
                textColor: kred,
                onPressed: () {},
                width: double.infinity,
                height: 45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
