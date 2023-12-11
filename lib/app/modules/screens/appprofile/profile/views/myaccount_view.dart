import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/appprofile/profile/views/widget/myaccountbutton_view.dart';
import 'package:oye_bus/app/routes/app_pages.dart';

class MyaccountView extends GetView {
  const MyaccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(color: kwhite,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[300],
            leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back)),
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
                        onPressed: () {Get.toNamed(
                            Routes.BOTTUMNAVIGATION,
                          );},
                        text: 'My Booking',
                      ),
                      ksizedbox20,
                      MyaccountbuttonView(
                        onPressed: () {
                          Get.toNamed(
                            Routes.PROFILE,
                          );
                        },
                        text: 'Profile',
                      ),
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
                        onPressed: () {},
                        text: 'Offers',
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
                        onPressed: () {},
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
                        onPressed: () {},
                        text: 'Feedback',
                      ),
                      ksizedbox20,
                      MyaccountbuttonView(
                        onPressed: () {},
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
