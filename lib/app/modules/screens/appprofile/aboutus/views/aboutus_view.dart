import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';

import '../controllers/aboutus_controller.dart';

class AboutusView extends GetView<AboutusController> {
  const AboutusView({Key? key}) : super(key: key);
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
          body: Center(
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
                        '''A bus (contracted from omnibus, with variants multibus, motorbus, autobus, etc.) is a road vehicle that carries significantly more passengers than an average car or van. It is most commonly used in public transport, but is also in use for charter purposes, or through private ownership. A bus (contracted from omnibus, with variants multibus, motorbus, autobus, etc.)''',
                        style: TextStyle(fontWeight: FontWeight.w500),
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
          ),
        ),
      ),
    );
  }
}
