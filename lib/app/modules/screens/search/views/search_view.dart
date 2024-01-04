import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/home/controllers/home_controller.dart';
import 'package:oye_bus/app/modules/screens/search/controllers/search_controller.dart';
import 'package:oye_bus/app/modules/screens/search/widgets/recent_chips.dart';


class SearchView extends GetView<BusSearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     Get.lazyPut<BusSearchController>(
      () => BusSearchController(),
    );
    final searchcityController = Get.find<BusSearchController>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: klightGrey.withOpacity(0.5)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back,color: Colors.black,)),
                    Text("Choose Boarding Points",style: smalbalckfont.copyWith(
                      fontSize: 16.sp
                    ),),
                    Container(
                      width: 30.w,
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ),
      body: GetBuilder<BusSearchController>(
        builder: (_) {
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
                      height: 55.h,
                      child: TextField(
                        controller: searchcityController.searchfromcontroller,
                        style: primaryFont.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500
                        ),
                          decoration: InputDecoration(
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                          color:  Color.fromARGB(255, 200, 200, 200)
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                          color:  Color.fromARGB(255, 200, 200, 200)
                          ),
                        ),
                        hintText: "Search",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset("assets/home_page/search-location_icon.svg",height: 30.h,),
                        )
                        ),
                              
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GetBuilder<BusSearchController>(
                      builder: (_) {
                        return searchcityController.citydata.isEmpty? 
                        Lottie.asset("assets/images/citysearchlottie.json"):ListView.builder(
                          itemCount:searchcityController.citydata.length,
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                          return InkWell(
                              onTap: (){
                              Get.find<HomeController>().fromPlaceTxtController.text = searchcityController.citydata[index].city;
                              Get.back();
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(searchcityController.citydata[index].city,
                                style: primaryFont.copyWith(
                                  fontSize: 18.sp,
                                ),),
                              if(index != searchcityController.citydata.length -1)  Divider()
                                    
                              ],
                            ),
                          );
                        });
                      }
                    ),
                  ),
                   SizedBox(
                    height: 20.h,
                  ),
                  searchcityController.citydata.isNotEmpty?
                  Container(
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: klightGrey.withOpacity(0.5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Recent Searches",style: smalbalckfont.copyWith(
                              fontSize: 16.sp
                            ),),
                            Text("Routes",style: primaryFont.copyWith(
                              fontSize: 12.sp
                            ),),
                          ],
                        ),
                      ),
                    ):Text(''),
                     SizedBox(
                    height: 20.h,
                  ),
                searchcityController.citydata.isNotEmpty?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        RecentChip(
                          places: "Chennai - Salem",
                        ),
                         SizedBox(
                          width: 15.w,
                        ),
                        RecentChip(
                          places: "Chennai - Erode",
                        ),
                      ],
                    ),
                  ):Text('')
                ],
              ),
            ],
          );
        }
      ),
    );
  }
}
