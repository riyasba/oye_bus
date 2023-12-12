import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/components/custom_button.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/paymentsuccesfull_view.dart';
import 'package:oye_bus/app/routes/app_pages.dart';

class ReviewbookingdetailsView extends GetView {
  const ReviewbookingdetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Review Booking Details',
          style: appbarfont,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 532.h,
                      width:320.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey[300]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ksizedbox10,
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'KMRL Kalaimakal',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text('A/C Seater / Sleepr (2+1) - 1 Seat')
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 15),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 130,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Text('21:50'),
                                              Text(
                                                '10 Nov',
                                                style: TextStyle(fontSize: 10),
                                              )
                                            ],
                                          ),
                                          Text(
                                            '7h 15m',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                          Column(
                                            children: [
                                              Text('05:05'),
                                              Text(
                                                '11 Nov',
                                                style: TextStyle(fontSize: 10),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.circle),
                                      ),
                                      Container(
                                        height: 92,
                                        width: 5,
                                        decoration:
                                            BoxDecoration(color: Colors.black),
                                      ),
                                      Container(
                                        height: 15,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.circle),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 130,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'Chennai \nAirport (Meenambakkam Metro)'),
                                            Text('Bangalore \nBommasandra')
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          ksizedbox10,
                          Container(
                            width: 374,
                            decoration: BoxDecoration(),
                            child: Text(
                              '-----------------------------------------------------------------------------------',
                              style: TextStyle(color: kwhite),
                            ),
                          ),
                          ksizedbox10,
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              '21:50 PM - 06:15AM',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, left: 10),
                            child: Text(
                              '10 Nov 2023, Saturday',
                              style: TextStyle(),
                            ),
                          ),
                          ksizedbox10,
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Seat Number : L19',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Ticket ID : ',
                                      style: TextStyle(),
                                    ),
                                    Text(
                                      'LA345678',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          ksizedbox10,
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 0, right: 10),
                            child: Row(
                              children: [
                                Text('PHR : '),
                                Text(
                                  '5565456679',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              children: [
                                Text('Booking ID: '),
                                Text(
                                  '86J8645JE75',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          ksizedbox10,
                          Container(
                            width: 374,
                            decoration: BoxDecoration(),
                            child: Text(
                              '-----------------------------------------------------------------------------------',
                              style: TextStyle(color: kwhite),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                                width: 200,
                                child: Text(
                                  'KMPL Kalaimakal Travels TN 01 BC 3432',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                )),
                          ),
                          ksizedbox10,
                          Container(
                            width: 374,
                            decoration: BoxDecoration(),
                            child: Text(
                              '-----------------------------------------------------------------------------------',
                              style: TextStyle(color: kwhite),
                            ),
                          ),
                          ksizedbox20,
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'TOTAL:',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  '₹ 4,558.00',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                ksizedbox10,
                Row(
                  children: [
                    Text(
                      'Passengers',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ],
                ),
                ksizedbox10,
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Prakash',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Male, 25 years',
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          Text(
                            'Seat No. L17',
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  ),
                  height: 53.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[300]),
                ),
                ksizedbox20,
                Row(
                  children: [
                    Text(
                      'Your ticket will be sent on',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ],
                ),
                ksizedbox10,
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'oyebus@gmail.com',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '+91 876543210',
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  height: 53.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[300]),
                ),
                ksizedbox20,
                Row(
                  children: [
                    Text(
                      'Fare Breakup',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ],
                ),
                ksizedbox10,
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Base Fare',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'GST',
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '₹ 4,454.00',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '₹ 104.5',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ksizedbox10,
                        DottedLine(),
                        ksizedbox10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Text(
                                  '₹ 4,454.00',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  height: 90.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[300]),
                ),
          ksizedbox40,  CustomElevatedButton(
            height: 45.h,
            width: 1.sw,
            onPressed: () {
              Get.to(PaymentsuccesfullView());
              //    Get.toNamed(
              // Routes.BUSLOADINGSPLASH,
              //  );
            },
            text: 'pay',
            color: kred,
            textColor: kwhite,
          ),   ksizedbox30,],
            ),
          ],
        ),
      ),
    );
  }
}
