import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/local_data/sqflite_data.dart';
import 'package:oye_bus/app/modules/home/controllers/home_controller.dart';
import 'package:oye_bus/app/modules/home/views/home_view.dart';
import 'package:oye_bus/app/modules/screens/search/controllers/search_controller.dart';
import 'package:oye_bus/app/modules/screens/search/widgets/recent_chips.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {


  var searchTextController = TextEditingController();


 final searchcityController = Get.find<BusSearchController>();

  // @override
  // void initState() { 
  //   super.initState();
  //   searchTextController.addListener(searchBusCitys(searchTextController.text));
  // }

 


  @override
  void initState() { 
    super.initState();
    searchcityController.getBoardingDestinations();
    searchTextController.addListener(searchBusCitys);
  }



  searchBusCitys() async{
  //  await Future.delayed(const Duration(milliseconds: 300));
  WidgetsBinding.instance.addPostFrameCallback((_) {
    
    searchcityController.buscitysearch(city: searchTextController.text);

  });

  }


Timer? _debounce;
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(color: klightGrey.withOpacity(0.5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )),
                      Text(
                        "Choose Boarding Points",
                        style: smalbalckfont.copyWith(fontSize: 16.sp),
                      ),
                      Container(
                        width: 30.w,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
      body: GetBuilder<BusSearchController>(builder: (_) {
        return ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: 50.h,
                    child: TextField(
                      onChanged: (value) {
                        // searchcityController.triggerFunction();
                        _debounce?.cancel();
                        _debounce = Timer(const Duration(milliseconds: 500), () => searchcityController.buscitysearch(city: value));
                      },
                      // controller: searchTextController,
                      style: primaryFont.copyWith(
                          fontSize: 18.sp, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 200, 200, 200)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 200, 200, 200)),
                          ),
                          hintText: "Search",
                          hintStyle: const TextStyle(
                            fontSize: 19,
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              "assets/home_page/search-location_icon.svg",
                              height: 25.h,
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GetBuilder<BusSearchController>(builder: (_) {
                    return searchcityController.citydata.isEmpty
                        ? Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ksizedbox40,
                                  ksizedbox40,
                                  ksizedbox40,
                                  ksizedbox10,
                                  Lottie.asset(
                                      'assets/home_page/searchbuslottie.json',
                                      height: 300,
                                      fit: BoxFit.fitHeight)
                                ]),
                          )
                        :

                        // searchcityController.citydata.isEmpty?
                        // Lottie.asset("assets/images/citysearchlottie.json"):
                        ListView.builder(
                            itemCount: searchcityController.citydata.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.find<HomeController>().fromcityid =
                                      searchcityController.citydata[index].city;
                                        Get.find<HomeController>().fromCity =
                                      searchcityController.citydata[index].city;
                                  Get.find<HomeController>()
                                          .fromPlaceTxtController
                                          .text =
                                      "${searchcityController.citydata[index].city}, ${searchcityController.citydata[index].points}";
                                  Get.back();
                                  print('formid........');
                                  print(searchcityController
                                      .citydata[index].city);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          searchcityController.citydata[index].city,
                                          style: primaryFont.copyWith(
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                        if(searchcityController.citydata[index].points != "") Text(
                                          ",${searchcityController.citydata[index].points}",
                                          style: primaryFont.copyWith(
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (index !=
                                        searchcityController.citydata.length -
                                            1)
                                      Divider()
                                  ],
                                ),
                              );
                            });
                  }),
                ),
                SizedBox(
                  height: 20.h,
                ),
              
              // searchcityController.citydata.isNotEmpty
              //     ?
              Container(
                height: 40.h,
                decoration: BoxDecoration(color: klightGrey.withOpacity(0.5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Searches",
                        style: smalbalckfont.copyWith(fontSize: 16.sp),
                      ),
                      Text(
                        "Routes",
                        style: primaryFont.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
              ),
              //  : Text(''),
              SizedBox(
                height: 20.h,
              ),
              //   searchcityController.citydata.isNotEmpty
              // ?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 300,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: searchcityController.boardingDestinations.length >= 4
                        ? 4
                        : searchcityController.boardingDestinations.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3,
                      crossAxisCount: 2,
                      // Only 1 item per row
                      mainAxisSpacing: 8.0,
                      // Spacing between rows
                      //  crossAxisSpacing: 8.0, // Spacing between items in the same row
                    ),
                    itemBuilder: (context, index) {
                      final reversedIndex =
                          searchcityController.boardingDestinations.length - 1 - index;
                      final item =
                          searchcityController.boardingDestinations[reversedIndex];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            // homeController.fromPlaceTxtController.text =
                            //     controller.boardingDestinations[index]
                            //         .destinationName;
                            // homeController.toPlaceTxtController.text =
                            //     boardingDestinations[index].boardingName;
                            // print("----------------------------------..VAL");
                            // print(homeController.fromPlaceTxtController.text);
                            Get.find<HomeController>().fromcityid =
                                      item.boardingName;
                                        Get.find<HomeController>().fromCity =
                                      item.boardingName;
                                  Get.find<HomeController>()
                                          .fromPlaceTxtController
                                          .text =item.boardingName;

                                  Get.find<HomeController>().tocityid =
                                    item.destinationName;
                                    Get.find<HomeController>().toCity =
                                    item.destinationName;
                                Get.find<HomeController>()
                                        .toPlaceTxtController
                                        .text =item.destinationName;
                            Get.to(
                              HomeView(),
                            );
                          },
                          child: RecentChip(
                            places:
                                "${item.boardingName} - ${item.destinationName}",
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
              ],
            ),
          ],
        );
      }),
    );
  }
}
