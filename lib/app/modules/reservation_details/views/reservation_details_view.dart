import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';

import '../controllers/reservation_details_controller.dart';

class ReservationDetailsView extends GetView<ReservationDetailsController> {
  const ReservationDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservation Details',
        style: TextStyle(
          fontWeight: FontWeight.w500
        ),),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            Container(
              height: 651,
              width: 374,
              decoration: BoxDecoration(
                color: Color(0xffFF0000)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Chennai  - Bengaluru',
                        style: TextStyle(
                          fontFamily: 'Proxima',
                          fontSize: 20.5,
                          fontWeight: FontWeight.w600,
                          color: kwhite
                        ),),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kwhite
                          ),
                          child: Image.asset('assets/offers_icon/resershareicon.png'),
                        )
                      ],
                    ),
                    Text('10 Nov 2023, Saturday',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Proxima',
                      fontWeight: FontWeight.w400,
                      color: kwhite
                    ),),
                    ksizedbox10,
                    Container(
                      width: 374,
                      child: Text('------------------------------------------------------',
                      style: TextStyle(
                        color: kwhite
                      ),))
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
