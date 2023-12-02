import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/contsands.dart';
import 'package:oye_bus/app/routes/app_pages.dart';

import '../controllers/bookinghistory_controller.dart';

class BookinghistoryView extends GetView<BookinghistoryController> {
  BookinghistoryView({Key? key}) : super(key: key);

  List containermsg = [
    'Booked',
    'Booked',
    'Complete',
    'Complete',
    'Complete',
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(BookinghistoryController());
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              100,
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back),
                        Text(
                          'My Bookings',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Image.asset('assets/offers_icon/bellicon.png')
                      ],
                    ),
                  ),
                  ksizedbox20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.containerindex(0);
                          controller.update();
                        },
                        child: Container(
                          height: 45,
                          width: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(23),
                              color: controller.containerindex.value == 0
                                  ? Color(0xffFFC107)
                                  : Colors.grey.shade200),
                          child: Center(
                            child: Text(
                              'Completed',
                              style: TextStyle(
                                  color: controller.containerindex.value == 0
                                      ? Colors.black
                                      : kgrey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.containerindex(1);
                          controller.update();
                        },
                        child: Container(
                          height: 45,
                          width: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(23),
                              color: controller.containerindex.value == 1
                                  ? Color(0xffFFC107)
                                  : Colors.grey.shade200),
                          child: Center(
                            child: Text(
                              'Cancelled',
                              style: TextStyle(
                                  color: controller.containerindex.value == 1
                                      ? Colors.black
                                      : kgrey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
        body: ListView(
          children: [
            Obx(
              () => Column(
                children: [
                  if (controller.containerindex.value == 0)
                    Container(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 10, right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.TICKET_DETAILS);
                                },
                                child: Container(
                                  height: 125,
                                  width: 387,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey.shade200,
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          offset: Offset(0.0, 0.75),
                                          blurRadius: 1,
                                          color: kgrey)
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Chennai → Bangalore',
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text('10, Nov 2023')
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        child: Container(
                                          width: 387,
                                          child: Text(
                                              '------------------------------------------------------------------------------'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('PHR : 2345678908'),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Booking ID: 3424SS8AY27'),
                                                Container(
                                                  height: 27,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff05903C),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              23)),
                                                  child: Center(
                                                    child: Text(
                                                      containermsg[index],
                                                      style: TextStyle(
                                                          color: kwhite,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Text(
                                              'You can rate once you complete thee trip',
                                              style: TextStyle(
                                                  color: Color(0xff1675DB),
                                                  fontSize: 10),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  if (controller.containerindex.value == 1)
                    Container(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 10, right: 10),
                              child: Container(
                                height: 125,
                                width: 387,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey.shade200,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        offset: Offset(0.0, 0.75),
                                        blurRadius: 1,
                                        color: kgrey)
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Chennai → Bangalore',
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text('10, Nov 2023')
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Container(
                                          width: 387,
                                          child: Text(
                                              '------------------------------------------------------------------------------')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('PHR : 2345678908'),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Booking ID: 3424SS8AY27'),
                                              Container(
                                                height: 27,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffFF0000),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            23)),
                                                child: Center(
                                                  child: Text(
                                                    containermsg[index],
                                                    style: TextStyle(
                                                        color: kwhite,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                ],
              ),
            ),
          ],
        ));
  }
}
