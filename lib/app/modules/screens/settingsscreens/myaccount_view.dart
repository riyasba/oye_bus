import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/authentication/register/controllers/register_controller.dart';
import 'package:oye_bus/app/modules/authentication/register/views/register_view.dart';
import 'package:oye_bus/app/modules/screens/profile/views/widget/myaccountbutton_view.dart';
import 'package:oye_bus/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;



class MyaccountView extends GetView {
  const MyaccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      Get.put(RegisterController());
    return Container(
      color: kwhite,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[300],
            leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: kblack,
                )),
            title: Text(
              'My Account',
              style: appbarfont,
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Column(
                    children: [
                      ksizedbox30,
                      MyaccountbuttonView(
                        onPressed: () {
                          Get.toNamed(
                            Routes.BOTTUMNAVIGATION,
                          );
                        },
                        text: 'My Booking',
                      ),
                      //       ksizedbox20,

                      ksizedbox20,
                      MyaccountbuttonView(
                        onPressed: () {
                          Get.toNamed(
                            Routes.CARD,
                          );
                        },
                        text: 'Cards',
                      ),
                      ksizedbox20,
                      MyaccountbuttonView(
                        onPressed: () {
                          Get.toNamed(
                            Routes.COPASSENGERS,
                          );
                        },
                        text: 'Co-Passengers(Bus)',
                      ),
                      ksizedbox20,
                      MyaccountbuttonView(
                        onPressed: () {
                          Get.toNamed(
                            Routes.REFERFRIENDS,
                          );
                        },
                        text: 'Refer Fiends',
                      ),
                      ksizedbox20,

                      MyaccountbuttonView(
                        onPressed: () {
                          Get.toNamed(Routes.HELPFAQ);
                        },
                        text: 'Help',
                      ),
                      ksizedbox20,
                      MyaccountbuttonView(
                        onPressed: () async {
                          Uri uri = Uri.parse('tel:+1-555-010-999');
                          if (!await launcher.launchUrl(uri)) {
                            debugPrint(
                                "Could not launch the uri"); // because the simulator doesn't has the phone app
                          }
                        },
                        text: 'Call Support',
                      ),
                      ksizedbox20,
                      MyaccountbuttonView(
                        onPressed: () {
                          Get.toNamed(Routes.SETTINGS);
                        },
                        text: 'Settings',
                      ),
                      ksizedbox20,
                      MyaccountbuttonView(
                        onPressed: () {
                          Get.toNamed(Routes.ABOUTUS);
                        },
                        text: 'About Us',
                      ),
                      ksizedbox20,
                      MyaccountbuttonView(
                        onPressed: () {
                          String message = "This is a custom message!";
                          _showAlertDialog(context, message);
                        },
                        text: 'Feedback',
                      ),
                      ksizedbox20,
                      MyaccountbuttonView(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  backgroundColor: Colors.white,
                                  title: Column(
                                    children: [
                                      Image.asset(
                                          'assets/images/logoutimage.png'),
                                      Text("Comeback Soon!",
                                          style: TextStyle(
                                              fontSize: 25.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    ],
                                  ),
                                  content: const Text(
                                    "Are you sure want to logout?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                // ignore: unrelated_type_equality_checks
                                                color: kwhite),
                                            child: Center(
                                                child: Text("Cancel",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: kblack))),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.to(
                                              RegisterView(),
                                            );
                                            // authController.logoutindex(1);
                                            // authController.update();
                                            //  Get.find<AuthController>().logout();
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                color: kred,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Center(
                                              child: Text("Logout",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: kwhite)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ksizedbox10
                                  ],
                                );
                              });
                        },
                        text: 'Logout',
                      ),
                      ksizedbox20,
                    ],
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

void _showAlertDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          width: 350.0.w, // Set a custom width
          height: 330.h,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Enjoying the OYEBUS app?'),
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset('assets/images/fi_4347434.svg'))
                ],
              ),
              ksizedbox30,
              SvgPicture.asset('assets/images/fi_2977670.svg'),
              ksizedbox20,
              Text('Rate your experience'),
              ksizedbox30,
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              ksizedbox20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Not at all'), Text('Loved it!')],
              )
            ],
          ),
        ),
      );
    },
  );
}
