import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/contsands.dart';

class RestshopView extends GetView {
  const RestshopView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rest Stop(s)',
            style: bussmidfont,
          ),
          ksizedbox20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Arrives at 01:00 AM',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 14.sp,
                      color: kblack,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                'Stops for 10 Minutes',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 14.sp,
                      color: kgreen,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
          ksizedbox10,
          Text(
            'Hotel Amirtha Ac Restaurent Hotel',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 14.sp,
                  color: kblack,
                  fontWeight: FontWeight.w600,
                ),
          ),
          ksizedbox10,
          Text(
            'Travelers Feedback',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 14.sp,
                  color: kblack,
                  fontWeight: FontWeight.w400,
                ),
          ),
          ksizedbox20,
          Container(
            height: 35.h,
            width: 200.w,
            decoration: BoxDecoration(
              color: kgreen,
              borderRadius: BorderRadius.circular(16),
         
            ),
            child: Center(
              child: Text(
                'Washroom Hygiene - 71%',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 14.sp,
                      color: kwhite,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          ),
          ksizedbox20,
          Text(
            'Could Be Better',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 16.sp,
                  color: kblack,
                  fontWeight: FontWeight.w500,
                ),
          ),
          ksizedbox20,
          Container(
            height: 35.h,
            width: 200.w,
            decoration: BoxDecoration(
              color: kblack,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                'Food Quality / Safety - 50%',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 14.sp,
                      color: kwhite,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          ),
          ksizedbox20,
        ],
      ),
    ));
  }
}
