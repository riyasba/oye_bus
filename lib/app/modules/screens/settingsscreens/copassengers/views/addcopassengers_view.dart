import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/components/custom_button.dart';
import 'package:oye_bus/app/modules/screens/profile/views/widget/formfield_view.dart';
import 'package:oye_bus/app/modules/screens/settingsscreens/copassengers/controllers/copassengers_controller.dart';

class AddcopassengersView extends GetView {
   AddcopassengersView({Key? key}) : super(key: key);
 final  passengerController  = Get.find<CopassengersController>();
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
              'Add Co-Passengers',
              style: appbarfont,
            ),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ksizedbox20,
                    FormfieldView(
                      text: 'Riyas',
                      labeltext: 'Name', 
                      controller:passengerController.nameController,
                    ),
                    FormfieldView(
                      text: '23',
                      labeltext: 'Age', 
                      controller: passengerController.ageController,
                    ),
                    FormfieldView(
                      text: 'Male',
                      labeltext: 'Gender', 
                      controller: passengerController.genderController,
                    ),
                    ksizedbox40,
                    ksizedbox40,
                    ksizedbox40,
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h, left: 8, right: 8),
                      child: CustomElevatedButton(
                        height: 45.h,
                        width: 1.sw,
                        onPressed: () {
                          // Get.toNamed(
                          //   Routes.REGISTER,
                          // );
                        },
                        text: 'SAVE',
                        color: kred,
                        textColor: kwhite,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h, left: 8, right: 8),
                      child: CustomElevatedButton(
                        height: 45.h,
                        width: 1.sw,
                        onPressed: () {
                          // Get.toNamed(
                          //   Routes.LOGIN,
                          // );
                        },
                        text: 'Cancel',
                        color: kwhite,
                        textColor: kred,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
