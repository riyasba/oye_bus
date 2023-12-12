import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bus_filter/controllers/bus_filter_controller.dart';

class BusOperatorWidget extends GetView<BusFilterController>  {
    BusOperatorWidget({Key? key}) : super(key: key);
 var operatorController = TextEditingController();
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
                                    
                                    controller: operatorController,
                                    decoration: InputDecoration(
                                      hintText: ' Search Travels',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Proxima',
                                        fontSize: 11.sp
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
                                    itemCount:controller.operatorlist.length,
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
                                            child: Text(controller.operatorlist[index])),
                                        GestureDetector(
                                          onTap: (){
                                          controller.operatorcheckindex(index);
                                          controller.update();
                                          },
                                          child: Container(
                                            height: 25.h,
                                            width: 25.w,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:controller.operatorcheckindex==index?Color(0xffFF0000)
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