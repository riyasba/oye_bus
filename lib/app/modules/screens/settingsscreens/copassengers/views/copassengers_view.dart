import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/components/custom_button.dart';

import 'package:oye_bus/app/modules/screens/settingsscreens/copassengers/views/addcopassengers_view.dart';
import '../controllers/copassengers_controller.dart';

class CopassengersView extends GetView<CopassengersController> {
 
 CopassengersView({Key? key,}) : super(key: key);

  final copassangersController = Get.find<CopassengersController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kwhite,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[300],
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back),
            ),
            title: Text(
              'Co-Passengers',
              style: appbarfont,
            ),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              ksizedbox30,
              GetBuilder<CopassengersController>(
                builder: (_) {
                  return copassangersController.passengersdata.isNotEmpty? Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          ksizedbox30,
                          Container(
                            height: 500.h,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: copassangersController.passengersdata.length,
                              itemBuilder: (BuildContext context, int index) { 
                                return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 90.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border.all(
                                        color: Colors.black, // Border color
                                        width: 2.0.w, // Border width
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          copassangersController.passengersdata.isNotEmpty?
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Name: ${copassangersController.passengersdata[index].name}',
                                                style: TextStyle(
                                                    fontSize: 15.sp, 
                                                    fontWeight: FontWeight.w600),
                                              ),
                                               GestureDetector(
                                                onTap: (){
                                                   showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  backgroundColor: Colors.white,
                                  title: Column(
                                    children: [
                                      Image.asset(
                                          'assets/images/deleteaccountimage.png'),
                                  
                                    ],
                                  ),
                                  content: Container(
                                    width: 150.w,
                                    child: const Text(
                                      "Are you sure want to delete your account?",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                            height: 38,
                                            width: 105,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                    BorderRadius.circular(6),
                                                // ignore: unrelated_type_equality_checks
                                                color: kgrey),
                                            child: Center(
                                                child: Text("No",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: kblack))),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                         copassangersController.deletepassenger(
                                                    passengerid: copassangersController.passengersdata[index].id.toString()
                                                  );
                                                  copassangersController.update();
                                                  Get.back();
                                            
                                          },
                                          child: Container(
                                            height: 38,
                                            width: 105,
                                            decoration: BoxDecoration(
                                                color: kred,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Center(
                                              child: Text("yes ",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: kwhite)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ksizedbox10
                                  ],
                                );
                              });
                                                  
                                                },
                                                 child: Container(
                                                  height: 28,
                                                  width: 28,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.grey[200],
                                                  ),
                                                  child: Center(
                                                    child: Icon(Icons.clear,
                                                    color: kred,))),
                                               ),
                                            ],
                                          ):Text(''),
                                          Text('Age:${copassangersController.passengersdata[index].age}',
                                              style: TextStyle(
                                                  fontSize: 15.sp, 
                                                  fontWeight: FontWeight.w600)),
                                          Text('Gender:${copassangersController.passengersdata[index].gender}',
                                              style: TextStyle(
                                                  fontSize: 15.sp, 
                                                  fontWeight: FontWeight.w600))
                                        ],
                                      ),
                                    ),
                                  ),
                                
                           
                                  ksizedbox20,
                                
                                ],
                              );
                               },
                            
                            ),
                          ),
                           
                                CustomElevatedButton(
                                height: 45.h,
                                width: 1.sw,
                                onPressed: () {
                                 Get.to(AddcopassengersView());
                                },
                                text: 'Add Co-Paaengers',
                                color: kred,
                                textColor: kwhite,
                              ),
                              ksizedbox40,
                        ],
                      ),
                    ),
                  ):Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 90.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                color: Colors.black, // Border color
                                width: 2.0.w, // Border width
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name:',
                                    style: TextStyle(
                                        fontSize: 15.sp, 
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text('Age:',
                                      style: TextStyle(
                                          fontSize: 15.sp, 
                                          fontWeight: FontWeight.w600)),
                                  Text('Gender:',
                                      style: TextStyle(
                                          fontSize: 15.sp, 
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                            ),
                          ),
                          ksizedbox40,
                          ksizedbox40,
                          Image.asset('assets/images/fi_1611631.png'),
                          ksizedbox20,
                          Text(
                            'You have not added co-passengers yet',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: kgrey,
                                fontSize: 18.sp),
                          ),
                          ksizedbox40,
                          ksizedbox40,
                         controller.isLoading.isTrue?
                          Container(
                      child:  Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      ))):
                             CustomElevatedButton(
                              height: 45.h,
                              width: 1.sw,
                              onPressed: () {
                                     Get.to(AddcopassengersView());
                              },
                              text: 'Add Co-Paaengers',
                              color: kred,
                              textColor: kwhite,
                            ),
                             
                          
                        ],
                      ),
                    );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
