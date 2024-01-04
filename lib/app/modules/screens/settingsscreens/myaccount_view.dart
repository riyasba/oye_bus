import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/models/feedback_model.dart';
import 'package:oye_bus/app/modules/authentication/login/controllers/login_controller.dart';
import 'package:oye_bus/app/modules/authentication/login/views/login_view.dart';
import 'package:oye_bus/app/modules/authentication/register/controllers/register_controller.dart';
import 'package:oye_bus/app/modules/authentication/register/views/register_view.dart';
import 'package:oye_bus/app/modules/onbording/controllers/onbording_controller.dart';
import 'package:oye_bus/app/modules/onbording/views/onbording_view.dart';
import 'package:oye_bus/app/modules/screens/profile/views/widget/myaccountbutton_view.dart';
import 'package:oye_bus/app/modules/screens/settingsscreens/settings/controllers/settings_controller.dart';
import 'package:oye_bus/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;


class MyaccountView extends GetView<SettingsController> {
   MyaccountView({Key? key}) : super(key: key);
  final settingsController = Get.find<SettingsController>();
 
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
          body: ListView(
            children: [
              Center(
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
                          //ksizedbox20,
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
                                              'assets/images/oyelogoutimage.png'),
                                        ],
                                      ),
                                      content: Container(
                                        width: 150.w,
                                        child: const Text(
                                          "Are you sure want to Logout your account?",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: Container(
                                                height: 38,
                                                width: 105,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                        BorderRadius.circular(6),
                                                    // ignore: unrelated_type_equality_checks
                                                    color: kgrey),
                                                child: Center(
                                                    child: Text("No",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: kblack))),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                              Get.find<LoginController>().logOut();
                                                // authController.logoutindex(1);
                                                // authController.update();
                                                //  Get.find<AuthController>().logout();
                                              },
                                              child: Container(
                                                height: 38,
                                                width: 105,
                                                decoration: BoxDecoration(
                                                    color: kred,
                                                    borderRadius:
                                                        BorderRadius.circular(6)),
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
            ],
          ),
        ),
      ),
    );
  }
}
double ratingCount = 0.0;
void _showAlertDialog(BuildContext context, String message) {
  final settingsController = Get.find<SettingsController>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          width: 400.w, // Set a custom width
          height: 500.h,
          child: ListView(
            children: [
              Column(
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
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 3),
                      itemBuilder: (context, _) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.star,
                          size: 90,
                          color: Colors.amber,
                        ),
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                        ratingCount = rating;
                      },
                    ),
                  ),
                  ksizedbox20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Not at all'), Text('Loved it!')],
                  ),
                  ksizedbox20,
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300
                    ),
                    child: TextField(
                      controller: settingsController.subjectController,
                      decoration: InputDecoration(
                        hintText:  'subject',
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  ksizedbox20,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300
                    ),
                    child: TextField(
                      controller: settingsController.feedbackController,
                      maxLines: 2,
                     // maxLength: 5,
                      decoration: InputDecoration(
                        hintText:'Type your Feedback...',
                        border: OutlineInputBorder(
                        )
                      ),
                    ),
                  ),
                  ksizedbox40,
                  InkWell(
                    onTap: (){
                      FeedbackModel feedbackModel = FeedbackModel(
                        feedback:settingsController.feedbackController.text, 
                        rating: ratingCount,  
                        subject: settingsController.subjectController.text);
                      settingsController.getfeedback(feedbackModel: feedbackModel);
           
                      Get.back();
                    },
                    child: Container(
                      height: 50,
                      width: 400,
                      decoration: BoxDecoration(
                        color: kred,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text('Submit',
                        style: TextStyle(
                          fontSize: 17.sp,
                          color: kwhite
                        ),),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
