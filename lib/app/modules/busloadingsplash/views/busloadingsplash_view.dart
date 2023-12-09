import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';

import '../controllers/busloadingsplash_controller.dart';

class BusloadingsplashView extends GetView<BusloadingsplashController> {
  const BusloadingsplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(BusloadingsplashController());
    return Scaffold(backgroundColor: kwhite,
    
      body:  Center(
        child:Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Bus-loarder-1.gif'),
        Text('Loading...',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),)  ],
        )
      ),
    );
  }
}
