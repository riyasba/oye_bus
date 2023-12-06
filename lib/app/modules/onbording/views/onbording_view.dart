import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/comon_custombutton.dart';
import 'package:oye_bus/app/components/contsands.dart';
import 'package:oye_bus/app/components/custom_button.dart';
import 'package:oye_bus/app/modules/onbording/views/widget.dart';
import 'package:oye_bus/app/routes/app_pages.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controllers/onbording_controller.dart';

class OnbordingView extends GetView<OnbordingController> {
  const OnbordingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    return Obx(
      () => Scaffold(
        backgroundColor: kwhite,
        body: SafeArea(
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (notification) {
              notification.disallowIndicator();
              return false;
            },
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) => controller.setIndex(
                      index,
                    ),
                    children: const [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OnboardingPageWidget(
                            imageAsset: 'assets/images/Seart.gif',
                            subtext:
                                "Booking your preferred bus ticket is just a few taps away. Date and time choose everone booked bus tickets simple process.",
                            text: 'Easy Booking',
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OnboardingPageWidget(
                            imageAsset: 'assets/images/Suitecase.gif',
                            subtext:
                                "All your trips in one place. Regular reminders about you upcoming trips.",
                            text: 'Manage Trips',
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OnboardingPageWidget(
                            imageAsset: 'assets/images/LAST.gif',
                            subtext:
                                "Track real time location of your bus and share with friends & Family",
                            text: 'Track Bus',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                controller.checkLastPage()
                    ? Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 25.w,
                          ),
                          color: Colors.white,
                          child: Column(
                            children: [
                              // SizedBox(
                              //   height: 10.h,
                              // ),
                              SmoothPageIndicator(
                                effect: const ExpandingDotsEffect(
                                  dotColor: Color.fromARGB(255, 245, 168, 168),
                                  activeDotColor:
                                      Color.fromARGB(255, 255, 85, 85),
                                ),
                                controller: pageController,
                                count: 3,
                                onDotClicked: (index) =>
                                    pageController.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: 10.h,
                                ),
                                child: CustomElevatedButton(
                                  height: 45.h,
                                  width: 1.sw,
                                  onPressed: () {
                                    Get.toNamed(
                                      Routes.REGISTER,
                                    );
                                    
                                  },
                                  text: 'JOIN US',
                                  color: kred,
                                  textColor: kwhite,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: 2.h,
                                ),
                                child: CustomElevatedButton(
                                  height: 45.h,
                                  width: 1.sw,
                                  onPressed: () {
                                    Get.toNamed(
                                      Routes.LOGIN,
                                    );
                                  },
                                  text: 'LOGIN',
                                  color: kwhite,
                                  textColor: kred,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 25.w,
                          ),
                          color: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              SmoothPageIndicator(
                                effect: const ExpandingDotsEffect(
                                  dotColor: Color.fromARGB(255, 245, 168, 168),
                                  activeDotColor:
                                      Color.fromARGB(255, 255, 85, 85),
                                ),
                                controller: pageController,
                                count: 3,
                                onDotClicked: (index) =>
                                    pageController.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              CustomElevatedButton(
                                height: 45.h,
                                width: 1.sw,
                                onPressed: () {
                                  pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                  // Get.toNamed(
                                  //   Routes.SIGN_IN,
                                  // );
                                },
                                text: 'NEXT',
                                color: kred,
                                textColor: kwhite,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: 10.h,
                                ),
                                child: CustomButton(
                                  onTap: () {
                                    pageController.jumpToPage(3);
                                  },
                                  text: 'Skip',
                                ),
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
    );
  }
}
