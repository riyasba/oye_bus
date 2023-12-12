import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:gif/gif.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/components/custom_button.dart';

import 'package:oye_bus/app/routes/app_pages.dart';

class PaymentsuccesfullView extends GetView {
  const PaymentsuccesfullView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gif(fps: 30,
                  autostart: Autostart.once,
           
            fit: BoxFit.cover, image: AssetImage( 'assets/images/7efs.gif',),
          ),
          //   ksizedbox30,
          Text(
            "Payment Verified",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 18.sp,
                  //  color: Colo8rs.grey,
                  fontWeight: FontWeight.w700,
                ),
          ),
          ksizedbox20,
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Your payment was successful and you can start travel your seat enjoy movements.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 14.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ),
          ksizedbox40,

         Padding(
           padding: const EdgeInsets.all(8.0),
           child: CustomElevatedButton(
              height: 45.h,
              width: 1.sw,
              onPressed: () {
               Get.toNamed(Routes.RESERVATIONDETAILS);
                //    Get.toNamed(
                // Routes.BOTTUMNAVIGATION,
                //  );
              },
              text: 'Next',
              color: kred,
              textColor: kwhite,
            ),
         )
        ],
      ),
    );
  }
}
