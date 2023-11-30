import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oye_bus/app/components/contsands.dart';

class OnboardingPageWidget extends StatelessWidget {
  const OnboardingPageWidget({
    Key? key,
    required this.imageAsset,
    required this.text,
    required this.subtext,
  }) : super(key: key);
  final String imageAsset;
  final String text;
  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ksizedbox40,
        Image.asset(
          imageAsset,
          fit: BoxFit.contain,
        ),
        ksizedbox10,
        Text(
          text,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        ksizedbox10,
        Text(
          subtext,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
