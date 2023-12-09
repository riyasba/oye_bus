import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/bookinghistory/views/cancelled_booking_widget.dart';
import 'package:oye_bus/app/modules/screens/bookinghistory/views/completed_booking_wiget.dart';
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading:  GestureDetector(
                            onTap: (){
                              Get.back();
                            },
                            child: Icon(Icons.arrow_back)),
                     
          centerTitle: true,
          title: Text('My Bookings',
           style: appbarfont,),
           actions: [
             Padding(
               padding: const EdgeInsets.only(right: 10),
               child: Image.asset('assets/offers_icon/bellicon.png'),
             )
           ],
           bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            automaticIndicatorColorAdjustment: true,
            labelColor: kwhite,
            padding: const EdgeInsets.only(right: 15, left: 15),
            unselectedLabelColor: Colors.black,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color:  controller.containerindex.value == 0
                                       ? Colors.grey.shade200: Color(0xffFFC107)),
            tabs: [
                Tab(
                  text: 'Completed',
                ),
                Tab(
                  text: 'Cancelled',
                )
           ]),

        ),
          // appBar: PreferredSize(
            
          //     preferredSize: Size.fromHeight(
          //       100,
          //     ),
          //     child: SafeArea(
          //       child: Column(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(left: 8, right: 8),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 GestureDetector(
          //                   onTap: (){
          //                     Get.back();
          //                   },
          //                   child: Icon(Icons.arrow_back)),
          //                 Text(
          //                   'My Bookings',
          //                   style: TextStyle(
          //                     fontSize: 20,
          //                   ),
          //                 ),
          //                 Image.asset('assets/offers_icon/bellicon.png')
          //               ],
          //             ),
          //           ),
                  
          //           ksizedbox20,
          //           Obx(()=>
          //              Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceAround,
          //               children: [
          //                 GestureDetector(
          //                   onTap: () {
          //                     controller.containerindex(0);
          //                     controller.update();
          //                   },
          //                   child: Container(
          //                     height: 45,
          //                     width: 160,
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(23),
          //                         color: controller.containerindex.value == 0
          //                             ? Color(0xffFFC107)
          //                             : Colors.grey.shade200),
          //                     child: Center(
          //                       child: Text(
          //                         'Completed',
          //                         style: TextStyle(
          //                             color: controller.containerindex.value == 0
          //                                 ? Colors.black
          //                                 : kgrey,
          //                             fontWeight: FontWeight.w500),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 GestureDetector(
          //                   onTap: () {
          //                     controller.containerindex(1);
          //                     controller.update();
          //                   },
          //                   child: Container(
          //                     height: 45,
          //                     width: 160,
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(23),
          //                         color: controller.containerindex.value == 1
          //                             ? Color(0xffFFC107)
          //                             : Colors.grey.shade200),
          //                     child: Center(
          //                       child: Text(
          //                         'Cancelled',
          //                         style: TextStyle(
          //                             color: controller.containerindex.value == 1
          //                                 ? Colors.black
          //                                 : kgrey,
          //                             fontWeight: FontWeight.w500),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     )
              
          //     ),
          body: 
              TabBarView(children: [
                  BookingCompletedWidget(),
                BookingCancelledWidget(),
              
             
            ],
          )),
    );
  }
}
