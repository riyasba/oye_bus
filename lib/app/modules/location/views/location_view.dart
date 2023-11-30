import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oye_bus/app/components/contsands.dart';
import 'package:oye_bus/app/components/custom_button.dart';
import 'package:oye_bus/app/routes/app_pages.dart';
import '../controllers/location_controller.dart';

class LocationView extends GetView<LocationController> {
  const LocationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text(
          'Choose the Language',
          style: GoogleFonts.montserrat(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(0, 158, 158, 158),
                            width: 2.0),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(0, 158, 158, 158),
                            width: 1.0),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(0, 158, 158, 158),
                            width: 1.0),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      hintText: 'Search',
                      fillColor: Colors.grey[200],
                      focusColor: Colors.grey[200],
                      isDense: true,
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: const Icon(
                        CupertinoIcons.clear,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ksizedbox20,
                  Row(
                    children: [
                      Text('Choose the Country', style: redfont),
                    ],
                  ),
                  ksizedbox20,
                  Container(
                    width: double.infinity,
                    height: 45.h,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/Ellipse 1 (1).png',
                                height: 30,
                              ),
                            ),
                            Text(
                              'India',
                              style: TextStyle(fontSize: 14.sp, color: kgrey),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.check_circle,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ksizedbox20,
                  Row(
                    children: [
                      Text('Choose the Language', style: redfont),
                    ],
                  ),
                  ksizedbox20,
                  Container(
                    width: double.infinity,
                    height: 45.h,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'English',
                            style: TextStyle(fontSize: 14.sp, color: kgrey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.check_circle,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 150.h,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomElevatedButton(
                text: 'CONTINUE',
                color: kred,
                textColor: kwhite,
                onPressed: () {
                  Get.offNamedUntil(
                    Routes.ONBORDING,
                    (route) => false,
                  );
                },
                width: double.infinity,
                height: 45,
              ),
              ksizedbox10,
              CustomElevatedButton(
                text: 'Cancel',
                color: kwhite,
                textColor: kred,
                onPressed: () {},
                width: double.infinity,
                height: 45,
              ),ksizedbox10
            ],
          ),
        ),
      ),
    );
  }
}
