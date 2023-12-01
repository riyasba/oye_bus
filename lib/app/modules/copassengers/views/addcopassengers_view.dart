import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/contsands.dart';

class AddcopassengersView extends GetView {
  const AddcopassengersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
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
        body:Center(
          child: Column(
            children: [ksizedbox20,
              Text(
                'AddcopassengersView is working',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
