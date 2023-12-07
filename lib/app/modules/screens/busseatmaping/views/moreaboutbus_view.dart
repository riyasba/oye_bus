import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oye_bus/app/modules/screens/busseatmaping/controllers/busseatmaping_controller.dart';

class MoreaboutbusView extends GetView<BusseatmapingController> {
  MoreaboutbusView({Key? key}) : super(key: key);

  List<String> items = [
    "Why Book/nthis bus?",
    "Explore",
    "Search",
    "Feed",
    "Posts",
  
  ];

  /// List of body icon
  List<String> assetimage = [
  'assets/images/fi_6023285 (1).png'
   "assets/images/bus-driver 1.png",
   "assets/images/coffee 1.png"
   "assets/images/image (1) 1.png"
   "assets/images/star (3) 1.png"

  ];
  //
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<BusseatmapingController>(
      () => BusseatmapingController(),
    );

    // int current = 0;
    PageController pageController = PageController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoreaboutbusView'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            /// Tab Bar
            SizedBox(
              width: double.infinity,
              height: 80,
              child: ListView.builder(shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: assetimage.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index2) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print(assetimage[index2]);
                            controller.setIndex(index2);
                            pageController.animateToPage(
                              index2,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.ease,
                            );
                          },
                          child: Obx(
                            () => Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                   child: Image.asset(assetimage[index2]),
                                    // backgroundColor:controller.current.value == index
                                    //       ? Colors.black
                                    //       : Colors.grey.shade400 ,
                                    
                                   
                                    // size: controller.current.value == index
                                    //     ? 23
                                    //     : 20,
                                    // color: controller.current.value == index
                                    //     ? Colors.black
                                    //     : Colors.grey.shade400,
                                  ),
                                  Text(
                                    items[index2],
                                    style: GoogleFonts.ubuntu(
                                      fontWeight: FontWeight.w500,
                                      color: controller.current.value == index2
                                          ? Colors.black
                                          : Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Visibility(
                        //   visible: controller.current.value == index,
                        //   child: Container(
                        //     width: 5,
                        //     height: 5,
                        //     decoration: const BoxDecoration(
                        //         color: Colors.deepPurpleAccent,
                        //         shape: BoxShape.circle),
                        //   ),
                        // )
                      ],
                    );
                  }),
            ),

            /// MAIN BODY
            Container(
              
              margin: const EdgeInsets.only(top: 30),
              width: double.infinity,
              height: 550,
              child: PageView.builder(
                itemCount: items.length,
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${items[controller.current.value]} Tab Content",
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: Colors.deepPurpleAccent),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
