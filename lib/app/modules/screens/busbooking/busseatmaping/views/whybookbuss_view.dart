import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/controllers/busseatmaping_controller.dart';



class WhybookbussView extends GetView {
   WhybookbussView({Key? key}) : super(key: key);

final whybookingbusController = Get.find<BusseatmapingController>();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Why Book this bus?',style: bussmidfont,
        
            ),
            ksizedbox10,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/shield 1.svg'),
                kwidth5,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Safe',
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                              fontSize: 17.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      // ksizedbox10,
                      Container(
                        width: 270.w,
                        child: Text(                   
                        whybookingbusController.aboutbusdata!.safety,
                          style:
                              Theme.of(context).textTheme.displaySmall!.copyWith(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            ksizedbox30,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/calendar (1) 1.svg'),
                kwidth5,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'On-time',
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                              fontSize: 17.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      // ksizedbox10,
                      Container(
                        width: 270.w,
                        child: Text(
                          whybookingbusController.aboutbusdata!.onTime,
                          style:
                              Theme.of(context).textTheme.displaySmall!.copyWith(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),ksizedbox30, 
            //  ksizedbox30,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/convenient 1.svg'),
                kwidth5,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Comfortable',
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                              fontSize: 17.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      // ksizedbox10,
                      Container(
                        width: 270.w,
                        child: Text(
                        whybookingbusController.aboutbusdata!.comfortable,
                          style:
                              Theme.of(context).textTheme.displaySmall!.copyWith(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),ksizedbox30,
             Text(
              'Flexi Ticket',
              textAlign: TextAlign.start,
              style: GoogleFonts.montserrat(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),ksizedbox30, Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/images/fi_4896307.svg'),
                ),
                kwidth5,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Live Tracking',
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                              fontSize: 17.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      // ksizedbox10,
                      Container(
                        width: 270.w,
                        child: Text(
                          whybookingbusController.aboutbusdata!.liveTracking,
                          style:
                              Theme.of(context).textTheme.displaySmall!.copyWith(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),ksizedbox30, Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/images/fi_2881441.svg'),
                ),
                kwidth5,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Flexi Ticket',
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                              fontSize: 17.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      // ksizedbox10,
                      Container(
                        width: 270.w,
                        child: Text(
                              whybookingbusController.aboutbusdata!.flexiTicket,
                          style:
                              Theme.of(context).textTheme.displaySmall!.copyWith(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),ksizedbox30, 
          ],
        ));
  }
}
