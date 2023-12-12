import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/controllers/busseatmaping_controller.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/amnitiesphotos_view.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/busrating_view.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/dropingbording_view.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/restshop_view.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/whybookbuss_view.dart';

class MoreaboutbusView extends GetView<BusseatmapingController> {
  MoreaboutbusView({Key? key}) : super(key: key);

  List<String> items = [
    "Why Book\nthis bus?",
    "Boarding/\nDropping",
    "Rest Stop(s)",
    "Amenities & Photos",
    "Ratings & Reviews",
  ];

  /// List of body icon
  List<IconData> icons = [
    Icons.bus_alert,
    Icons.pin_drop,
    Icons.restaurant,
    Icons.photo_library_outlined,
    Icons.star_border,
  ];
  //
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Get.lazyPut<BusseatmapingController>(
      () => BusseatmapingController(),
    );

    PageController pageController = PageController();
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back)),
        title: Text(
          'More about this bus',
          style: appbarfont,
        ),
        centerTitle: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Column(
            children: [
              /// Tab Bar
              SizedBox(
                width: double.infinity,
                height: 86.h,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: icons.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index2) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print(icons[index2]);
                              controller.setIndex(index2);
                              pageController.animateToPage(
                                index2,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.ease,
                              );
                            },
                            child: Obx(
                              () => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.all(5),
                                width: 100,
                                height: 70.h,
                                decoration: BoxDecoration(
                                  color: controller.current.value == index2
                                      ? Colors.white70
                                      : Colors.white54,
                                  borderRadius:
                                      controller.current.value == index2
                                          ? BorderRadius.circular(12)
                                          : BorderRadius.circular(7),
                                  border: controller.current.value == index2
                                      ? Border.all(color: kred, width: 2.5)
                                      : null,
                                ),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        icons[index2],
                                        size: controller.current.value == index2
                                            ? 23
                                            : 20,
                                        color:
                                            controller.current.value == index2
                                                ? kred
                                                : Colors.grey.shade400,
                                      ),
                                      Text(
                                        items[index2],
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.ubuntu(
                                          fontWeight: FontWeight.w500,
                                          color:
                                              controller.current.value == index2
                                                  ? kred
                                                  : Colors.grey.shade400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Obx(
                            () => Visibility(
                              visible: controller.current.value == index2,
                              child: Container(
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                    color: kred, shape: BoxShape.circle),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
              ),

              /// MAIN BODY
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: double.infinity,
                height: 1000,
                child: PageView(
                  onPageChanged: (index) => controller.setIndex(
                    index,
                  ),
                  controller: pageController,
                  children: [
                    WhybookbussView(),
                    DropingbordingView(),
                    RestshopView(),
                    AmnitiesphotosView(),
                    BusratingView(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
