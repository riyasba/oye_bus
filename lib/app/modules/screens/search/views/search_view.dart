import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
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
  
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              height: 40,
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
                      fontSize: 16
                    ),),
                    Container(
                      width: 30,
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: 55,
              child: TextField(
                style: primaryFont.copyWith(
                  fontSize: 18,
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
                  child: SvgPicture.asset("assets/home_page/search-location_icon.svg",height: 30,),
                )
                ),
                      
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: controller.placesList.length,
              shrinkWrap: true,
              itemBuilder: (context,index){
              return InkWell(
                  onTap: (){
                  Get.find<HomeController>().fromPlaceTxtController.text = controller.placesList[index];
                  Get.back();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.placesList[index],style: primaryFont.copyWith(
                      fontSize: 18,
                    ),),
                  if(index != controller.placesList.length -1)  Divider()
                        
                  ],
                ),
              );
            }),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              height: 40,
              decoration: BoxDecoration(
                color: klightGrey.withOpacity(0.5)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recent Searches",style: smalbalckfont.copyWith(
                      fontSize: 16
                    ),),
                    Text("Routes",style: primaryFont.copyWith(
                      fontSize: 12
                    ),),
                  ],
                ),
              ),
            ),
            const SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                RecentChip(
                  places: "Chennai - Salem",
                ),
                const SizedBox(
                  width: 15,
                ),
                RecentChip(
                  places: "Chennai - Erode",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
