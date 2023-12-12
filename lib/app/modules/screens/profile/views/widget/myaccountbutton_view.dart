import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';

class MyaccountbuttonView extends GetView {
  const MyaccountbuttonView({required this.onPressed,required this.text,
    Key? key}) : super(key: key);
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onPressed,
      child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              text,
                              style: TextStyle(
                                  color: kblack,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: kgrey,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
    );
  }
}
