import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/components/custom_button.dart';
import 'package:oye_bus/app/components/user_input_field.dart';
import 'package:oye_bus/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var phoneNumberController = TextEditingController();
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        title: Text(
          'Create Acount',
          style: appbarfont,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Column(
              children: [
                Image.asset(
                    'assets/images/image_processing20191205-7937-1ftlnk1.gif'),
                // ksizedbox20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hello!',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 19.sp,
                            color: kred,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      'there',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 19.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                ksizedbox10,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Create an account to access your package history and ger real-time updates on all your travels.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 14.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User name',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      UserInputField(
                        controller: nameController,
                        hintText: "Zoey Bennet",
                        isNameField: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name can't be empty";
                          }
                          return null;
                        },
                      ),
                      ksizedbox10,
                      Row(
                        children: [
                          kwidth5,
                          Text(
                            'Email Address',
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
                        //     controller: emailController,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                        autofocus: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
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
                          contentPadding: const EdgeInsets.only(
                            left: 20,
                            right: 10,
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
                          filled: true,
                          hintStyle:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 14.sp,
                                    color: Colors.grey[600],
                                  ),
                          hintText: "example@mail.com",
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email can't be empty";
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "Enter correct email";
                          }
                          return null;
                        },
                      ),
                      ksizedbox10,
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
                      Obx(
                        ()=> TextFormField(
                          controller: phoneNumberController,
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
                        ),
                      ),
                      ksizedbox20,
                      Row(
                        children: [
                          Text(
                            'Have a Referral Code',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  color: kred,
                                ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      UserInputField(
                        controller: nameController,
                        hintText: "Enter referral code (optional)",
                        isNameField: true,
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return "Name can't be empty";
                        //   }
                        //   return null;
                        // },
                      ),
                      ksizedbox40,
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
                      ksizedbox10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'By logging in, you agree to our',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            ' Terms and Conditions',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'and',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            ' Privacy Policy',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue),
                          )
                        ],
                      ),
                      ksizedbox40,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
