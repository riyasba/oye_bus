
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bookinghistory/controllers/bookinghistory_controller.dart';
import 'package:oye_bus/app/modules/screens/ticket_details/views/ticket_details_view.dart';
import 'package:oye_bus/app/routes/app_pages.dart';
import 'package:flutter_svg/svg.dart';


class BookingCompletedWidget extends GetView<BookinghistoryController> {
   BookingCompletedWidget({Key? key}) : super(key: key);
  
  List containermsg = [
    'Booked',
    'Booked',
    'Complete',
    'Complete',
    'Complete',
  ];
  final bookinghistoryController = Get.find<BookinghistoryController>();
  @override
  Widget build(BuildContext context) {
    return  ListView(
          children: [
            GetBuilder<BookinghistoryController>(
              builder: (_) {
                return bookinghistoryController.bookinghistorydata.isNotEmpty? Container(
                                    child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: bookinghistoryController.bookinghistorydata.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 10, right: 10),
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.to(TicketDetailsView(
                                                  bookingDetail: bookinghistoryController.bookinghistorydata[index]));
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
                                                            '${bookinghistoryController.bookinghistorydata[index].bookingData!.boarding} → ${bookinghistoryController.bookinghistorydata[index].bookingData!.dropping}',
                                                            style: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight: FontWeight.w500,
                                                            ),
                                                          ),
                                                          Text(bookinghistoryController.bookinghistorydata[index].bookingData!.date.toString())
                                                          //Text('10, Nov 2023')
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
                                                          Text('PNR : 2345678908'),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text('Booking ID: ${bookinghistoryController.bookinghistorydata[index].bookingData!.bookingId}'),
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
                                                                  'Booked',
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
                                                          GestureDetector(
                                                            onTap: (){
                                                              Get.toNamed(Routes.BUSTRIP_REVIEWS);
                                                            },
                                                            child: Text(
                                                              'You can rate once you complete thee trip',
                                                              style: TextStyle(
                                                                  color: Color(0xff1675DB),
                                                                  fontSize: 10),
                                                            ),
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
                                  ):Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                     SizedBox(
                      height: 200,
                     ),
                        Image.asset(
                          'assets/images/nodatabookingimage.jpg',
                          height: 220,
                          fit: BoxFit.fitHeight,
                        ),
                        ksizedbox20,
                        Text(
                          'No Bookings ',
                          style: TextStyle(
                             
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp),
                        )
                      ]),
                );
              }
            ),
            ksizedbox20,
          ],
        );
                       
     
  }
}