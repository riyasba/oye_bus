import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/contsands.dart';
import 'package:oye_bus/app/components/custom_button.dart';
import 'package:oye_bus/app/modules/copassengers/views/addcopassengers_view.dart';
import '../controllers/copassengers_controller.dart';

class CopassengersView extends GetView<CopassengersController> {
  const CopassengersView({Key? key}) : super(key: key);
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
              child: Icon(Icons.arrow_back),
            ),
            title: Text(
              'Co-Passengers',
              style: appbarfont,
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        color: Colors.black, // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name:Riyas',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          Text('Age:23',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                          Text('Gender:male',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                  ),
                  ksizedbox40,
                  ksizedbox40,
                  Image.asset('assets/images/fi_1611631.png'),
                  ksizedbox20,
                  Text(
                    'You have not added co-passengers yet',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: kgrey,
                        fontSize: 18),
                  ),
                  ksizedbox40,
                  ksizedbox40,
                  CustomElevatedButton(
                    height: 45.h,
                    width: 1.sw,
                    onPressed: () {
                      Get.to(
                        AddcopassengersView(),
                      );
                    },
                    text: 'Add Co-Paaengers',
                    color: kred,
                    textColor: kwhite,
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
