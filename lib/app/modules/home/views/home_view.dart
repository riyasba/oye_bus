import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/local_data/sqflite_data.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bus_list/views/bus_list_view.dart';
import 'package:oye_bus/app/modules/home/widgets/home_app_bar_widget.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bus_list/widgets/seperator_widgets.dart';
import 'package:oye_bus/app/modules/screens/offers/controllers/offers_controller.dart';
import 'package:oye_bus/app/modules/screens/passenger_info/views/passenger_info_view.dart';
import 'package:oye_bus/app/modules/screens/search/controllers/search_controller.dart';
import 'package:oye_bus/app/modules/screens/search/views/search_destiny_view.dart';
import 'package:oye_bus/app/modules/screens/search/views/search_view.dart';
import 'package:shimmer/shimmer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<BusSearchController>(() => BusSearchController());

    final homeController = Get.find<HomeController>();
    final searchcityController = Get.find<BusSearchController>();
    final offerscontroller = Get.find<OffersController>();
   
    DateTime  date;
    DateTime  datetomorrow;
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: HomeAppBarWidget(),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Where to go?",
                        style: smalbalckfont.copyWith(
                          fontSize: 19,
                        ),
                      ),
                      Text(
                        "Search for Bus Tickets",
                        style: primaryFont.copyWith(
                            fontSize: 11, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/home_page/bus_loading_gif.gif",
                    height: 70,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    color: const Color(0xffEEEEEF),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          SvgPicture.asset(
                            "assets/home_page/dotted_line_svg.svg",
                            height: 45,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          SvgPicture.asset(
                              "assets/home_page/location_red_large_icon.svg"),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GetBuilder<HomeController>(
                        builder: (_) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "From",
                              style: primaryFont.copyWith(
                                fontSize: 11,
                              ),
                            ),
                            Container(
                              height: 35,
                              width: size.width * 0.6,
                              child: TextField(
                                controller: controller.fromPlaceTxtController,
                                readOnly: true,
                                onTap: () => Get.to(() => SearchView()),
                                style: smalbalckfont.copyWith(fontSize: 15),
                                decoration: const InputDecoration.collapsed(
                                    hintText: "Enter from place"),
                              ),
                            ),
                            Container(
                              height: 1,
                              width: size.width * 0.6.w,
                              color: const Color.fromRGBO(158, 158, 158, 1),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "To",
                              style: primaryFont.copyWith(
                                fontSize: 11,
                              ),
                            ),
                            Container(
                              height: 35,
                              width: size.width * 0.6,
                              child: TextField(
                                controller: controller.toPlaceTxtController,
                                readOnly: true,
                                onTap: () => Get.to(() => SearchDestinyView()),
                                style: smalbalckfont.copyWith(fontSize: 15),
                                decoration: const InputDecoration.collapsed(
                                    hintText: "Enter to place"),
                              ),
                            ),
                          ],
                        );
                      }),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.ulta();
                        },
                        child: Container(
                          height: 45,
                          width: 35,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/home_page/arrow.svg",
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.selectDate(context);
                      },
                      child: GetBuilder<HomeController>(builder: (context) {
                        return Container(
                          height: 55.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffEEEEEF)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Row(children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(35),
                                  child: Image.asset(
                                    "assets/home_page/calendar_gif.gif",
                                    height: 30.h,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Column(
                                  children: [
                                    Text(
                                      "Departure date",
                                      style:
                                          primaryFont.copyWith(fontSize: 9.sp),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      '${controller.selectedDate.toLocal()}'
                                          .split(
                                              ' ')[0], // Display selected date
                                      style: primaryFont.copyWith(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        );
                      }),
                    ),
                    // SizedBox(
                    //   width: 6.w,
                    // ),
                    // InkWell(
                    //   onTap: () {
                    //     //  Get.to(() => PassengerInfoView());
                    //   },
                    //   child: Container(
                    //       height: 55.h,
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(10),
                    //           color: const Color(0xffEEEEEF)),
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(
                    //             top: 7, left: 7, right: 7),
                    //         child: Column(
                    //           children: [
                    //             Text(
                    //               "Traveller",
                    //               style: primaryFont.copyWith(fontSize: 9.sp),
                    //             ),
                    //             SizedBox(
                    //               height: 7.h,
                    //             ),
                    //             Text(
                    //               "01",
                    //               style: primaryFont.copyWith(
                    //                   fontSize: 11.sp,
                    //                   fontWeight: FontWeight.w900),
                    //             )
                    //           ],
                    //         ),
                    //       )),
                    // ),
                    SizedBox(
                      width: 6.w,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                          height: 55.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffEEEEEF)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 7, left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(
                                //   "Seat Type (optional)",
                                //   style: primaryFont.copyWith(fontSize: 9.sp),
                                // ),
                                SizedBox(
                                  height: 10.h,
                                ),
                              Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                      date = DateTime.now();
                                         controller.selectedDate = date;
                                         controller.update();
                                        },
                                        child: Container(
                                          height: 20.h,
                                          width: 55,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color:
                                                 Colors.pink.shade100),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Center(
                                              child: Text(
                                                "Today",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 10.sp,
                                                    color: kblack,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      InkWell(
                                        onTap: () {
                                         datetomorrow = DateTime.now().add(Duration(days: 1));
                                         controller.selectedDate = datetomorrow;
                                         controller.update();
                                        },
                                        child: Container(
                                          height: 20.h,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color:Colors.pink.shade100),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Center(
                                              child: Text(
                                                "Tomorrow",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 10.sp,
                                                    color: kblack,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                     
                                    ],
                                  ),
                                
                              ],
                            ),
                          )),
                    ),
                  ],
                )),
            // const SizedBox(
            //   height: 5,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Row(
            //     children: [
            //       Obx(
            //         () => Checkbox(
            //           //  tristate: true,
            //           activeColor: Colors.green,
            //           value: controller.isAcBusOnly.value,
            //           onChanged: (bool? value) {
            //             controller.isAcBusOnly(value);
            //           },
            //         ),
            //       ),
            //       Text(
            //         "Show AC Buses only",
            //         style: primaryFont.copyWith(
            //             fontSize: 13, fontWeight: FontWeight.w400),
            //       )
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 15,
            ),
            controller.isLoading.isTrue
                ? Container(
                    child: const Center(
                        child: CircularProgressIndicator(
                    color: Colors.white,
                  )))
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GetBuilder<HomeController>(builder: (_) {
                      return GestureDetector(
                        onTap: () async {
                          if (controller.cityid != 0 ||
                              controller.fromcityid != 0) {
                            String boardingName =
                                homeController.fromcityid.toString();
                            String destinationName =
                                homeController.tocityid.toString();

                            // Save boarding and destination names to local database
                            await DatabaseHelper().insertBoardingDestination(
                              BoardingDestination(
                                boardingName: boardingName,
                                destinationName: destinationName,
                              ),
                            );
                            homeController.getbuslist(
                                boardingname:
                                    homeController.fromcityid.toString(),
                                destinationname:
                                    homeController.tocityid.toString(),
                                date: formatDate(homeController.selectedDate,
                                    [yyyy, '-', mm, '-', dd]));

                            print('bus list................');
                            print(homeController.fromcityid.toString());
                            print(homeController.tocityid.toString());
                            print(homeController.selectedDate);
                          } else {
                            Get.rawSnackbar(
                                backgroundColor: Colors.red,
                                messageText: Text(
                                  "Please Enter your details",
                                  style:
                                      primaryFont.copyWith(color: Colors.white),
                                ) );
                          }
                        },
                        child: Container(
                          height: 55,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: const Color(0xffFF0000),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Search Buses".toUpperCase(),
                              style: smalbalckfont.copyWith(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<OffersController>(
              builder: (_) {
                return offerscontroller.offersdata.isEmpty ? Container(): Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Checkout some offers",
                        style: smalbalckfont,
                      ),
                      Text(
                        "View All",
                        style: primaryFont.copyWith(
                            color: Colors.red,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                );
              }
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GetBuilder<OffersController>(builder: (context) {
                return offerscontroller.offersdata.isEmpty ? Container(): Container(
                  height: 180,
                  child: ListView.builder(
                      itemCount: offerscontroller.offersdata.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kwhite,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      offset: const Offset(0.0, 0.75),
                                      color: kgrey,
                                      blurRadius: 5)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    height: 100,
                                    width: 180,
                                    child: Image.network(
                                      offerscontroller.offersdata[index].images
                                          .toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: Container(
                                    width: 150,
                                    child: Text(
                                      offerscontroller.offersdata[index].title
                                          .toString(),
                                      style: const TextStyle(
                                          fontFamily: 'Proxima',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Valid till: ${offerscontroller.offersdata[index].validTill}',
                                        style: const TextStyle(
                                            fontFamily: 'Proxima',
                                            fontSize: 10),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Container(
                                        height: 18,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: const Color(0xff263238),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            offerscontroller
                                                .offersdata[index].couponCode
                                                .toString(),
                                            style: TextStyle(
                                                fontFamily: 'Proxima',
                                                fontSize: 10,
                                                color: kwhite),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                );
              }),
            ),
            const SizedBox(
              height: 20,
            ),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Preferred Routes",
                style: smalbalckfont,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 400,
                child: GetBuilder<BusSearchController>(
                  builder: (_) {
                    return  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: searchcityController.boardingDestinations.length,
                      itemBuilder: (context,index){
                      //    final reversedIndex =
                      //     searchcityController.boardingDestinations.length - 1 - index;
                      // final item =
                      //     searchcityController.boardingDestinations[reversedIndex];
                      return
                       searchcityController.boardingDestinations.isNotEmpty? Padding(
                        padding: const EdgeInsets.only(left: 20,right: 10,top: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 66,
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: kwhite,
                                boxShadow: <BoxShadow>
                              [
                                    BoxShadow(
                            offset: Offset(0.0, 0.5),
                            blurRadius: 1,
                            color: kgrey
                                    ),
                                    
                              ]     ),
                              child: Row(
                                
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Image.asset('assets/icons/transport.png',
                                    fit: BoxFit.fitHeight,height: 45,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(searchcityController.boardingDestinations[index].boardingName),
                                  ),
                                  Icon(Icons.arrow_forward,color: kgrey,
                                  size: 17,),
                                  Text(searchcityController.boardingDestinations[index].destinationName)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ):Text('No Routes');
                    });
                  }
                ),
              ),
            ),
             
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Text(
            //     "Check PNR Status",
            //     style: smalbalckfont,
            //   ),
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
          //   Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 20),
          //     child: Container(
          //       height: 60,
          //       child: TextField(
          //         controller: controller.pnrController,
          //         style: smalbalckfont.copyWith(fontSize: 15),
          //         decoration: InputDecoration(
          //             border: OutlineInputBorder(
          //                 borderSide:
          //                     BorderSide(color: Colors.grey.withOpacity(0.5))),
          //             hintText: "PNR Number",
          //             suffixIcon: Padding(
          //               padding:  EdgeInsets.all(8.0),
          //               child: InkWell(
          //                 onTap: (){
          //                   if(controller.pnrController.text.isNotEmpty){
          //                           Get.find<HomeController>().checkPnrstatus(pnrnumber: controller.pnrController.text);
          //                   }else{
          //                      Get.rawSnackbar(
          // backgroundColor: Colors.red,
          // messageText: Text(
          // "Please Enter Your PNR Number",
          //   style: primaryFont.copyWith(color: Colors.white),
          // ));
          //                   }
                         
          //                 },
          //                 child: Container(
          //                   height: 40,
          //                   width: 80,
          //                   decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(30),
          //                     color: const Color(0xffFFD400),
          //                   ),
          //                   child: Center(
          //                     child: Text(
          //                       "Check".toUpperCase(),
          //                       style: smalbalckfont.copyWith(fontSize: 14),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             )),
          //       ),
          //     ),
          //   ),
            const SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Text(
            //     "Previously Viewed",
            //     style: smalbalckfont,
            //   ),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Container(
            //     height: 65,
            //     width: size.width,
            //     decoration: BoxDecoration(
            //         color: Colors.yellow.withOpacity(0.55),
            //         borderRadius: BorderRadius.circular(10)),
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 15),
            //       child: Row(
            //         children: [
            //           Image.asset(
            //             "assets/home_page/oye_small_icon.png",
            //             height: 50,
            //           ),
            //           const SizedBox(
            //             width: 10,
            //           ),
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Row(
            //                 children: [
            //                   Text(
            //                     "Chennai",
            //                     style: smalbalckfont.copyWith(
            //                         fontSize: 14, fontWeight: FontWeight.w500),
            //                   ),
            //                   const Icon(Icons.arrow_right_alt_outlined),
            //                   Text(
            //                     "Salem",
            //                     style: smalbalckfont.copyWith(
            //                         fontSize: 14, fontWeight: FontWeight.w500),
            //                   ),
            //                 ],
            //               ),
            //               Text(
            //                 "Mon, 06 Nov 2023",
            //                 style: primaryFont.copyWith(
            //                     fontSize: 12, fontWeight: FontWeight.w500),
            //               ),
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 50,
            )
          ],
        ));
  }
  //   getShimmerLoading(){
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
  //     child: Column(
  //       children: [
  //         Container(
  //       height: 55,
  //       child: Padding(
  //         padding: const EdgeInsets.only(left: 15, right: 15),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //                 Shimmer.fromColors(

  //                           baseColor: Colors.grey[300]!,
  //                           highlightColor: Colors.grey[100]!,
  //                                       child:
  //                Container(
  //                 height: 40,
  //                 width: 40,
  //                 decoration: BoxDecoration(
  //                     color: Colors.grey[100],
  //                     borderRadius: BorderRadius.circular(10)),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     InkWell(
  //                       onTap: () {

  //                         // Get.toNamed(Routes.BUSSEATMAPING);
  //                       },
  //                       child: SvgPicture.asset(
  //                         "assets/home_page/menu_icon.svg",
  //                         height: 25,
  //                         fit: BoxFit.fill,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(top: 5),
  //               child: Column(
  //                 children: [
  //                   Text(
  //                     formatDate(controller.selectedDate,[DD,',',dd,' ',M,' ',yyyy]),
  //                    // "Monday, 06 Nov 2024",
  //                     style: smalbalckfont.copyWith(
  //                         fontSize: 17, fontWeight: FontWeight.w800),
  //                   ),
  //                   InkWell(onTap: (){},
  //                     child: Row(
  //                       children: [
  //                         const Icon(
  //                           Icons.location_on_outlined,
  //                           size: 13,
  //                         ),
  //                         Text(
  //                           "Chennai, Nungambakkam",
  //                           style: primaryFont.copyWith(
  //                               fontSize: 11, fontWeight: FontWeight.w400),
  //                         ),
  //                       ],
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //             Container(
  //               height: 40,
  //               width: 40,
  //               decoration: BoxDecoration(
  //                   color: Colors.grey[100],
  //                   borderRadius: BorderRadius.circular(10)),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   InkWell(
  //                     onTap: (){

  //                       },
  //                     child: SvgPicture.asset(
  //                       "assets/home_page/bell_icons.svg",
  //                       height: 25,
  //                       fit: BoxFit.fill,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //       ],
  //     )
  //   );
  // }
}
