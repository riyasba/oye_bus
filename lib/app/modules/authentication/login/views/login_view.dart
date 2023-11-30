import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/contsands.dart';
import 'package:oye_bus/app/components/custom_button.dart';
import 'package:oye_bus/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhite,
        appBar: AppBar(backgroundColor: kwhite,
          title: Text(
            'Login Your Account',
            style: appbarfont,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Mask group (1).png'),
              // ksizedbox20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter Your ',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 19.sp,
                          color: kred,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    'Phone Number',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 19.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  )
                ],
              ),
              ksizedbox10,
        
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'We will send you the 4 digit verification code',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 14.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),ksizedbox30,
            Row(
                          children: [
                            kwidth5,
                            Text(
                              'Phone Number',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextFormField(
                       //   controller: phoneNumberController,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontSize: 15.sp,
                                color: Colors.black,
                              ),
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: Container(
                              width: 75.w,
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      controller.phoneCode.isEmpty
                                          ? '+1'
                                          : '+${controller.phoneCode}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontSize: 13.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      controller.selectCountry(
                                        context: context,
                                      );
                                    },
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 24.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1.5,
                                color: Colors.black,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(
                                60.r,
                              ),
                            ),
                            contentPadding: EdgeInsets.only(
                              left: 10.w,
                              right: 10.w,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1.2,
                                color: Colors.black,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(
                                60.r,
                              ),
                            ),
                            hintText: "5874536954",
                            hintStyle:
                                Theme.of(context).textTheme.titleLarge!.copyWith(
                                      fontSize: 15.sp,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w100,
                                    ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Phone number is required";
                            }
                            return null;
                          },
                        ),   ksizedbox30,   ksizedbox40,
                      CustomElevatedButton(
                        height: 45.h,
                        width: 1.sw,
                        onPressed: () {
                          Get.toNamed(
                            Routes.OTP,
                          );
                        },
                        text: 'GENERATE OTP',
                        color: kred,
                        textColor: kwhite,
                      ),
                   ksizedbox10, ],
          ),
        ));
  }
}
