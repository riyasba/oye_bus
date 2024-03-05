import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/home/controllers/home_controller.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bookinghistory/controllers/bookinghistory_controller.dart';

import '../controllers/pnr_statusview_controller.dart';

class PnrStatusviewView extends GetView<PnrStatusviewController> {
   PnrStatusviewView({Key? key}) : super(key: key);

  final pnrcheckController = Get.find<HomeController>();
  final historyController = Get.find<BookinghistoryController>();

  //   String getSeatsDetail(List<String>? seats){
  //   String getseatdetails = "";
  //    seats!.forEach((element) {
  //     getseatdetails = getseatdetails + "$element ";
  //     });
  //    return getseatdetails;
  // }
String getActualTime(String time){
  var temptime = time.split(":");
  String getTemptime = '${temptime[0]}:${temptime[1]}';
  return getTemptime; 
}
  String getSeatsDetails(List<String>? seats){
   String getseatsdetails ='';
   seats!.forEach((element) {
    getseatsdetails=getseatsdetails +"$element";
   });
   return getseatsdetails;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      centerTitle: true,
     title: Text('PNR Details')
     ),
      body:Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
        child: ListView(
          children: [
            GetBuilder<HomeController>(
              builder: (_) {
                return pnrcheckController.checkpnrdata.isEmpty?Center(child: Text('No Data')): Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                                    
                          width: 374.w,
                          decoration: BoxDecoration(
                            color: Color(0xffFF0000),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Text('${historyController.bookinghistorydata!.isEmpty?"": historyController.bookinghistorydata!.first.busRoute!.startLocation}  - ${historyController.bookinghistorydata!.isEmpty?"": historyController.bookinghistorydata!.first.busRoute!.endLocation}',
                                    // style: TextStyle(
                                    //   //fontFamily: 'Proxima',
                                    //   fontSize: 20.5.sp,
                                    //   fontWeight: FontWeight.w600,
                                    //   color: kwhite
                                    // ),),
                                   
                                  ],
                                ),
                                // Text(historyController.bookinghistorydata!.isEmpty?'':historyController.bookinghistorydata!.first.bookingData!.dateOfJourney.toString(),
                                // style: TextStyle(
                                //   fontSize: 16.sp,
                                //   //fontFamily: 'Proxima',
                                //   fontWeight: FontWeight.w400,
                                //   color: kwhite
                                // ),),
                                // ksizedbox10,
                                // Container(
                                //   width: 374.w,
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(left: 4,right: 4),
                                //     child: Text('---------------------------------------------------------------------------',
                                //     style: TextStyle(
                                //       color: kwhite
                                //     ),),
                                //   )),
                                //   ksizedbox20,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Bus Name',
                                      style: TextStyle(
                                        //fontFamily: 'Proxima ',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: kwhite
                                      ),),
                                      Text('Seat Number',
                                        style: TextStyle(
                                        //fontFamily: 'Proxima ',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: kwhite))
                                    ],
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(top: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 150.w,
                                          child:pnrcheckController.checkpnrdata.isNotEmpty? Text(pnrcheckController.checkpnrdata.first!.busName.toString(),
                                          style: TextStyle(
                                            //fontFamily: 'Proxima ',
                                            color: kwhite,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700
                                          ),):Text(''),
                                        ),
                                       pnrcheckController.checkpnrdata.isNotEmpty? Text(getSeatsDetails(pnrcheckController.checkpnrdata.first!.seatNumbers),
                                        textAlign: TextAlign.start,
                                         style: TextStyle(
                                          
                                          color: kwhite,
                                            //fontFamily: 'Proxima ',
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700
                                          ),
                                        ):Text('')
                                      ],
                                    ),
                                  ),
                                     ksizedbox20,
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Ticket ID',
                                      style: TextStyle(
                                        //fontFamily: 'Proxima ',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: kwhite
                                      ),),
                                      Text('Bus Number',
                                        style: TextStyle(
                                        //fontFamily: 'Proxima ',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: kwhite))
                                    ],
                                  ),
                               
                                  ksizedbox20,
                                     Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('',
                                        style: TextStyle(
                                          //fontFamily: 'Proxima ',
                                          color: kwhite,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700
                                        ),),
                                        pnrcheckController.checkpnrdata.isNotEmpty? Text(pnrcheckController.checkpnrdata.first!.busRegisterNumber.toString(),
                                        textAlign: TextAlign.start,
                                         style: TextStyle(
                                          
                                          color: kwhite,
                                            //fontFamily: 'Proxima ',
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700
                                          ),
                                        ):Text('')
                                      ],
                                    ),
                                  ),
                                      ksizedbox20,
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('PNR Number',
                                      style: TextStyle(
                                        //fontFamily: 'Proxima ',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: kwhite
                                      ),),
                                     pnrcheckController.checkpnrdata.isEmpty?Text(''): Text(pnrcheckController.checkpnrdata.first!.pnrNumber.toString(),
                                       style: TextStyle(
                                          
                                          color: kwhite,
                                            //fontFamily: 'Proxima ',
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700
                                          ),),
                                     
                                    ],
                                  ),
                                   
                                  ksizedbox20,
                                       Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Arrival',
                                      style: TextStyle(
                                        //fontFamily: 'Proxima ',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: kwhite
                                      ),),
                                      Text('Drop',
                                        style: TextStyle(
                                        //fontFamily: 'Proxima ',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: kwhite))
                                    ],
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(top: 8),
                                  //   child: Row(
                                  //     crossAxisAlignment: CrossAxisAlignment.start,
                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       Text(historyController.bookinghistorydata!.first.busRoute!.departureTime,
                                  //       style: TextStyle(
                                  //         //fontFamily: 'Proxima ',
                                  //         color: kwhite,
                                  //         fontSize: 16.sp,
                                  //         fontWeight: FontWeight.w700
                                  //       ),),
                                  //       Text(historyController.bookinghistorydata!.first.busRoute!.arrivalTime,
                                  //       textAlign: TextAlign.start,
                                  //        style: TextStyle(
                                          
                                  //         color: kwhite,
                                  //           //fontFamily: 'Proxima ',
                                  //           fontSize: 16.sp,
                                  //           fontWeight: FontWeight.w700
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  // ),
                                  ksizedbox30,
                                   Container(
                                  width: 374.w,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4,right: 4),
                                    child: Text('---------------------------------------------------------------------------',
                                    style: TextStyle(
                                      color: kwhite
                                    ),),
                                  )),
                                  ksizedbox20,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('TOTAL:',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        //fontFamily: 'Proxima ',
                                        color: kwhite
                                      ),),
                                       Text('₹ ${pnrcheckController.checkpnrdata.isEmpty?'':pnrcheckController.checkpnrdata.first!.totalPrice}',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        //fontFamily: 'Proxima ',
                                        color: kwhite
                                      ),)
                                    ],
                                  ),
                                  ksizedbox40,
                              
                              ],
                            ),
                          ),
                        ),
                       Positioned(
                        top: 56,
                        right: 330,
                        child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                    )),
                        Positioned(
                          top: 56,
                
                          left: 330,
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.white,
                          )), 
                           Positioned(
                          top: 357,
                          right: 330,
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.white,
                          )),
                            Positioned(
                          top: 357,
                          left: 330,
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.white,
                          )),
                          
                           
                      ],
                    ), 
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                                  children: [
                                    Text('Note: ',
                                    style: TextStyle(
                                      color: kred
                                    ),),
                                    Column(
                                      children: [
                                        Text('Just show your QR code while boarding bus.',
                                                                     ),
                                      ],
                                    )
                                  ],
                                ),
                        ),
                              ksizedbox20,
                  ],
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
