
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bookinghistory/controllers/bookinghistory_controller.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bustrip_reviews/views/bustrip_reviews_view.dart';
import 'package:oye_bus/app/modules/screens/busbooking/reservation_details/views/reservation_details_view.dart';
import 'package:oye_bus/app/modules/screens/profile/controllers/profile_controller.dart';
import 'package:oye_bus/app/modules/screens/ticket_details/views/new_ticket_view.dart';
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
  final profileController = Get.find<ProfileController>();
 
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BookinghistoryController());
    return  ListView(
          children: [
            GetBuilder<BookinghistoryController>(
              builder: (_) {
                print(':::::::::::::Booking history::::::::::::datas');
                
                print(bookinghistoryController.bookinghistorydata);
                return bookinghistoryController.bookinghistorydata!.isNotEmpty? Container(
                                    child: ListView.builder(
                                        physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: bookinghistoryController.bookinghistorydata!.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 10, right: 10),
                                            child: GestureDetector(
                                              onTap: () {
                                               Get.to(NewTicketView(bookingDetail: bookinghistoryController.bookinghistorydata![index], 
                                               ));
                                                // Get.to(TicketDetailsView(
                                                //   bookingDetail: bookinghistoryController.bookinghistorydata![index]));
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
                                                            
                                                            '${bookinghistoryController.bookinghistorydata![index].busRoute!.startLocation} → ${bookinghistoryController.bookinghistorydata![index].busRoute!.endLocation}',
                                                            style: const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w500,
                                                            ),
                                                          ),
                                                          Text(bookinghistoryController.bookinghistorydata![index].bookingData!.dateOfJourney.toString())
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
                                                          Text('PNR : ${bookinghistoryController.bookinghistorydata![index].bookingData!.pnrNumber}'),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text('Booking ID: ${bookinghistoryController.bookinghistorydata![index].bookingData!.bookingId}'),
                                                              Container(
                                                                height: 27,
                                                                width: 100,
                                                                decoration: BoxDecoration(
                                                                    color: const Color(0xff05903C),
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
                                                              Get.to(BustripReviewsView(
                                                                bookingDetail: bookinghistoryController.bookinghistorydata![index],
                                                              ));
                                                            },
                                                            child: const Text(
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