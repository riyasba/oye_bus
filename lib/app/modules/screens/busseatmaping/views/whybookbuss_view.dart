import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oye_bus/app/components/const.dart';

class WhybookbussView extends GetView {
  const WhybookbussView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
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
                        'Primo makes extra efforts to ensure the safer travel experience',
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
                        'Every Primo bus has a proven track record of regulary being on time.',
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
                        'Primo stands for comfort and best - in - class service experience.',
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
                        'You can now track your bus and plan your commute to the boarding point! family members and friends can also your safety.',
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
                        'Change your travel date for free up to 8 hours before the depature. Get min 50% refund if you can tickets 12 hours before deoarture.',
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
      ),
    ));
  }
}
