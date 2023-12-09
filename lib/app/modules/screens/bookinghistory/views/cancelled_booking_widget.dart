import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/bookinghistory/controllers/bookinghistory_controller.dart';
import 'package:oye_bus/app/routes/app_pages.dart';

class BookingCancelledWidget extends GetView<BookinghistoryController> {
   BookingCancelledWidget({Key? key}) : super(key: key);
  
  List containermsg = [
    'Booked',
    'Booked',
    'Complete',
    'Complete',
    'Complete',
  ];
  @override
  Widget build(BuildContext context) {
    return  Container(
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
                                                GestureDetector(
                                                  onTap: (){
                                                    Get.toNamed(Routes.BOOKING_CANCELLATION);
                                                  },
                                                  child: Container(
                                                    height: 27,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                        color: Color(0xffFF0000),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                23)),
                                                    child: Center(
                                                      child: Text(
                                                        'Cancelled',
                                                        style: TextStyle(
                                                            color: kwhite,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400),
                                                      ),
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
                      );
  }
}