import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';

class FormfieldView extends GetView {
  FormfieldView({
    Key? key,
    required this.text,
    required this.labeltext,
  }) : super(key: key);
  final String text;
  final String labeltext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
         autofocus: true,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: kblack, width: 2.0), // Border when focused
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: kblack, width: 2.0), // Border when not focused
          ),
          hintText: text,
          hintStyle: TextStyle(fontWeight: FontWeight.w300, color: kgrey),
          labelText: labeltext, // Changed label text
          labelStyle: TextStyle(
              color: kblack, fontSize: 18.0, fontWeight: FontWeight.w600),
          // Text style for the label
        ),
      ),
    );
  }
}
