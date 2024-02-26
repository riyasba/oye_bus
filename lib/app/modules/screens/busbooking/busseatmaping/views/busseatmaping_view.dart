import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/components/custom_button.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/bus_seat_blocked_model.dart';
import 'package:oye_bus/app/data/api_service/models/bus_model/bus_details_model.dart';
import 'package:oye_bus/app/data/api_service/models/bus_model/buslist_model.dart';
import 'package:oye_bus/app/data/api_service/models/bus_seat_model.dart';
import 'package:oye_bus/app/modules/home/controllers/home_controller.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/moreaboutbus_view.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/pickanddrop_view.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/widgets/bus_seat_layout_widget.dart';
import 'package:oye_bus/app/modules/screens/passenger_info/controllers/passenger_info_controller.dart';
import 'package:oye_bus/app/modules/screens/profile/controllers/profile_controller.dart';
import '../../../../../data/api_service/models/get_bus_seat_layout_model.dart';
import '../controllers/busseatmaping_controller.dart';

class BusseatmapingView extends GetView<BusseatmapingController> {
  BusModel busModel;
  BusData busdata;
  BusseatmapingView(
      {Key? key, required this.busModel, required this.busdata})
      : super(key: key);
//  List<bool> seats = List.generate(30, (_) => false);
  final busseatController = Get.find<PassengerInfoController>();
  final busdeatilsController = Get.find<BusseatmapingController>();
  final profileController = Get.find<ProfileController>();
  final homeController = Get.find<HomeController>();

  String getSelectedSeatNames(List<Seat> seatsList) {
    String selectedSeats = "";
    for (var i = 0; i < seatsList.length; i++) {
      selectedSeats += "${seatsList[i].seatNo},";
    }
    //  WidgetsBinding.instance.addPostFrameCallback((_) {
    //   busdeatilsController.update();
    //  });
    return selectedSeats;
  }

  String getSelectedSeatTotalAmount(List<Seat> seatsList) {
    double totalAmount = 0.00;
    for (var i = 0; i < seatsList.length; i++) {
      totalAmount = totalAmount + double.parse(seatsList[i].seatPrice);
    }
    return totalAmount.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(
      BusseatmapingController(),
    );
    var size = MediaQuery.of(context).size;
    return  Container(
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
                GetBuilder<BusseatmapingController>( 
                  builder: (_) {
                    return Column(
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
                                       busdeatilsController.busDetailsdata==null?'':
                                        busdeatilsController.busDetailsdata!.busName,
                                        style: appbarfont,
                                      ),
                                      Container(
                                        height: 19.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                          color:
                                              const Color.fromARGB(195, 8, 167, 17),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
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
                                        '${busdeatilsController.routedata==null?"":  busdeatilsController.routedata!.arrivalTime} → ${
                                            busdeatilsController.routedata==null?'':busdeatilsController.routedata!.departureTime} ${formatDate(homeController.selectedDate, [D,',',d,' ',M])}',
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
                                      width: double.infinity,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color.fromARGB(
                                                      103, 181, 172, 172)
                                                  .withOpacity(0.5), // Shadow color
                                              spreadRadius: 5, // Spread radius
                                              blurRadius: 7, // Blur radius
                                              offset: const Offset(0,
                                                  3), // Changes position of shadow
                                            ),
                                          ],
                                          color: kwhite,
                                          borderRadius: BorderRadius.circular(16)),
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ksizedbox10,
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     Container(
                        //       height: 20,
                        //       width: 60,
                        //       child: Center(
                        //         child: Text(
                        //           'All Price',
                        //           style: TextStyle(
                        //             fontSize: 10,
                        //             fontWeight: FontWeight.w500,
                        //           ),
                        //         ),
                        //       ),
                        //       decoration: BoxDecoration(
                        //           color: kwhite,
                        //           borderRadius: BorderRadius.circular(15)),
                        //     ),
                        //     Container(
                        //       height: 20,
                        //       width: 60,
                        //       child: Center(
                        //         child: Text(
                        //           '₹1500',
                        //           style: TextStyle(
                        //             fontSize: 10,
                        //             fontWeight: FontWeight.w500,
                        //           ),
                        //         ),
                        //       ),
                        //       decoration: BoxDecoration(
                        //           color: kwhite,
                        //           borderRadius: BorderRadius.circular(15)),
                        //     ),
                        //     Container(
                        //       height: 20,
                        //       width: 60,
                        //       child: Center(
                        //         child: Text(
                        //           '₹2000',
                        //           style: TextStyle(
                        //             fontSize: 10,
                        //             fontWeight: FontWeight.w500,
                        //           ),
                        //         ),
                        //       ),
                        //       decoration: BoxDecoration(
                        //           color: kwhite,
                        //           borderRadius: BorderRadius.circular(15)),
                        //     ),
                        //     Container(
                        //       height: 20,
                        //       width: 60,
                        //       child: Center(
                        //         child: Text(
                        //           '₹3500',
                        //           style: TextStyle(
                        //             color: kwhite,
                        //             fontSize: 10,
                        //             fontWeight: FontWeight.w500,
                        //           ),
                        //         ),
                        //       ),
                        //       decoration: BoxDecoration(
                        //           color: kgrey,
                        //           borderRadius: BorderRadius.circular(15.r)),
                        //     ),
                        //   ],
                        // ),
                        ksizedbox20,
                        GetBuilder<BusseatmapingController>(builder: (_) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                child: BusSeatLayoutWidget(
                                  nonAcLowerSeats: busdeatilsController
                                      .generateSeatLayoutLower(busModel),
                                  nonAcUpperSeats: busdeatilsController
                                      .generateSeatLayoutUpper(busModel),
                                ),
                              ),
                            ),
                          );
                        }),
                        ksizedbox30,
                      ],
                    );
                  }
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder<BusseatmapingController>(builder: (_) {
              return Container(
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
                                '${busdeatilsController.getSelectedSeats(busModel).length} Seat | ${getSelectedSeatNames(busdeatilsController.getSelectedSeats(busModel))}',
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
                            '₹${getSelectedSeatTotalAmount(busdeatilsController.getSelectedSeats(busModel))}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17.sp,
                                  color: Colors.black,
                                ),
                          )
                        ],
                      ),
                    ),
                    ksizedbox10,
                    Obx(
                      () => busseatController.isLoading.isTrue
                          ? CircularProgressIndicator()
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomElevatedButton(
                                height: 45.h,
                                width: 1.sw,
                                onPressed: () {
                                  SeatBlockedData busSeatBlockedModel =
                                      SeatBlockedData(
                                    busId: int.parse(busdata.busId.toString()),
                                    userId: profileController
                                            .profiledata.isNotEmpty
                                        ? profileController.profiledata.first.id
                                        : 0,
                                    tripId:
                                        busdeatilsController.tripdata == null
                                            ? 0
                                            : busdeatilsController.tripdata!.id,
                                    routeId:
                                        busdeatilsController.routedata == null
                                            ? 0
                                            : int.parse(busdeatilsController
                                            .routedata!.id.toString()),
                                    vendorId:
                                        int.parse(busdata.vendorId.toString()),
                                    seatId: busdeatilsController
                                        .getSelectedSeats(busModel),
                                    seatCount: busdeatilsController
                                        .getSelectedSeats(busModel)
                                        .length,
                                  );
                                  busseatController.seatblock(
                                      busSeatBlockedModel: busSeatBlockedModel);
                                      
                                },
                                text: 'proceed',
                                color: kred,
                                textColor: kwhite,
                              ),
                            ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
