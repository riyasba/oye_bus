import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';

import '../controllers/aboutus_controller.dart';

class AboutusView extends GetView<AboutusController> {
   AboutusView({Key? key}) : super(key: key);
  final aboutusController = Get.find<AboutusController>();
  @override
  Widget build(BuildContext context) {
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
                child: Icon(Icons.arrow_back)),
            title: Text(
              'About Us',
              style: appbarfont,
            ),
            centerTitle: true,
          ),
          body: GetBuilder<AboutusController>(
            builder: (_) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/image 2 (1).png',
                            height: 250,
                          ),
                          ksizedbox20,
                          Text(
                            aboutusController.aboutdata.value,
                         
                          ),
                          ksizedbox20,
                          Row(
                            children: [
                              Text(
                                'Version : 0.0.0.1',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, color: kred),
                              ),
                            ],
                          ),
                          ksizedbox10,
                          Divider(
                            height: 1,
                            color: kgrey,
                          ),
                          ksizedbox10,
                          Row(
                            children: [
                              Text(
                                'Share with Friends',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, color: kred),
                              ),
                            ],
                          ),
                          ksizedbox10,
                          Divider(
                            height: 1,
                            color: kgrey,
                          ),
                          ksizedbox10,
                          Row(
                            children: [
                              Text(
                                'Blog',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, color: kred),
                              ),
                            ],
                          ),
                          ksizedbox10,
                          Divider(
                            height: 1,
                            color: kgrey,
                          ),
                          ksizedbox10,
                          Row(
                            children: [
                              Text(
                                'Privacy policy',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, color: kred),
                              ),
                            ],
                          ),
                          ksizedbox10,
                          Divider(
                            height: 1,
                            color: kgrey,
                          ),
                          ksizedbox10,
                          Row(
                            children: [
                              Text(
                                'Terms and Conditions',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, color: kred),
                              ),
                            ],
                          ),
                          ksizedbox10,
                          Divider(
                            height: 1,
                            color: kgrey,
                          ),
                          ksizedbox10,
                          Row(
                            children: [
                              Text(
                                'User Agreement',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, color: kred),
                              ),
                            ],
                          ),
                          ksizedbox10,
                          Divider(
                            height: 1,
                            color: kgrey,
                          ),ksizedbox10,
                          Row(
                            children: [
                              Text(
                                'Licenses',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, color: kred),
                              ),
                            ],
                          ),
                          ksizedbox10,
                          Divider(
                            height: 1,
                            color: kgrey,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
