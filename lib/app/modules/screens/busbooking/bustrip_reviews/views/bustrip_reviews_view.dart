import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/booking_history_model.dart';

import '../controllers/bustrip_reviews_controller.dart';

class BustripReviewsView extends GetView<BustripReviewsController> {
  BookingDetail bookingDetail;
  BustripReviewsView({Key? key,required this.bookingDetail}) : super(key: key);

 var textController = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BustripReviewsController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Bus Trip Reviews',
          style: TextStyle(fontSize: 20.sp),
        ),
        actions: [
          Image.asset('assets/offers_icon/supporticon.png'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 131.sp,
                  width: 470.sp,
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bookingDetail.busData!.busName.toString(),
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: 'Proxima',
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          Text(
                            '${bookingDetail.bookingData!.boardingTime}   →  ${bookingDetail.bookingData!.droppingTime}  ${bookingDetail.bookingData!.dateOfJourney}',
                            style: TextStyle(color: kgrey),
                          )
                        ],
                      ),
                      Text(
                        '${bookingDetail.bookingData!.pickupPoint}  - ${bookingDetail.bookingData!.droppingPoint}',
                        style: TextStyle(color: kgrey),
                      ),
                      Text(
                        'Travel Completed',
                        style: TextStyle(
                            color: Color(0xffFF0000),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                ksizedbox10,
                Text(
                  'Ratings & Reviews',
                  style: TextStyle(
                      fontFamily: 'Proxima ',
                      fontSize: 16.5.sp,
                      fontWeight: FontWeight.w600),
                ),
                ksizedbox10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBar.builder(
   initialRating: 3,
   minRating: 1,
   direction: Axis.horizontal,
   allowHalfRating: true,
   itemCount: 5,
   itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
   itemBuilder: (context, _) => Icon(
     Icons.star,
     color: Colors.amber,
   ),
   onRatingUpdate: (rating) {
     print(rating);
     controller.rating(rating);
   },
),
                    Obx(()=> Text(
                        controller.rating.value.toString(),
                        style: TextStyle(
                            fontFamily: 'Proxima',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Text(
                    'What Travellers Liked',
                    style: TextStyle(
                        fontFamily: 'Proxima',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                ksizedbox20,
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.containercolor(0);
                          controller.update();
                        },
                        child: Container(
                          height: 45.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(34),
                              color: controller.containercolor.value == 0
                                  ? Colors.amber[200]
                                  : Colors.grey.shade200),
                          child: Center(
                            child: Text(
                              'Punctually ',
                              style: TextStyle(
                                fontFamily: 'Proxima ',
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.containercolor(1);
                          controller.update();
                        },
                        child: Container(
                          height: 45.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(34),
                              color: controller.containercolor.value == 1
                                  ? Colors.amber[200]
                                  : Colors.grey.shade200),
                          child: Center(
                              child: Text(
                            'Seat Comfort',
                            style: TextStyle(fontFamily: 'Proxima '),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
                ksizedbox20,
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.containercolor(2);
                          controller.update();
                        },
                        child: Container(
                          height: 45.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(34),
                              color: controller.containercolor.value == 2
                                  ? Colors.amber[200]
                                  : Colors.grey.shade200),
                          child: Center(
                            child: Text(
                              'Cleanlines',
                              style: TextStyle(
                                fontFamily: 'Proxima ',
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.containercolor(3);
                          controller.update();
                        },
                        child: Container(
                          height: 45.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(34),
                              color: controller.containercolor.value == 3
                                  ? Colors.amber[200]
                                  : Colors.grey.shade200),
                          child: Center(
                              child: Text(
                            'Staff behavior',
                            style: TextStyle(fontFamily: 'Proxima '),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
                ksizedbox20,
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.containercolor(4);
                          controller.update();
                        },
                        child: Container(
                          height: 45.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(34),
                              color: controller.containercolor.value == 4
                                  ? Colors.amber[200]
                                  : Colors.grey.shade200),
                          child: Center(
                            child: Text(
                              'Driving',
                              style: TextStyle(
                                fontFamily: 'Proxima ',
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.containercolor(5);
                          controller.update();
                        },
                        child: Container(
                          height: 45.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(34),
                              color: controller.containercolor.value == 5
                                  ? Colors.amber[200]
                                  : Colors.grey.shade200),
                          child: Center(
                              child: Text(
                            'Ac',
                            style: TextStyle(fontFamily: 'Proxima '),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
                ksizedbox20,
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.containercolor(6);
                          controller.update();
                        },
                        child: Container(
                          height: 45.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(34),
                              color: controller.containercolor.value == 6
                                  ? Colors.amber[200]
                                  : Colors.grey.shade200),
                          child: Center(
                            child: Text(
                              'Live Tracking ',
                              style: TextStyle(
                                fontFamily: 'Proxima ',
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.containercolor(7);
                          controller.update();
                        },
                        child: Container(
                          height: 45.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(34),
                              color: controller.containercolor.value == 7
                                  ? Colors.amber[200]
                                  : Colors.grey.shade200),
                          child: Center(
                              child: Text(
                            'Rest Stop',
                            style: TextStyle(fontFamily: 'Proxima '),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
                ksizedbox20,
                Text(
                  'Reviews',
                  style: TextStyle(
                      fontFamily: 'Proxima ',
                      fontSize: 16.5.sp,
                      fontWeight: FontWeight.w700),
                ),
                ksizedbox20,
                Container(
                  height: 100.h,
                  width: 377.w,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: kgrey),
                      borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: textController,
                     maxLines: 5,
                     decoration: const InputDecoration.collapsed(hintText: "Enter your feedback here"),
                    ),
                  ),
                ),
                ksizedbox20,
                GestureDetector(
                  onTap: () {
                    controller.reviewData(busId: bookingDetail.bookingData!.bookingId as int, rating: controller.rating.value, reviews: textController.text, travellersLikedId: "Bus");
                  },
                  child: Container(
                    height: 50.h,
                    width: 399.w,
                    decoration: BoxDecoration(
                        color: const Color(0xffEE0000),
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Text(
                        'SUBMIT REVIEWS',
                        style: TextStyle(
                            fontFamily: 'Proxima ',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: kwhite),
                      ),
                    ),
                  ),
                ),
                ksizedbox20,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
