import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bus_filter/controllers/bus_filter_controller.dart';

class BusArrivaltimeAndDestinationWidget extends GetView<BusFilterController>  {
    BusArrivaltimeAndDestinationWidget({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return       Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                           
                             
                                 Container(
                                 
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:controller.busarraivalatdestinationicon.length,
                                    itemBuilder: (context ,index){
                                    return Obx(()=>
                                       Container(
                                       
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                               ksizedbox10,
                                             Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          
                                             Image.asset(controller.busarraivalatdestinationicon[index]),
                                      
                                            
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5),
                                            child: Container(
                                              width: 100.w,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(controller.busarraivaltimelist[index]),
                                                      Text(controller.busdestinationlist[index],
                                                      style: TextStyle(
                                                        fontSize: 11.sp,
                                                        fontFamily: 'Proxima'
                                                      ),),
                                                ],
                                              )),
                                          ),
                                        GestureDetector(
                                          onTap: (){
                                          controller.busarriavlatdestinationcheckindex(index);
                                          controller.update();
                                          },
                                          child: Container(
                                            height: 20.h,
                                            width: 20.w,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:controller.busarriavlatdestinationcheckindex==index?Color(0xffFF0000)
                                              :Colors.grey.shade300
                                            ),
                                            child: Center(
                                              child: Icon(Icons.check,
                                              size: 15.5,
                                              color: kwhite,
                                              ),
                                            ),
                                          ),
                                        )
                                        ],
                                      ),
                                        ksizedbox10,
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                )
                            ]
                          )
    
                          );
  }
  }