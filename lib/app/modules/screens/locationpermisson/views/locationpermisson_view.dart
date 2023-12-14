import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gif/gif.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/components/custom_button.dart';
import 'package:oye_bus/app/routes/app_pages.dart';
import '../controllers/locationpermisson_controller.dart';

class LocationpermissonView extends GetView<LocationpermissonController> {
  const LocationpermissonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        title: Text(
          'Location Permission',
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
              Gif(
                fps: 30,
                autostart: Autostart.once,
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/Register.gif',
                ),
              ),
              //

              ksizedbox20,
              Text(
                'Hi, nice to meet you!',
                style: minbalckfont,
              ),
              ksizedbox20,
              Text(
                '''Providing location permission enables us to give you a hassle free boarding experience''',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 14.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              ksizedbox40,
              ksizedbox40,
              //  ListenLocationWidget(),
              CustomElevatedButton(
                height: 45.h,
                width: 1.sw,
                onPressed: () {
                  Get.toNamed(
                    Routes.BUSLOADINGSPLASH,
                  );
                },
                text: 'USE CURRENT LOCATION',
                color: kred,
                textColor: kwhite,
              ),
              ksizedbox10,
              CustomElevatedButton(
                height: 45.h,
                width: 1.sw,
                onPressed: () {
                  Get.toNamed(
                    Routes.BUSLOADINGSPLASH,
                  );
                },
                text: 'Skip',
                color: kwhite,
                textColor: kred,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
