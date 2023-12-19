import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gif/gif.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/routes/app_pages.dart';

class SuccessfulScreen extends StatefulWidget {

   SuccessfulScreen({super.key,});

  @override
  State<SuccessfulScreen> createState() => _SuccessfulScreenState();
}

class _SuccessfulScreenState extends State<SuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kwhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Gif(fps: 30,
                  autostart: Autostart.once,
           
            fit: BoxFit.fill, image: AssetImage( 'assets/images/7efs.gif',),
          ),
          //   ksizedbox30,
          Text(
            "Successful!",
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
              "Your Mobile number has been successfully verified",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 14.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ),
          ksizedbox40,

          InkWell(
            onTap: () {
              Get.toNamed(
                Routes.LOCATIONPERMISSON,
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r), color: kred),
                child: Center(
                    child: Text('DONE',
                        style: TextStyle(
                            color: kwhite,
                            fontSize: 20,
                            fontWeight: FontWeight.w600))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
