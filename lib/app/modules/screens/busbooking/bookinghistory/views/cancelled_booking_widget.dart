import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bookinghistory/controllers/bookinghistory_controller.dart';
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
  final bookingCancelledlistController = Get.find<BookinghistoryController>();
  @override
  Widget build(BuildContext context) {

    return  ListView(
      children: [
        GetBuilder<BookinghistoryController>(
          builder: (_) {
            // ignore: avoid_unnecessary_containers
            return bookingCancelledlistController.bookingcancelledlistdata.isEmpty? Center(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/nodatabookingimage.jpg"),
                Text("No cancellations found",style: primaryFont.copyWith(fontSize: 20,fontWeight: FontWeight.bold),)
              ],
            )) : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: bookingCancelledlistController.bookingcancelledlistdata.length,
                itemBuilder: (context, index) {
                  print('booking date');
                  //print(bookingCancelledlistController.bookinghistorydata[index].bookingData.date);
                  return bookingCancelledlistController.bookingcancelledlistdata.isNotEmpty? Padding(
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
                                  '${bookingCancelledlistController.bookingcancelledlistdata[index].busRoute!.startLocation} → ${bookingCancelledlistController.bookingcancelledlistdata[index].busRoute!.endLocation}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              
                                Text(bookingCancelledlistController.bookingcancelledlistdata[index].bookingData!.dateOfJourney.toString())
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
                                    '------------------------------------------------------------------------------')),
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Booking ID: ${bookingCancelledlistController.bookingcancelledlistdata[index].bookingData!.bookingId}'),
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
                                           bookingCancelledlistController.bookingcancelledlistdata[index].bookingData!.isCancelled==null?'': 'Cancelled',
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
                                      'No Cancelled Booking ',
                                      style: TextStyle(
                                         
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp),
                                    )
                                  ]),
                            );;
                });
          }
        ),
                          ksizedbox20,
      ],
    );
  }
}