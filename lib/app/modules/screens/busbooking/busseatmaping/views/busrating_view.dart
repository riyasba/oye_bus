import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BusratingView extends GetView {
  BusratingView({Key? key}) : super(key: key);
  List<double> ratings = [0.1, 0.3, 0.5, 0.7, 0.9];
  List<String> likes = ['Punctually - 654', 'Seat Comfort - 55', 'Cleanlines -432', 'Staff behavior -643', 'Ac -432'];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ratings & Reviews',
              style: bussmidfont,
            ),
            ksizedbox20,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/Vector (1).svg',
                  height: 30,
                ),
                kwidth5,
                Text(
                  '4.4',
                  style: GoogleFonts.montserrat(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(' (619 ratings)')
              ],
            ),
            ksizedbox30,
            ListView.builder(
              shrinkWrap: true,
              reverse: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text(
                      "${index + 1}",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    // SizedBox(width: 4.0),
                    // Icon(Icons.star, color: Colors.orange),
                    // SizedBox(width: 8.0),
                    LinearPercentIndicator(
                      barRadius: Radius.circular(9),
                      lineHeight: 8.0,
                      // linearStrokeCap: LinearStrokeCap.roundAll,
                      width: MediaQuery.of(context).size.width / 1.4,
                      animation: true,

                      animationDuration: 2500,
                      percent: ratings[index],
                      progressColor: Colors.blue,
                    ),
                    kwidth5,
                    Text(
                      "9${index + 1}%",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                );
              },
            ),
            ksizedbox20,
            Text(
              'What Travellers Liked',
              style: bussmidfont,
            ),
            ksizedbox20,
            ListView.builder(
              shrinkWrap: true,
              reverse: true,
              itemCount: likes.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text(
                      likes[index],
                      style: TextStyle(fontSize: 18.0),
                    ),
                  
                  ],
                );
              },
            ),ksizedbox20,Text(
  'All Reviews',
  style: TextStyle(
    decoration: TextDecoration.underline, // Add underline decoration
    decorationColor: Colors.red, // Set the underline color
    decorationStyle: TextDecorationStyle.solid, // Set the underline style
    fontSize: 16, // Set the font size
    fontWeight: FontWeight.bold, // Set the font weight
    color: Colors.red, // Set the text color
  ),
)
          ],
        ),
      ),
    );
  }
}
