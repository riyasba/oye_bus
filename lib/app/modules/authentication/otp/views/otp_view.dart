import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/components/custom_button.dart';
import 'package:oye_bus/app/modules/authentication/register/controllers/register_controller.dart';
import 'package:oye_bus/app/modules/screens/profile/controllers/profile_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  String mobile;
  OtpView({Key? key, required this.mobile})
      : super(
          key: key,
        );

  final otpController = Get.find<OtpController>();
  String _otpValue = "";
  String otpString = "";
  bool _isActive = false;

  int _start = 60; // Timer duration in seconds

  @override
  Widget build(BuildContext context) {
    bool hasError = false;
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Mask group (1).png'),
              ksizedbox20,
              Row(
                children: [
                  Text(
                    'Verify phone number',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 18.sp,
                        ),
                  ),
                ],
              ),
              ksizedbox20,
              Text(
                '''Check your SMS messages. We've sent you the PIN at ${mobile}''',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 14.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              ksizedbox30,
              Container(
                width: 300.w,
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: kgrey,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 4,
                  obscureText: false,
                  obscuringCharacter: '*',
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 3) {
                      return "";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                      selectedFillColor: kred,
                      activeColor: kgrey,
                      inactiveColor: kgrey,
                      selectedColor: kred,
                      inactiveFillColor: kgrey,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(9),
                      fieldHeight: 60,
                      fieldWidth: 62,
                      activeFillColor: hasError ? kgrey : kred),
                  // cursorColor: AppColors.black,
                  animationDuration: Duration(milliseconds: 300),
                  textStyle: TextStyle(
                    color: kwhite,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                  enableActiveFill: true,
                  // errorAnimationController: errorController,
                  //     controller: textEditingController,
                  keyboardType: TextInputType.number,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  // onTap: () {
                  //   print("Pressed");
                  // },
                  onChanged: (value) {
                    print(value);
                    // setState(() {
                    //   currentText = value;
                    // });
                    _otpValue = value;
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    return true;
                  },
                ),
              ),
              ksizedbox10,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '''Didn't receive SMS?''',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 14.sp,
                          // color: Colors.grey,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  // otpController._isActive
                  Obx(()=> controller.isActive.isTrue
                        ? GetBuilder<OtpController>(builder: (_) {
                            return Text(
                              "Resend in ${controller.start}",
                              style: primaryFont.copyWith(color: Colors.blue),
                            );
                          })
                        : InkWell(
                            onTap: () async {
                               await controller.rendOtpFunction(
                                  mobileNumber: mobile);
                    
                              
                              
                              controller.startTimer();
                            },
                            child: Text(
                              ' RESEND OTP -',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    fontSize: 14.sp,
                                    color: kred,
                                    fontWeight: FontWeight.w300,
                                  ),
                            )),
                  )
                  // Text(
                  //   ' Resend Code',
                  //   textAlign: TextAlign.center,
                  //   style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  //         fontSize: 14.sp,
                  //         color: kred,
                  //         fontWeight: FontWeight.w300,
                  //       ),
                  // )
                ],
              ),
              ksizedbox40,
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => otpController.isLoading == true
            ? Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kred,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomElevatedButton(
                  height: 45.h,
                  width: 1.sw,
                  onPressed: () {
                    otpController.loginVerify(mobile: mobile, otp: _otpValue);
                  },
                  text: 'CONTINUE',
                  color: kred,
                  textColor: kwhite,
                ),
              ),
      ),
    );
  }
}
