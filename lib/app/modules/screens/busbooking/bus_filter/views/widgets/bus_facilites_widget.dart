import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bus_filter/controllers/bus_filter_controller.dart';

class BusfacilitiesWidget extends GetView<BusFilterController>  {
    BusfacilitiesWidget({Key? key}) : super(key: key);
 var facilitesController = TextEditingController();
 final amenitiesController = Get.find<BusFilterController>();
  @override
  Widget build(BuildContext context) {
    return    Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Container(
                              //   height: 38.h,
                              //    width: 168.w,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(21),
                              //     color: Colors.grey.shade300
                              //   ),
                              //   child: Center(
                              //     child: TextField(
                                    
                              //       controller: facilitesController,
                              //       decoration: InputDecoration(
                              //         hintText: ' Search Amenities',
                              //         hintStyle: TextStyle(
                              //           fontSize: 11.sp,
                              //           fontFamily: 'Proxima '
                              //         ),
                              //         border: OutlineInputBorder(
                              //           borderRadius: BorderRadius.circular(21)
                              //         )
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              
                                 GetBuilder<BusFilterController>(
                                   builder: (_) {
                                     return Container(
                                                                   
                                      width: MediaQuery.of(context).size.width * 0.45,
                                      child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:controller.amenitydata.length,
                                        itemBuilder: (context ,index){
                                        return 
                                           Container(
                                           
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                   ksizedbox10,
                                                 Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                               Image.network(amenitiesController.amenitydata[index].image.toString(),
                                               fit: BoxFit.fitHeight,height: 20,),
                                              Container(
                                                width: 100.w,
                                                child: Text(amenitiesController.amenitydata[index].title.toString())),
                                            GestureDetector(
                                              onTap: (){
                                            amenitiesController.amenitydata[index].ischeck = !amenitiesController.amenitydata[index].ischeck;
                                              controller.update();
                                              },
                                              child: Container(
                                                height: 20.h,
                                                width: 20.w,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:amenitiesController.amenitydata[index].ischeck==true?Color(0xffFF0000)
                                                  :Colors.grey.shade300
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.check,
                                                  color: kwhite,
                                                  size: 15.5,
                                                  ),
                                                ),
                                              ),
                                            )
                                            ],
                                             ),
                                             ksizedbox10,
                                              ],
                                            ),
                                          );
                                      
                                      }),
                                     );
                                   }
                                 )
                            ]
                          )
    
                          );
  }}