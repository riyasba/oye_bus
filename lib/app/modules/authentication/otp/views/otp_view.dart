import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/contsands.dart';
import 'package:oye_bus/app/components/custom_button.dart';
import 'package:oye_bus/app/modules/authentication/otp/views/otpsucess.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool hasError = false;
    return Scaffold(
      appBar: AppBar(),
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
                  Text('Verify phone number',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 18.sp,
                          )),
                ],
              ),
              ksizedbox20,
              Text(
                '''Check your SMS messages. We've sent you the PIN at +91 98765 43210''',
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
                  Text(
                    ' Resend Code',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 14.sp,
                          color: kred,
                          fontWeight: FontWeight.w300,
                        ),
                  )
                ],
              ),
              ksizedbox40,
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomElevatedButton(
          height: 45.h,
          width: 1.sw,
          onPressed: () {
            Get.to(SuccessfulScreen());
            // Get.toNamed(
            //   Routes.OTP,
            // );
          },
          text: 'CONTINUE',
          color: kred,
          textColor: kwhite,
        ),
      ),
    );
  }
}
