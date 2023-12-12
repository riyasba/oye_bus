import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oye_bus/app/components/const.dart';



class AmnitiesphotosView extends GetView {
  const AmnitiesphotosView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(height: 1000,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Column(
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
                    ),
                  ],
                ),
                ksizedbox40,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/images/Rectangle 203.png'),
                    Image.asset('assets/images/Rectangle 204.png'),
                    Image.asset('assets/offers_icon/Rectangle 205.png'),
                    Image.asset('assets/offers_icon/Rectangle 206.png'),
                  ],
                ),
                ksizedbox20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'View All Full Screen Images',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        decoration: TextDecoration
                            .underline, // Add underline decoration
                      ),
                    ),
                  ],
                ),
                ksizedbox20,
                Text(
                  'Date change',
                  style: bussmidfont,
                ),
                ksizedbox20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Time before Travel'),
                    Text('Date Change Charged')
                  ],
                ),
                ksizedbox30,
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        kwidth10,
                        Text('Before 10th Nov 2023 03:30 PM'),
                        Container(
                          decoration: BoxDecoration(
                            color: kYellow,
                            border: Border.all(
                              color: const Color.fromARGB(
                                  177, 0, 0, 0), // Border color
                              width: .2, // Border width
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'FREE',
                              style: TextStyle(color: kwhite),
                            ),
                          ),
                          height: 50,
                          width: 100,
                        ),
                      ]),
                  height: 50,
                  width: double.infinity,
                ),
                ksizedbox20,
                Text(
                  'Child passenger policy',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 14.sp,
                        color: kblack,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  'Children above the age of 5 will need a ticket',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 12.sp,
                        color: kblack,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                ksizedbox20,
                Text(
                  'Luggage policy',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 14.sp,
                        color: kblack,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  '2 pieces of luggage will be accepted free of charge per passenger. Excess items will be chargeable',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 12.sp,
                        color: kblack,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                ksizedbox20,
                Text(
                  'Excess baggage over 10 kgs per passenger will be chargeable',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 12.sp,
                        color: kblack,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                ksizedbox40,
                Table(
                  border: TableBorder.all(),
                  columnWidths: {
                    0: FlexColumnWidth(3), // Adjust width for column 0
                    1: FlexColumnWidth(2), // Adjust width for column 1
                  },
                  defaultColumnWidth: FlexColumnWidth(1.0),
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            height: 50,
                            child:
                                Center(child: Text('Before 10th Nov 11:30 AM')),
                          ), // Content for cell 1
                        ),
                        TableCell(
                          child: Container(
                            height: 50,
                            child: Center(child: Text('₹194 / 205 (10%)')),
                          ), // Content for cell 2
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            height: 50.h,
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'After 10th Nov 11:30 AM & Before 10th Nov 03:30 PM'),
                            )),
                          ), // Content for cell 4
                        ),
                        TableCell(
                          child: Container(
                            height: 50.h,
                            child: Center(child: Text('₹485 / 513 (25%)')),
                          ), // Content for cell 5
                        ),
                      ],
                    ),

                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            height: 50.h,
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'After 10th Nov 07:30 PM & Before 10th Nov 11:30 PM'),
                            )),
                          ), // Content for cell 1
                        ),
                        TableCell(
                          child: Container(
                            height: 50.h,
                            child: Center(child: Text('₹1940 / 2050 (100%)')),
                          ), // Content for cell 2
                        ),
                      ],
                    ),

                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            height: 50.h,
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'After 10th Nov 07:30 PM & Before 10th Nov 11:30 PM'),
                            )),
                          ), // Content for cell 1
                        ),
                        TableCell(
                          child: Container(
                            height: 50.h,
                            child: Center(child: Text('₹1940 / 2050 (100%)')),
                          ), // Content for cell 2
                        ),
                      ],
                    ),
                    // Add more TableRow widgets for additional rows
                  ],
                ),
                ksizedbox20,
                Text(
                  'basis. Above cancellation fare is calculated based on seat fare of 1940  * Cancellation charges are calculated based on service start date + time at :10-11-2023 23:30',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 12.sp,
                        color: kblack,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                ksizedbox20,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
