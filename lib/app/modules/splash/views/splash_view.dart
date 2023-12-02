import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/contsands.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(
      SplashController(),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ksizedbox10,
            Image.asset(
              'assets/images/image 2 (1).png',
              height: 500,
            ),
            Image.asset('assets/images/Register.gif'),
          ],
        ),
      ),
    );
  }
}
