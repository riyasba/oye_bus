import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bus_filter/controllers/bus_filter_controller.dart';

class BusDroppingwidget extends GetView<BusFilterController>  {
    BusDroppingwidget({Key? key}) : super(key: key);
 var droppingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return    Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 38.h,
                                 width: 168.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(21),
                                  color: Colors.grey.shade300
                                ),
                                child: Center(
                                  child: TextField(
                                    
                                    controller: droppingController,
                                    decoration: InputDecoration(
                                      hintText: ' Search Dropping Points',
                                      hintStyle: TextStyle(
                                        fontSize: 11.sp,
                                        fontFamily: 'Proxima '
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(21)
                                      )
                                    ),
                                  ),
                                ),
                              ),
                             
                                 Container(
                              
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:controller.dropinglist.length,
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
                                       
                                          Container(
                                            width: 100.w,
                                            child: Text(controller.dropinglist[index])),
                                        GestureDetector(
                                          onTap: (){
                                          controller.dropcheckindex(index);
                                          controller.update();
                                          },
                                          child: Container(
                                            height: 20.h,
                                            width: 20.w,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:controller.dropcheckindex==index?Color(0xffFF0000)
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
  }}