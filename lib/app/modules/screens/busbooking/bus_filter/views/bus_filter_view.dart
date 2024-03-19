
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/home/controllers/home_controller.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bus_filter/views/widgets/bus_arrivaltime_destination_widget.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bus_filter/views/widgets/bus_boardingpoint_widget.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bus_filter/views/widgets/bus_facilites_widget.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bus_filter/views/widgets/bus_features_widget.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bus_filter/views/widgets/bus_operator_widget.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bus_filter/views/widgets/busdropping_widget.dart';

import '../controllers/bus_filter_controller.dart';

class BusFilterView extends GetView<BusFilterController> {
   BusFilterView({Key? key}) : super(key: key);
  var boardingController = TextEditingController();

  final busfilterController = Get.find<HomeController>();
  final amenitiesController = Get.find<BusFilterController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: kwhite,
    appBar: AppBar(backgroundColor: kwhite,
      centerTitle: true,
      title:  Text('Filter Buses',
                      style: appbarfont),

                      leading: GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back_ios)),
            // actions: [
            //      Padding(
            //        padding: const EdgeInsets.only(right: 10),
            //        child: Image.asset('assets/offers_icon/filtercancelicon.png'),
            //      )
            // ],
                 
    ),
      body:ListView(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 30),
              child: Column(
                children: [
                
                  Obx(()=>
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                             Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Container(
                                  height: 1.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300]
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    controller.colorindex(0);
                                    controller.update();
                                  },
                                  child: Container(
                                    height: 35.h,
                                    width: 150.w,
                                    decoration: BoxDecoration(
                                                         
                                      color:controller.colorindex.value==0? Colors.white:
                                        Colors.grey[200]
                                      
                                    ),
                                    child: Center(
                                      child: Text('Sort by',
                                      style: TextStyle(
                                        color: controller.colorindex.value==0?kred:kblack,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Proxima '
                                      ),),
                                    ),
                                  ),
                                ),
                                //   Container(
                                //   height: 1.h,
                                //   width: 150.w,
                                //   decoration: BoxDecoration(
                                //     color: Colors.grey[300]
                                //   ),
                                // ),
                                //  GestureDetector(
                                //   onTap: (){
                                //     controller.colorindex(1);
                                //     controller.update();
                                //   },
                                //    child: Container(
                                //     height: 40.h,
                                //     width: 150.w,
                                //     decoration: BoxDecoration(
                                                          
                                //        color:controller.colorindex.value==1? kwhite:
                                //         Colors.grey[200]
                                //     ),
                                //      child: Center(
                                //       child: Text('Bus departure ',
                                //       textAlign: TextAlign.center,
                                //       style: TextStyle(
                                        
                                //         fontSize: 14.sp,
                                //         fontWeight: FontWeight.w400,
                                //         fontFamily: 'Proxima ',
                                //         color: controller.colorindex.value==1?kred:Colors.black
                                //       ),),
                                //     ),
                                //    ),
                                //  ),
                                  Container(
                                  height: 1.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300]
                                  ),
                                ),
                                 GestureDetector(
                                  onTap: (){
                                    controller.colorindex(2);
                                    controller.update();
                                  },
                                   child: Container(
                                    height: 40.h,
                                    width: 150.w,
                                    decoration: BoxDecoration(
                                                          
                                     color:controller.colorindex.value==2? kwhite:
                                        Colors.grey[200]
                                    ),
                                     child: Center(
                                      child: Text('Bus Type',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Proxima ',
                                        color: controller.colorindex.value==2?kred:Colors.black
                                      ),),
                                    ),
                                 ),
                                 ),
                                  Container(
                                  height: 1.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300]
                                  ),
                                ),
                                //  GestureDetector(
                                //   onTap: (){
                                //      controller.colorindex(3);
                                //      controller.update();
                                //   },
                                //    child: Container(
                                //     height: 40.h,
                                //     width: 150.w,
                                //     decoration: BoxDecoration(
                                //     color:controller.colorindex.value==3? kwhite:
                                //         Colors.grey[200]
                                //     ),
                                //      child: Center(
                                //       child: Text('Single Window Sleeper/Seater',
                                //       textAlign: TextAlign.center,
                                //       style: TextStyle(
                                        
                                //         fontSize: 14.sp,
                                //         fontWeight: FontWeight.w400,
                                //         fontFamily: 'Proxima ',
                                //         color: controller.colorindex.value==3?kred:Colors.black
                                //       ),),
                                //     ),
                                //    ),
                                //  ),
                                Container(
                                  height: 1.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300]
                                  ),
                                ),
                                //  GestureDetector(
                                //   onTap: (){
                                //     controller.colorindex(4);
                                //     controller.update();
                                //   },
                                //    child: Container(
                                //     height: 40.h,
                                //     width: 150.w,
                                //     decoration: BoxDecoration(
                                //       color:controller.colorindex.value==4? kwhite:
                                //         Colors.grey[200]
                                //     ),
                                //             child: Center(
                                //       child: Text('Boarding Point',
                                //       textAlign: TextAlign.center,
                                //       style: TextStyle(
                                        
                                //         fontSize: 14.sp,
                                //         fontWeight: FontWeight.w400,
                                //         fontFamily: 'Proxima ',
                                //         color: controller.colorindex.value==4?kred:Colors.black
                                //       ),),
                                //     ),
                                //    ),
                                //  ),
                                //   Container(
                                //   height: 1.h,
                                //   width: 150.w,
                                //   decoration: BoxDecoration(
                                //     color: Colors.grey[300]
                                //   ),
                                // ),
                                //  GestureDetector(
                                //   onTap: (){
                                //     controller.colorindex(5);
                                //     controller.update();
                                //   },
                                //    child: Container(
                                //     height: 40.h,
                                //     width: 150.w,
                                //     decoration: BoxDecoration(
                                //       color:controller.colorindex.value==5? kwhite:
                                //         Colors.grey[200]
                                //     ),
                                //        child: Center(
                                //       child: Text('Dropping Point',
                                //       textAlign: TextAlign.center,
                                //       style: TextStyle(
                                        
                                //         fontSize: 14.sp,
                                //         fontWeight: FontWeight.w400,
                                //         fontFamily: 'Proxima ',
                                //         color: controller.colorindex.value==5?kred:Colors.black
                                //       ),),
                                //     ),
                                //     ),
                                //  ),  
                                 Container(
                                  height: 1.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300]
                                  ),
                                ),
                                 GestureDetector(
                                  onTap: (){
                                    controller.colorindex(6);
                                    controller.update();
                                  },
                                   child: Container(
                                    height: 40.h,
                                    width: 150.w,
                                    decoration: BoxDecoration(
                                         color:controller.colorindex.value==6? kwhite:
                                        Colors.grey[200]
                                    ),
                                     child: Center(
                                      child: Text('Bus Operator',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Proxima ',
                                        color: controller.colorindex.value==6?kred:Colors.black
                                      ),),
                                    ),
                                   ),
                                 ),
                                 Container(
                                  height: 1.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300]
                                  ),
                                ),
                                 GestureDetector(
                                  onTap: (){
                                    controller.colorindex(7);
                                    controller.update();
                                  },
                                   child: Container(
                                    height: 40.h,
                                    width: 150.w,
                                    decoration: BoxDecoration(
                                         color:controller.colorindex.value==7? kwhite:
                                        Colors.grey[200]
                                    ),
                                    child: Center(
                                      child: Text('Bus Facilities',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Proxima ',
                                        color: controller.colorindex.value==7?kred:Colors.black
                                      ),),
                                    ),
                                   ),
                                 ),
                                   Container(
                                  height: 1.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300]
                                  ),
                                ),
                                //  GestureDetector(
                                //   onTap: (){
                                //     controller.colorindex(8);
                                //     controller.update();
                                //   },
                                //    child: Container(
                                //     height: 40.h,
                                //     width: 150.w,
                                //     decoration: BoxDecoration(
                                //          color:controller.colorindex.value==8? kwhite:
                                //         Colors.grey[200]
                                //     ),
                                //          child: Center(
                                //       child: Text('Bus Features',
                                //       textAlign: TextAlign.center,
                                //       style: TextStyle(
                                        
                                //         fontSize: 14.sp,
                                //         fontWeight: FontWeight.w400,
                                //         fontFamily: 'Proxima ',
                                //         color: controller.colorindex.value==8?kred:Colors.black
                                //       ),),
                                //     ),
                                //    ),
                                //  ),
                                //    Container(
                                //   height: 1.h,
                                //   width: 150.w,
                                //   decoration: BoxDecoration(
                                //     color: Colors.grey[300]
                                //   ),
                                // ),
                                //  GestureDetector(
                                //   onTap: (){
                                //     controller.colorindex(9);
                                //     controller.update();
                                //   },
                                //    child: Container(
                                //     height: 40.h,
                                //     width: 150.w,
                                //     decoration: BoxDecoration(
                                //          color:controller.colorindex.value==9? kwhite:
                                //         Colors.grey[200]
                                //     ),
                                //        child: Center(
                                //       child: Text('Bus arrival time at destination',
                                //       textAlign: TextAlign.center,
                                //       style: TextStyle(
                                        
                                //         fontSize: 14.sp,
                                //         fontWeight: FontWeight.w400,
                                //         fontFamily: 'Proxima ',
                                //         color: controller.colorindex.value==9?kred:Colors.black
                                //       ),),
                                //     ),
                                //    ),
                                //  ),   
                                 Container(
                                  height: 1.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300]
                                  ),
                                ),
                              ],
                            ),
                        
                         
                          if(controller.colorindex.value==0)
                          Container(
                            child: Column(
                            
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 120.w,
                                      child: Text('Low - Price')),
                                    Checkbox( 
                                      activeColor: kred,
                                      shape: CircleBorder(),
                                      value: controller.checkbox2.value, 
                                    onChanged:(value){
                                     controller.checkbox2.value=value!;
                                    } )
                                  ],
                                ),
                                  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 120.w,
                                      child: Text('High - Price')),
                                    Checkbox( 
                                      activeColor: kred,
                                      shape: CircleBorder(),
                                      value: controller.checkbox3.value, 
                                    onChanged:(value){
                                     controller.checkbox3.value=value!;
                                    } )
                                  ],
                                ),
                            
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 120.w,
                                      child: Text('Early departure')),
                                    Checkbox( activeColor: kred,
                                      
                                      shape: CircleBorder(),
                                      value: controller.checkbox4.value, 
                                    onChanged:(value){
                                     controller.checkbox4.value=value!;
                                    } )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 120.w,
                                      child: Text('Late departure')),
                                    Checkbox( activeColor: kred,
                                      
                                      shape: CircleBorder(),
                                      value: controller.checkbox5.value, 
                                    onChanged:(value){
                                     controller.checkbox5.value=value!;
                                    } )
                                  ],
                                )
                              ],
                            ),
                          ),
                          // if(controller.colorindex.value==1)
                          // Container(
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Row(
                                                         
                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Container(
                          //             width: 20.w,
                          //             child: Image.asset('assets/offers_icon/depatureicon1.png')),
                          //           Padding(
                          //             padding: const EdgeInsets.only(top: 10,left: 3),
                          //             child: Column(
                          //               mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //               crossAxisAlignment: CrossAxisAlignment.start,
                          //               children: [
                          //                 Container(
                          //                   width: 95.w,
                          //                   child: Text('06:00 - 12:00')),
                          //                 Container(
                          //                   width:95.w,
                          //                   child: Text('Morning ',
                          //                   style: TextStyle(
                          //                     fontSize: 11.sp
                          //                   ),),
                          //                 )
                          //               ],
                          //             ),
                          //           ),
                          //           Checkbox( activeColor: kred,
                                      
                          //             shape: CircleBorder(),
                          //             value: controller.depatcheck1.value, 
                          //           onChanged:(value){
                          //            controller.depatcheck1.value=value!;
                          //           } )
                          //         ],
                          //       ),
                          //         Row(
                                                         
                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Container(
                          //             width: 20.w,
                          //             child: Image.asset('assets/offers_icon/depatureicon2.png')),
                          //           Padding(
                          //             padding: const EdgeInsets.only(top: 10,left: 3),
                          //             child: Column(
                          //               mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //               crossAxisAlignment: CrossAxisAlignment.start,
                          //               children: [
                          //                 Container(
                          //                   width: 95.w,
                          //                   child: Text('12:00 - 18:00')),
                          //                 Container(
                          //                   width: 95.w,
                          //                   child: Text('Afternoon',
                          //                   style: TextStyle(
                          //                     fontSize: 11.sp
                          //                   ),),
                          //                 )
                          //               ],
                          //             ),
                          //           ),
                          //           Checkbox( activeColor: kred,
                                      
                          //             shape: CircleBorder(),
                          //             value: controller.depatcheck2.value, 
                          //           onChanged:(value){
                          //            controller.depatcheck2.value=value!;
                          //           } )
                          //         ],
                          //       ),
                          //       Row(
                                                         
                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Container(
                          //             width: 20.w,
                          //             child: Image.asset('assets/offers_icon/depatureicon3.png',
                                
                          //             ),
                          //           ),
                          //           Padding(
                          //             padding: const EdgeInsets.only(top: 10,left: 3),
                          //             child: Column(
                          //               mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //               crossAxisAlignment: CrossAxisAlignment.start,
                          //               children: [
                          //                 Container(
                          //                   width:95.w,
                          //                   child: Text('18:00 - 24:00')),
                          //                 Container(
                          //                   width: 95.w,
                          //                   child: Text('Evening',
                          //                   style: TextStyle(
                          //                     fontSize: 11.sp
                          //                   ),),
                          //                 )
                          //               ],
                          //             ),
                          //           ),
                          //           Checkbox( activeColor: kred,
                                      
                          //             shape: CircleBorder(),
                          //             value: controller.depatcheck3.value, 
                          //           onChanged:(value){
                          //            controller.depatcheck3.value=value!;
                          //           } )
                          //         ],
                          //       ),
                          //         Row(
                                                         
                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Container(
                          //             width: 20.w,
                          //             child: Image.asset('assets/offers_icon/depatureicon4.png')),
                          //           Padding(
                          //             padding: const EdgeInsets.only(top: 10,left: 3),
                          //             child: Column(
                          //               mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //               crossAxisAlignment: CrossAxisAlignment.start,
                          //               children: [
                          //                 Container(
                          //                   width:95.w,
                          //                   child: Text('00:00 - 06:00')),
                          //                 Container(
                          //                   width: 95.w,
                          //                   child: Text('Night',
                          //                   style: TextStyle(
                          //                     fontSize: 11.sp
                          //                   ),),
                          //                 )
                          //               ],
                          //             ),
                          //           ),
                          //           Checkbox( activeColor: kred,
                                      
                          //             shape: CircleBorder(),
                          //             value: controller.depatcheck4.value, 
                          //           onChanged:(value){
                          //            controller.depatcheck4.value=value!;
                          //           } )
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          if(controller.colorindex.value==2)
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                                         
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 20.w,
                                      child: Image.asset('assets/offers_icon/bustypeicon1.png')),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0,left: 5),
                                      child: 
                                          Container(
                                            width: 95.w,
                                            child: Text('Seater')),
                                          
                                        
                                    ),
                                    Checkbox( activeColor: kred,
                                      
                                      shape: CircleBorder(),
                                      value: controller.bustypecheck1.value, 
                                    onChanged:(value){
                                     controller.bustypecheck1.value=value!;
                                    } )
                                  ],
                                ),
                                  Row(
                                                         
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 20.w,
                                      child: Image.asset('assets/offers_icon/bustypeicon2.png')),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0,left: 5),
                                      child: 
                                          Container(
                                            width: 95.w,
                                            child: Text('Sleeper')),
                                         
                                        
                                    ),
                                    Checkbox( activeColor: kred,
                                      
                                      shape: CircleBorder(),
                                      value: controller.bustypecheck2.value, 
                                    onChanged:(value){
                                     controller.bustypecheck2.value=value!;
                                    } )
                                  ],
                                ),
                                Row(
                                                         
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 20.w,
                                      child: Image.asset('assets/offers_icon/bustypeicon3.png',
                                
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0,left: 5),
                                      child:
                                          Container(
                                            width:95.w,
                                            child: Text('AC')),
                                        
                                    ),
                                    Checkbox( activeColor: kred,
                                      
                                      shape: CircleBorder(),
                                      value: controller.bustypecheck3.value, 
                                    onChanged:(value){
                                     controller.bustypecheck3.value=value!;
                                    } )
                                  ],
                                ),
                                  Row(
                                                         
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 20.w,
                                      child: Image.asset('assets/offers_icon/bustypeicon4.png')),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0,left: 5),
                                      child: 
                                          Container(
                                            width:95.w,
                                            child: Text('Non - Ac')),
                                        
                                    ),
                                    Checkbox( activeColor: kred,
                                      
                                      shape: CircleBorder(),
                                      value: controller.bustypecheck4.value, 
                                    onChanged:(value){
                                     controller.bustypecheck4.value=value!;
                                    } )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          //    if(controller.colorindex.value==3)
                          // Container(
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Row(
                                                         
                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Container(
                          //             width: 20.w,
                          //             child: Image.asset('assets/offers_icon/singlewinseaticon.png')),
                          //           Padding(
                          //             padding: const EdgeInsets.only(top: 0,left: 5),
                          //             child: 
                          //                 Container(
                          //                   width: 95.w,
                          //                   child: Text('Single Seats')),
                                          
                                        
                          //           ),
                          //           Checkbox( activeColor: kred,
                                      
                          //             shape: CircleBorder(),
                          //             value: controller.singlewindcheck.value, 
                          //           onChanged:(value){
                          //            controller.singlewindcheck.value=value!;
                          //           } )
                          //         ],
                          //       ),
                              
                          //     ],
                          //   ),
                          // ),
                          // if(controller.colorindex.value==4)
                          // BusBoardingwidget(),
                          // if(controller.colorindex.value==5)
                          // BusDroppingwidget(),
                          if(controller.colorindex.value==6)
                          BusOperatorWidget(),
                          if(controller.colorindex.value==7)
                          BusfacilitiesWidget(),
                          // if(controller.colorindex.value==8)
                          // BusfeaturesWidget(),
                          // if(controller.colorindex.value==9)
                          // BusArrivaltimeAndDestinationWidget()
                        ],
                      ),
                    ),
                  ),
                 ksizedbox10,
                ],
              ),
            ),
          ),
             
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 35.h,
                          width: 120.w,
                          decoration: BoxDecoration(border:Border.all(),
                             borderRadius: BorderRadius.circular(26),
                          //  color: Colors.grey.shade300
                          ),
                          child: Center(
                            child: Text('CLEAR',
                            style: TextStyle(
                              fontFamily: 'Proxima ',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600
                            ),),
                          ),
                        ),
                        InkWell(
                          onTap: (){

                        String tempBusType = "";

                        if(controller.bustypecheck1.isTrue){
                          tempBusType =makeAcomaString(actualString: tempBusType,addingString: "seater");
                        }

                         if(controller.bustypecheck2.isTrue){
                            //  tempBusType = tempBusType + ",Sleeper";
                             tempBusType =makeAcomaString(actualString: tempBusType,addingString: "sleeper");
                        }

                         if(controller.bustypecheck3.isTrue){
                            //  tempBusType = tempBusType + "Ac,";
                             tempBusType =makeAcomaString(actualString: tempBusType,addingString: "Ac");

                        }

                         if(controller.bustypecheck4.isTrue){
                              // tempBusType = tempBusType + "Non -Ac,";
                                 tempBusType =makeAcomaString(actualString: tempBusType,addingString: "Non -Ac");
                        }
                         String tempdepature ='';
                         if(controller.checkbox4.isTrue){
                          tempdepature = tempdepature+'Early departure,';

                         }if(controller.checkbox5.isTrue){
                            tempdepature = tempdepature+"Late departure,";
                         }
                         String travelprice = '';
                         if(controller.checkbox2.isTrue){
                          travelprice = travelprice+"Low - Price,";
                         }
                         if(controller.checkbox3.isTrue){
                          travelprice = travelprice+"High - Price";
                         }
                     
                         print('>>>>>>>>>>>>>>>>>bus type..............');
                             print(tempBusType);
                             print('>>>>>>>>>>>>>>>depautre>>>>>>>>>>>>');
                             print(tempdepature);
                            Get.find<HomeController>().getFilter(
                              boardingname: busfilterController.fromPlaceTxtController.text , 
                              destinationname: busfilterController.toPlaceTxtController.text, 
                              date: busfilterController.selectedBookingDate.toString(),
                              busType: tempBusType == "" ? null : tempBusType,
                              depaturetime: tempdepature==''?null:tempdepature,
                              priceorder: travelprice==''?null:travelprice,
                              amenities:amenitiesController.amenitydata.first.amenitiesId.toString()
                              );
                          },
                          child: Container(
                          height: 35.h,
                            width: 200.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(26),
                              color:kred
                            ),
                            child: Center(
                              child: Text('APPLY',
                              style: TextStyle(
                               // fontFamily: 'Proxima ',
                               fontFamily: 'Proxima ',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,color: kwhite
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
      ) ,
    );
  }

  makeAcomaString({required String actualString,required String addingString}){
  
  if(actualString.isEmpty){
    actualString = "$actualString$addingString";
  }else {
    actualString = "$actualString,$addingString";
  }
  
  return actualString;
}
}
