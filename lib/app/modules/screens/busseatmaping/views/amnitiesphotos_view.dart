import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oye_bus/app/components/const.dart';



class AmnitiesphotosView extends GetView {
  const AmnitiesphotosView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Amenities & Photos',
            style: bussmidfont,
          ),
          ksizedbox20,
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  SvgPicture.asset('assets/images/Group 24.svg'),
                  ksizedbox10,
                  Text(
                    'Track My Bus',
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
              Column(
                children: [
                  SvgPicture.asset('assets/images/fi_1452028.svg'),
                  ksizedbox10,
                  Text(
                    'Water Bottle',
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
              Column(
                children: [
                  SvgPicture.asset('assets/images/fi_2737832.svg'),
                  ksizedbox10,
                  Text(
                    'Rest Stop(s)',
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
              Column(
                children: [
                  SvgPicture.asset('assets/images/fi_8368047.svg'),
                  ksizedbox10,
                  Text(
                    'Charging Points',
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              )
            ],
          ), ksizedbox40, Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/Rectangle 203.png'),
                 Image.asset('assets/images/Rectangle 204.png'),
                    Image.asset('assets/offers_icon/Rectangle 205.png'),
                       Image.asset('assets/offers_icon/Rectangle 206.png'),
            ],
          ),
          Text('View All Full Screen Images',   style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),)
        ],
      ),
    ));
  }
}
