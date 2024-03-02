import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';

import '../controllers/pnr_statusview_controller.dart';

class PnrStatusviewView extends GetView<PnrStatusviewController> {
  const PnrStatusviewView({Key? key}) : super(key: key);
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
            Column(
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
                                Text('Chennai  - Bengaluru',
                                style: TextStyle(
                                  //fontFamily: 'Proxima',
                                  fontSize: 20.5.sp,
                                  fontWeight: FontWeight.w600,
                                  color: kwhite
                                ),),
                               
                              ],
                            ),
                            Text('10 Nov 2023, Saturday',
                            style: TextStyle(
                              fontSize: 16.sp,
                              //fontFamily: 'Proxima',
                              fontWeight: FontWeight.w400,
                              color: kwhite
                            ),),
                            ksizedbox10,
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
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 150.w,
                                      child: Text('KMPL Kalaimakal Travels',
                                      style: TextStyle(
                                        //fontFamily: 'Proxima ',
                                        color: kwhite,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700
                                      ),),
                                    ),
                                    Text('L17',
                                    textAlign: TextAlign.start,
                                     style: TextStyle(
                                      
                                      color: kwhite,
                                        //fontFamily: 'Proxima ',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700
                                      ),
                                    )
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
                                 
                                ],
                              ),
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
                                 
                                ],
                              ),
                              ksizedbox20,
                                 Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('LA345678',
                                    style: TextStyle(
                                      //fontFamily: 'Proxima ',
                                      color: kwhite,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700
                                    ),),
                                    Text('TN 01 BC 3432',
                                    textAlign: TextAlign.start,
                                     style: TextStyle(
                                      
                                      color: kwhite,
                                        //fontFamily: 'Proxima ',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700
                                      ),
                                    )
                                  ],
                                ),
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
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('21:50 PM',
                                    style: TextStyle(
                                      //fontFamily: 'Proxima ',
                                      color: kwhite,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700
                                    ),),
                                    Text('06:15AM',
                                    textAlign: TextAlign.start,
                                     style: TextStyle(
                                      
                                      color: kwhite,
                                        //fontFamily: 'Proxima ',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700
                                      ),
                                    )
                                  ],
                                ),
                              ),
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
                                   Text('₹ 4,558.00',
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
            ),
          ],
        ),
      ),
    );
  }
}
