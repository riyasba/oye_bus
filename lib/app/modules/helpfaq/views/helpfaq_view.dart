import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/contsands.dart';

import '../controllers/helpfaq_controller.dart';

class HelpfaqView extends GetView<HelpfaqController> {
  const HelpfaqView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(color: kwhite,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[300],
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back),
            ),
            title: Text(
              'Help & FAQs',
              style: appbarfont,
            ),
            centerTitle: true,
          ),
          body: ExpansionTileGroup(children: [
            const ExpansionTileWithoutBorderItem(
              title: Text('Ticket Booking'),
              expendedBorderColor:  Colors.grey,
              children: [
                Text(
                    'Bus Reservation System is intended to automate the purchase of online tickets through an easy-to-use online bus booking system. Integrate our online bus ticket booking system into your website, and your customers will be able to book tickets for a variety of routes and destinations.'),
              ],
            ),
            ExpansionTileWithoutBorderItem(
              title: Text('Ticket Cancellation'),
              expendedBorderColor:  Colors.grey,
              children: [
                Text(
                    'The refund policy depends on an e-ticketing platform as well as the bus operator. The earlier you cancel your bus tickets, the higher the refund amount. Generally, a fee is deducted while refunding bus ticket amount as a 100% refund is not entertained.'),
              ],
            ),
            const ExpansionTileWithoutBorderItem(
              title: Text('Offer'),
              expendedBorderColor:  Colors.grey,
              children: [
                Text(
                    'Oye Bus Ticket Booking offer, you can get flat 20% Cashback upto Rs. 200 on first Bus Ticket Booking at OYE Bus. Get 10% upto Rs. 150 Cashback on second and third Order.'),
              ],
            ),
            const ExpansionTileWithoutBorderItem(
              title: Text('Payments & Refunds'),
              expendedBorderColor:  Colors.grey,
              children: [
                Text('The earlier you cancel your bus tickets, the higher the refund amount. Generally, a fee is deducted while refunding bus ticket amount as a 100% refund is not entertained. The refund amount is sent to the source (bank account, e-wallet, etc.) used to pay the bus ticket amount.'),
              ],
            ),
            const ExpansionTileWithoutBorderItem(
              title: Text('Bus Live Tracking'),
              expendedBorderColor: Colors.grey,
              children: [
                Text('''A bus reservation system is a mobile or web software solution designed to provide customers with a personalized easy-to-utilize user experience for booking and purchasing tickets online. It stores customers' personal data records, scheduled routes, frequent trips, drop points, and other information.'''),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
