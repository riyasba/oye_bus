import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bus_filter/controllers/bus_filter_controller.dart';

class BusfeaturesWidget extends GetView<BusFilterController>  {
    BusfeaturesWidget({Key? key}) : super(key: key);
 
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
                                    itemCount:controller.featureslist.length,
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
                                           Image.asset(controller.featureiconlist[index]),
                                          Container(
                                            width: 100.w,
                                            child: Text(controller.featureslist[index])),
                                        GestureDetector(
                                          onTap: (){
                                          controller.featurescheckindex(index);
                                          controller.update();
                                          },
                                          child: Container(
                                            height: 20.h,
                                            width: 20.w,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:controller.featurescheckindex==index?Color(0xffFF0000)
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