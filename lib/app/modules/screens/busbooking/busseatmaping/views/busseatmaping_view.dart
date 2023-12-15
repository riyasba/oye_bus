import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/components/custom_button.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/moreaboutbus_view.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/pickanddrop_view.dart';
import '../controllers/busseatmaping_controller.dart';

class BusseatmapingView extends GetView<BusseatmapingController> {
  BusseatmapingView({Key? key}) : super(key: key);
//  List<bool> seats = List.generate(30, (_) => false);
  @override
  Widget build(BuildContext context) {
    Get.put(
      BusseatmapingController(),
    );
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey[200],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                Column(
                  children: [
                    Center(
                      child: Container(
                        height: 159.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kwhite,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              ksizedbox10,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Icon(Icons.arrow_back)),
                                  Text(
                                    'KMPL Kalaimakal Travels',
                                    style: appbarfont,
                                  ),
                                  Container(
                                    height: 19.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(195, 8, 167, 17),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: kwhite,
                                          size: 15,
                                        ),
                                        Text(
                                          '4.4',
                                          style: TextStyle(
                                              color: kwhite, fontSize: 10),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              ksizedbox10,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '06:50AM → 8:15PM Fri,10 Nov',
                                    style: TextStyle(
                                        color: kgrey,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Chennai - Bengaluru',
                                    style: TextStyle(
                                        color: kgrey,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              ksizedbox10,
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 19.h,
                                            width: 19.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: kgrey),
                                          ),
                                          kwidth5,
                                          Text(
                                            'Available',
                                            style: TextStyle(
                                                fontSize: 8, color: kgrey),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 19.h,
                                            width: 19.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: kgreen),
                                          ),
                                          kwidth5,
                                          Text(
                                            'Booked',
                                            style: TextStyle(
                                                fontSize: 8, color: kgrey),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.check_box,
                                            color: kred,
                                            size: 25,
                                          ),
                                          kwidth5,
                                          Text(
                                            'Selected',
                                            style: TextStyle(
                                                fontSize: 8, color: kgrey),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.female),
                                          kwidth5,
                                          Text(
                                            'Female Only\nSeat Booked',
                                            style: TextStyle(
                                                fontSize: 8, color: kgrey),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.male),
                                          kwidth5,
                                          Text(
                                            'Male Only\nSeat Booked',
                                            style: TextStyle(
                                                fontSize: 8, color: kgrey),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  width: double.infinity,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(
                                                  103, 181, 172, 172)
                                              .withOpacity(0.5), // Shadow color
                                          spreadRadius: 5, // Spread radius
                                          blurRadius: 7, // Blur radius
                                          offset: Offset(0,
                                              3), // Changes position of shadow
                                        ),
                                      ],
                                      color: kwhite,
                                      borderRadius: BorderRadius.circular(16)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ksizedbox10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 20,
                          width: 60,
                          child: Center(
                            child: Text(
                              'All Price',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        Container(
                          height: 20,
                          width: 60,
                          child: Center(
                            child: Text(
                              '₹1500',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        Container(
                          height: 20,
                          width: 60,
                          child: Center(
                            child: Text(
                              '₹2000',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        Container(
                          height: 20,
                          width: 60,
                          child: Center(
                            child: Text(
                              '₹3500',
                              style: TextStyle(
                                color: kwhite,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: kgrey,
                              borderRadius: BorderRadius.circular(15.r)),
                        ),
                      ],
                    ),
                    ksizedbox20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Lower Deck',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        color: Colors.black,
                                      ),
                                ),
                              ],
                            ),
                            ksizedbox10,
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(103, 181, 172, 172)
                                          .withOpacity(0.4), // Shadow color
                                      spreadRadius: 2, // Spread radius
                                      blurRadius: 3, // Blur radius
                                      offset: Offset(
                                          0, 3), // Changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                  color: kwhite),
                              width: size.width * 0.4,
                              height: size.height * 0.4,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                            'assets/images/fi_1723544.png'),
                                      ],
                                    ),
                                  ),

 GetBuilder<BusseatmapingController>(
                                    builder: (_) {
                                      return Container(
                                          width: size.width * 0.33,
                                          height: size.height * 0.33,
                                          child: GridView.builder(physics: NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            padding: EdgeInsets.all(20.0),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisSpacing: 10.0,
                                              crossAxisSpacing: 10.0,
                                              crossAxisCount:
                                                  3, // Number of seats per row
                                            ),
                                            itemCount:controller. seats.length,
                                            itemBuilder:
                                                (BuildContext context, int index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  controller.seatSelection(index);
                                                  controller.update();
                                                },
                                                child: AnimatedContainer(
                                                  duration:
                                                      Duration(milliseconds: 300),
                                                  curve: Curves.easeInOut,
                                                  width: 50.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    color:controller. seats[index]
                                                        ? Colors.grey[300]
                                                        : Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(5.0),
                                                    border: Border.all(
                                                      color: Colors.grey.shade400,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Icon(
                                                  controller.    seats[index]
                                                          ? Icons.event_seat
                                                          : Icons.event_available,
                                                      size: 19.0,
                                                      color:controller. seats[index]
                                                          ? Colors.red
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                    }
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Upper Deck',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        color: Colors.black,
                                      ),
                                ),
                              ],
                            ),
                            ksizedbox10,
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(103, 181, 172, 172)
                                          .withOpacity(0.4), // Shadow color
                                      spreadRadius: 2, // Spread radius
                                      blurRadius: 3, // Blur radius
                                      offset: Offset(
                                          0, 3), // Changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                  color: kwhite),
                              width: size.width * 0.4,
                              height: size.height * 0.4,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                            'assets/images/fi_1723544.png'),
                                      ],
                                    ),
                                  ),
                                  GetBuilder<BusseatmapingController>(
                                    builder: (_) {
                                      return Container(
                                          width: size.width * 0.33,
                                          height: size.height * 0.33,
                                          child: GridView.builder(physics: NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            padding: EdgeInsets.all(20.0),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisSpacing: 10.0,
                                              crossAxisSpacing: 10.0,
                                              crossAxisCount:
                                                  3, // Number of seats per row
                                            ),
                                            itemCount:controller. seats.length,
                                            itemBuilder:
                                                (BuildContext context, int index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  controller.seatSelection(index);
                                                  controller.update();
                                                },
                                                child: AnimatedContainer(
                                                  duration:
                                                      Duration(milliseconds: 300),
                                                  curve: Curves.easeInOut,
                                                  width: 50.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    color:controller. seats[index]
                                                        ? Colors.grey[300]
                                                        : Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(5.0),
                                                    border: Border.all(
                                                      color: Colors.grey.shade400,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Icon(
                                                  controller.    seats[index]
                                                          ? Icons.event_seat
                                                          : Icons.event_available,
                                                      size: 19.0,
                                                      color:controller. seats[index]
                                                          ? Colors.red
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                    }
                                  ),
                                  
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    ksizedbox30,
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: size.width,
              height: 110.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7), color: kwhite),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ksizedbox10,
                            Text(
                              '02 Seat | L6, L7',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(MoreaboutbusView());
                              },
                              child: Text(
                                'More about this bus',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.blue,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10.sp,
                                      color: Colors.blue,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '₹4000',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17.sp,
                                    color: Colors.black,
                                  ),
                        )
                      ],
                    ),
                  ),
                  ksizedbox10,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomElevatedButton(
                      height: 45.h,
                      width: 1.sw,
                      onPressed: () {
                        Get.to(PickanddropView());
                      },
                      text: 'proceed',
                      color: kred,
                      textColor: kwhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
