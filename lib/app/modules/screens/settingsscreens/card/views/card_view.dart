


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import '../controllers/card_controller.dart';



class CardView extends GetView<CardController> {
  const CardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kwhite,
          appBar: AppBar(
            backgroundColor: Colors.grey[300],
            leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back)),
            title: Text(
              'Cards',
              style: appbarfont,
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/fi_71790.png'),
                Text(
                  'You have not saved any cards',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: kgrey, fontSize: 18),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
