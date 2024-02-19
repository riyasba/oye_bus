import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/models/bus_seat_model.dart';
import 'package:oye_bus/app/data/api_service/models/get_bus_seat_layout_model.dart';
import 'package:oye_bus/app/data/local_data/bus_seat_data.dart';
import 'package:oye_bus/app/modules/home/controllers/home_controller.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bus_filter/views/bus_filter_view.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bus_list/widgets/seperator_widgets.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/controllers/busseatmaping_controller.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/busseatmaping_view.dart';
import 'package:oye_bus/app/modules/screens/passenger_info/views/passenger_info_view.dart';
import 'package:oye_bus/app/routes/app_pages.dart';
import 'package:shimmer/shimmer.dart';

import '../../bus_filter/views/bus_filter_view.dart';
import '../controllers/bus_list_controller.dart';

class BusListView extends GetView<BusListController> {
  BusListView({
    Key? key,
  }) : super(key: key);
  @override
  final buslistController = Get.find<HomeController>();
  List image = [
    'assets/images/destinationoffers2.jpg',
    'assets/images/destinationoffers.jpg',
    'assets/images/destinationoffers2.jpg',
    'assets/images/destinationoffers.jpg',
    'assets/images/destinationoffers2.jpg',
  ];

  String getActualTime(String time) {
    var tempTime = time.split(":");

    String actualTime = "${tempTime[0]}:${tempTime[1]}";

    return actualTime;
  }

  final seatmappingController = Get.find<BusseatmapingController>();

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(220),
          child: GetBuilder<HomeController>(builder: (context) {
            return Column(
              children: [
                AppBar(
                  elevation: 0,
                  title: Text(
                    '${buslistController.fromPlaceTxtController.text} → ${buslistController.toPlaceTxtController.text}',
                    style: smalbalckfont.copyWith(color: kblack),
                  ),
                  centerTitle: true,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.BUSFILTER);
                        },
                        child: Container(
                          height: 33,
                          width: 33,
                          decoration: BoxDecoration(
                              color: klightGrey,
                              borderRadius: BorderRadius.circular(40)),
                          child: Center(
                            child: Image.asset(
                                'assets/offers_icon/filtericon.png'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 110,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            height: 50,
                            width: 120,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  image[index],
                                  fit: BoxFit.fill,
                                )),
                          ),
                        );
                      }),
                )
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8),
                //   child:  GetBuilder<HomeController>(
                //     builder: (_) {
                //       return Row(
                //         children: [
                //           Expanded(
                //             child: Padding(
                //               padding: const EdgeInsets.only(top: 10),
                //               child: Container(
                //                 height: 55 ,
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(10),
                //                   color: kYellow
                //                 ),
                //                 child: Padding(
                //                   padding: const EdgeInsets.symmetric(horizontal: 2),
                //                   child: Row(
                //                     children: [
                //                         ClipRRect(
                //                         borderRadius: BorderRadius.circular(35),
                //                         child: Image.asset("assets/home_page/calendar_gif.gif",
                //                         height: 40,)),
                //                      const   SizedBox(
                //                           width: 5,
                //                         ),
                //                         Text(formatDate(buslistController.selectedDate, [DD,',',dd,' ',M,' ',yyyy]),
                //                         // Text( "Friday, 10 Nov 2023",
                //                         style: primaryFont.copyWith(
                //                             fontSize: 12,
                //                             fontWeight: FontWeight.w900
                //                             ),)

                //                     ],
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),

                //           Expanded(
                //             child: Padding(
                //               padding: const EdgeInsets.only(left: 10,top: 10),
                //               child: Container(
                //                 height: 55,
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(10),
                //                   color: kred
                //                 ),
                //                 child:  Center(
                //                   child: Text("${buslistController.busdata.first.availableBuses} Buses Availble",style: primaryFont.copyWith(
                //                               fontSize: 12,
                //                               color: Colors.white,
                //                               fontWeight: FontWeight.w900
                //                               ),),
                //                 ),
                //               ),
                //             ),
                //           )
                //         ],
                //       );
                //     }
                //   ),
                // )
              ],
            );
          }),
        ),
        body: Obx(
          () => buslistController.isLoading.isFalse
              ? GetBuilder<HomeController>(builder: (_) {
                  return buslistController.busdata.isNotEmpty
                      ? ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: buslistController.busdata.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                              child: InkWell(
                                onTap: () async{
                                  // BusModel  busModel = BusModel.fromJson(busSeatData);
                                  
                                  int busId = buslistController
                                      .busdata[index].route.busDetails.id;
                              BusModel? busModel = await Get.find<BusseatmapingController>().busseats(busId);
                                  int tripId = buslistController
                                      .busdata[index].route.trip
                                      .where((element) =>
                                          element.busId == busId.toString())
                                      .first
                                      .id;

                               print("seat length --->>-->>-->>-->>-->>");       print(busModel!.seatMap.length);

                                  seatmappingController.getBusdetails(
                                      tripId: tripId.toString(),
                                      busId: busId.toString());
                                  Get.to(BusseatmapingView(
                                    busModel: busModel,
                                    busDetails: buslistController
                                        .busdata[index].route.busDetails,
                                  ));
                                  // Get.to(PassengerInfoView());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5, color: klightGrey)
                                      ],
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/home_page/oye_small_icon.png",
                                                  height: 40,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      buslistController
                                                          .busdata[index]
                                                          .route
                                                          .busDetails
                                                          .busName,
                                                      style: smalbalckfont
                                                          .copyWith(
                                                              fontSize: 14),
                                                    ),
                                                    Text(
                                                      buslistController
                                                          .busdata[index]
                                                          .route
                                                          .busDetails
                                                          .busType,
                                                      style:
                                                          primaryFont.copyWith(
                                                              fontSize: 11),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: const Color.fromARGB(
                                                          255, 148, 238, 151)
                                                      .withOpacity(0.5)),
                                              padding: EdgeInsets.all(5),
                                              child: Center(
                                                child: Text(
                                                  "CHEAPEST",
                                                  style: smalbalckfont.copyWith(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 45, 172, 53),
                                                      fontSize: 12),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        //time row

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  getActualTime(
                                                      buslistController
                                                          .busdata[index]
                                                          .route
                                                          .arrivalTime),
                                                  style: smalbalckfont.copyWith(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Text(
                                                  buslistController
                                                      .busdata[index]
                                                      .route
                                                      .sourceLocation,
                                                  style: primaryFont.copyWith(
                                                      fontSize: 11,
                                                      color: Colors.black45),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  buslistController
                                                      .busdata[index]
                                                      .route
                                                      .totalHours,
                                                  style: primaryFont.copyWith(
                                                      fontSize: 10,
                                                      color: Colors.black54),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 4,
                                                      width: 4,
                                                      decoration: BoxDecoration(
                                                          color: const Color
                                                              .fromARGB(
                                                              115, 66, 66, 66),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                    ),
                                                    Container(
                                                      height: 1,
                                                      width: 50,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Color.fromARGB(
                                                            115, 141, 139, 139),
                                                      ),
                                                    ),
                                                    const Icon(
                                                      Icons
                                                          .directions_bus_rounded,
                                                      size: 13,
                                                      color: Colors.black54,
                                                    ),
                                                    Container(
                                                      height: 1,
                                                      width: 50,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Color.fromARGB(
                                                            115, 141, 139, 139),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 4,
                                                      width: 4,
                                                      decoration: BoxDecoration(
                                                          color: const Color
                                                              .fromARGB(
                                                              115, 66, 66, 66),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  getActualTime(
                                                      buslistController
                                                          .busdata[index]
                                                          .route
                                                          .departureTime),
                                                  style: smalbalckfont.copyWith(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Text(
                                                  buslistController
                                                      .busdata[index]
                                                      .route
                                                      .destinationLocation,
                                                  style: primaryFont.copyWith(
                                                      fontSize: 11,
                                                      color: Colors.black45),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        //Amount row
                                        const MySeparator(
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                ),
                                                Text(
                                                  "4.4",
                                                  style: primaryFont.copyWith(
                                                      fontSize: 11),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.person_outlined,
                                                  size: 17,
                                                ),
                                                Text(
                                                  "32",
                                                  style: primaryFont.copyWith(
                                                      fontSize: 11),
                                                )
                                              ],
                                            ),
                                            Text(
                                              "₹${buslistController.busdata[index].route.price}",
                                              style: smalbalckfont.copyWith(
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })
                      : Lottie.asset(
                          'assets/images/buslistnodata.json',
                          reverse: true,
                          animate: true,
                        );
                })
              : getShimmerLoading(),
        ));
  }

  getShimmerLoading() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: 135.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 31,
                                  width: 31,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                ),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    width: 120,
                                    height: 14,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 14,
                              width: 60,
                              decoration: BoxDecoration(
                                color: kwhite,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //time row

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 13,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              ksizedbox10,
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 13,
                                  width: 95,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 14,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                              ksizedbox10,
                              Row(
                                children: [
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      height: 14,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 14,
                                  width: 65,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ),
                              ksizedbox10,
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 14,
                                  width: 65,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //Amount row
                      const MySeparator(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 14,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                              )
                            ],
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 14,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 14,
                              width: 80,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
//hovering container

// AnimatedContainer(
        
//           duration: Duration(seconds: 2),
//           curve: Curves.easeIn,
//           child: Material(

//             color: Colors.yellow,
//             child: InkWell(
//               onTap:(){},
//                 onHover: (value) {
//                   print(value);
                
//                  controller isHover = value;
              
//               },
//               child: Text('sharmila ur the busyest girl in this office'),
//             ),
//           ),
//             )