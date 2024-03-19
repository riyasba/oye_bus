import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/booking_canceled_list_model.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/booking_history_model.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bookinghistory/controllers/bookinghistory_controller.dart';
import 'package:oye_bus/app/routes/app_pages.dart';


import '../controllers/booking_cancellation_controller.dart';

class BookingCancellationView extends GetView<BookingCancellationController> {
  BookingCancelledDetail bookingHistoryModel;
   BookingCancellationView({Key? key,required this.bookingHistoryModel}) : super(key: key);
  bool ischeck = false;
    final bookingCancelledlistController = Get.find<BookinghistoryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          centerTitle: true,
          leading:GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back)),
          title: Text('Cancellation',
          style:appbarfont),
          actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset('assets/offers_icon/supporticon.png'),
          )
          ],
         ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 30),
        child: ListView(
          children: [
            GetBuilder<BookinghistoryController>(
              builder: (_) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount:1,
                  itemBuilder: (context,index){
                    return Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Container(
                          height: 140.h,
                          width: 399.w,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8,right: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                    Text(bookingHistoryModel.busData!.busName.toString(),
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Proxima ',
                            
                                    ),
                                    ),
                                    Container(
                                      width: 399.w,
                                      child: Text('------------------------------------------------------------------------------',
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: kgrey
                                      ),)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(bookingHistoryModel.busRoute!.startLocation.toString(),
                                        style: TextStyle(
                                             color: Colors.grey,
                                            fontSize: 15.5.sp,
                                              fontFamily: 'Proxima ',
                                        ),),
                                        Icon(Icons.arrow_forward),
                                        Text(bookingHistoryModel.busRoute!.endLocation.toString(),
                                      style: TextStyle(
                                           color: Colors.grey,
                                            fontSize: 15.5.sp,
                                              fontFamily: 'Proxima ',
                                      ),)
                                      ],
                                    ),
                                     Container(
                                      width: 399.w,
                                      child: Text('------------------------------------------------------------------------------',
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: kgrey
                                      ),)),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(bookingHistoryModel.busRoute!.departureTime,
                                           style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15.5.sp,
                                              fontFamily: 'Proxima ',
                                          ),),
                                          Text(bookingHistoryModel.busRoute!.arrivalTime,
                                           style: TextStyle(
                                               fontSize: 15.5.sp,
                                            color: Colors.grey,
                                              fontFamily: 'Proxima ',
                                          ),)
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(bookingHistoryModel.bookingData!.dateOfJourney.toString(),
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.sp,
                                              fontFamily: 'Proxima ',
                                          ),),
                                          Text(bookingHistoryModel.bookingData!.dateOfJourney.toString(),
                                           style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.sp,
                                              fontFamily: 'Proxima ',
                                          ),
                                          )
                                        ],
                                      )
                              ],
                            ),
                          ),
                        ),
                        ksizedbox20,
                        Text('Journey Details',
                        style: TextStyle(
                            fontFamily: 'Proxima ',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600
                        ),),
                        ksizedbox10,
                        Row(
                          children: [
                            Text('PNR Number : ',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: kgrey,
                              fontFamily: 'Proxima ',
                            ),),
                            Text(bookingHistoryModel.bookingData!.pnrNumber.toString(),
                             style: TextStyle(
                              fontSize: 16.sp,
                            
                              fontFamily: 'Proxima ',
                              fontWeight: FontWeight.w600
                            ),
                            )
                          ],
                        ),
                      
                      
                  
                     
                    ],
                  );
                  },
                  
                );
              }
            ),
          ],
        ),
      ),
      
    );
  }
}
