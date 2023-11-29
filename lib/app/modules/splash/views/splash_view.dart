import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(
      SplashController(),
    );
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/image 2 (1).png',
              height: 500,
            ),


        Image.asset('assets/images/img1.png'),  ],
        ),
      ),
    );
  }
}
