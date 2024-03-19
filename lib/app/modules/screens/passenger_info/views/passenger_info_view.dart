import 'dart:math';

import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/api_provider/booking_api_service/seat_block_api_service.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/add_booking_model.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/booking_history_model.dart';
import 'package:oye_bus/app/data/api_service/models/get_bus_seat_layout_model.dart';
import 'package:oye_bus/app/data/api_service/models/get_bus_seat_layout_model.dart'
    as st;
import 'package:oye_bus/app/data/api_service/models/passengers/add_copassengers_model.dart';
import 'package:oye_bus/app/data/api_service/models/passengers/co_passangers_model.dart';
import 'package:oye_bus/app/modules/home/controllers/home_controller.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/controllers/busseatmaping_controller.dart';
import 'package:oye_bus/app/modules/screens/passenger_info/widgets/dotted_line_small.dart';
import 'package:oye_bus/app/modules/screens/profile/controllers/profile_controller.dart';
import 'package:oye_bus/app/modules/screens/settingsscreens/copassengers/controllers/copassengers_controller.dart';

import '../controllers/passenger_info_controller.dart';

class PassengerInfoView extends GetView<PassengerInfoController> {
  PassengerInfoView({
    Key? key,
  }) : super(key: key);
  final copassangersController = Get.find<CopassengersController>();
  final boadingdroppingController = Get.find<BusseatmapingController>();
  final passengerController = Get.find<PassengerInfoController>();

  final buslistController = Get.find<HomeController>();

  String getActualTime(String time) {
    var temptime = time.split(':');
    String actualTime = "${temptime[0]}:${temptime[1]}";
    return actualTime;
  }

  var nameTextController = TextEditingController();
  var ageTextController = TextEditingController();

  var editnameTextController = TextEditingController();
  var editageTextController = TextEditingController();

  calculateTotalOf(List<st.Seat> selectedSeats) {
    double totalValue = 0;

    selectedSeats.forEach((element) {
      totalValue = totalValue + double.parse(element.seatPrice);
    });
    return totalValue.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PassengerInfoController());
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passenger information'),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(builder: (_) {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 3, color: Colors.grey.withOpacity(0.6))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.directions_bus_rounded,
                            color: kred,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          buslistController.selectedBusData != null
                              ? Container(
                                  child: Text(
                                    buslistController.selectedBusData!.busName
                                        .toString(),
                                    style:
                                        smalbalckfont.copyWith(fontSize: 16.sp),
                                  ),
                                )
                              : Text('')
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0, top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 110.w,
                                      child: Text(
                                        buslistController.boardinglocation
                                            .toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: primaryFont.copyWith(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp),
                                      )),

                                  // Container(
                                  //   width: 110.w,
                                  //     child: Text(buslistController.boardinglocation.toString(),style: primaryFont.copyWith(
                                  //       color: Colors.black45,
                                  //       fontSize: 12.sp
                                  //     ),
                                  //     maxLines: 1,
                                  //     overflow: TextOverflow.ellipsis,
                                  //     )
                                  //   ),
                                  Container(
                                    width: 125.w,
                                    child: RichText(
                                      text: TextSpan(
                                          text: getActualTime(buslistController
                                              .selectedBusData!.arrivalTime
                                              .toString()),
                                          style: primaryFont.copyWith(
                                              color: Colors.black45,
                                              fontSize: 14.sp),
                                          children: [
                                            TextSpan(text: "  "),
                                            TextSpan(
                                              text: formatDate(
                                                  DateTime.parse(
                                                      buslistController
                                                          .selectedBookingDate
                                                          .value),
                                                  [M, "", d, " ", yyyy]),
                                              style: primaryFont.copyWith(
                                                  color: const Color.fromRGBO(
                                                      0, 0, 0, 0.451),
                                                  fontSize: 13.sp),
                                            )
                                          ]),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_right_alt_outlined),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 110.w,
                                      child: Text(
                                        buslistController.destinationlocation
                                            .toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: primaryFont.copyWith(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp),
                                      )),
                                  // Container(
                                  //   width: 110.w,
                                  //     child: Text(buslistController.destinationlocation.toString(),style: primaryFont.copyWith(
                                  //       color: Colors.black45,
                                  //       fontSize: 12.sp
                                  //     ),
                                  //     maxLines: 1,
                                  //     overflow: TextOverflow.ellipsis,
                                  //     ),
                                  //   ),
                                  Container(
                                    width: 125,
                                    child: RichText(
                                      text: TextSpan(
                                          text: getActualTime(buslistController
                                              .selectedBusData!.departureTime
                                              .toString()),
                                          style: primaryFont.copyWith(
                                              color: Colors.black45,
                                              fontSize: 14.sp),
                                          children: [
                                            const TextSpan(text: "  "),
                                            TextSpan(
                                              text: formatDate(
                                                  DateTime.parse(
                                                      buslistController
                                                          .selectedBookingDate
                                                          .value),
                                                  [M, "", d, ' ', yyyy]),
                                              style: primaryFont.copyWith(
                                                  color: Colors.black45,
                                                  fontSize: 13),
                                            )
                                          ]),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //Contact details ui
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 3, color: Colors.grey.withOpacity(0.6))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person_pin_outlined,
                            color: kred,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Contact Details",
                                style: smalbalckfont.copyWith(fontSize: 16),
                              ),
                              Text(
                                "Your ticket and bus details will be sent here",
                                style: primaryFont.copyWith(fontSize: 11),
                              )
                            ],
                          )
                        ],
                      ),
                      //email - phone number field
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: controller.emailController,
                        style: smalbalckfont.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "Enter your email id",
                            labelText: "Email ID",
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: controller.mobileController,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly,
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],
                        style: smalbalckfont.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "Enter your phone",
                            labelText: "Phone",
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Obx(
                            () => Transform.scale(
                              scale: 0.8,
                              child: Switch(
                                // This bool value toggles the switch.
                                value: controller.isWhatsappSend.value,
                                activeColor: Colors.red,
                                onChanged: (bool value) {
                                  // This is called when the user toggles the switch.
                                  controller.isWhatsappSend(value);
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: 250,
                            child: Text(
                              "Send Booking details and Trip updates on Whatsapp",
                              style: primaryFont.copyWith(fontSize: 10),
                              maxLines: 2,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // passener details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 3, color: Colors.grey.withOpacity(0.6))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person_pin_outlined,
                            color: kred,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Add Passengers",
                                style: smalbalckfont.copyWith(fontSize: 16),
                              ),
                              Text(
                                "Your ticket and bus details will be sent here",
                                style: primaryFont.copyWith(fontSize: 11),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //passenger count
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Passenger",
                                  style: smalbalckfont.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "Seat No:${boadingdroppingController.selectedSeats.isEmpty ? '' : boadingdroppingController.selectedSeats.first.seatNo} , ${buslistController.busdata.first.busType}",
                                  style: primaryFont.copyWith(fontSize: 11),
                                )
                              ],
                            ),
                            // Text( boadingdroppingController.selectedSeats.first.ladiesSeat.isNotEmpty?" Reserved for Female":"Reserved for Male",style: primaryFont.copyWith(
                            //   color: kred,
                            //   fontSize: 11
                            // ),)
                          ]),
                      //email - phone number field
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: nameTextController,
                        style: smalbalckfont.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "Enter name",
                            labelText: "Name",
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: ageTextController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(3),
                          FilteringTextInputFormatter.digitsOnly,
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],
                        style: smalbalckfont.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "Enter age",
                            labelText: "Age",
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder<PassengerInfoController>(builder: (_) {
                        return Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: RadioListTile<String>(
                                  title: const Text("Male"),
                                  value: "male",
                                  groupValue: controller.gender.value,
                                  onChanged: (String? value) {
                                    controller.gender(value);
                                    controller.update();
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: RadioListTile<String>(
                                  title: const Text("Female"),
                                  value: "female",
                                  groupValue: controller.gender.value,
                                  onChanged: (String? value) {
                                    controller.gender(value);
                                    controller.update();
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      }),

                      InkWell(
                        onTap: () {
                          AddCoPassangersModel addCoPassangersModel =
                              AddCoPassangersModel(
                                  age: ageTextController.text,
                                  gender: controller.gender.value,
                                  name: nameTextController.text);

                          copassangersController.addCopassangers(
                              addCoPassangersModel: addCoPassangersModel);

                          ageTextController.clear();
                          controller.gender("");
                          nameTextController.clear();
                          controller.update();
                        },
                        child: Container(
                          height: 55,
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.redAccent.withOpacity(0.5)),
                          alignment: Alignment.center,
                          child: Text(
                            "Add Passanger",
                            style: primaryFont.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                      //   TextField(
                      //     controller: controller.genderController,
                      //   style: smalbalckfont.copyWith(
                      //     fontSize: 14,
                      //     fontWeight: FontWeight.w600
                      //   ),
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     hintText:"Enter gender",
                      //     labelText: "Gender",
                      //     contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8)
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 3, color: Colors.grey.withOpacity(0.6))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('Passenger Details',
                            style: smalbalckfont.copyWith(fontSize: 18)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: GetBuilder<CopassengersController>(builder: (_) {
                          return Text(
                              '${copassangersController.passengersdata.where((element) => element.isSelected == true).toList().length}/${boadingdroppingController.selectedSeats.length} selected');
                        }),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 5),
                        child: GetBuilder<CopassengersController>(builder: (_) {
                          return Container(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  copassangersController.passengersdata.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onLongPress: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            backgroundColor: Colors.white,
                                            title: Column(
                                              children: [
                                                Lottie.asset(
                                                  'assets/images/deletepassengergif.json',
                                                  height: 80,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ],
                                            ),
                                            content: Container(
                                              width: 150.w,
                                              child: const Text(
                                                "Are you sure want to your Passenger?",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ),
                                            actions: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      height: 38,
                                                      width: 105,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                          // ignore: unrelated_type_equality_checks
                                                          color: kgrey),
                                                      child: Center(
                                                          child: Text("No",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color:
                                                                      kblack))),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      copassangersController
                                                          .deletepassenger(
                                                              passengerid:
                                                                  copassangersController
                                                                      .passengersdata[
                                                                          index]
                                                                      .id
                                                                      .toString());
                                                      Get.back();
                                                      copassangersController
                                                          .update();
                                                    },
                                                    child: Container(
                                                      height: 38,
                                                      width: 105,
                                                      decoration: BoxDecoration(
                                                          color: kred,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6)),
                                                      child: Center(
                                                        child: Text("yes ",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: kwhite)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              ksizedbox10
                                            ],
                                          );
                                        });
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 23,
                                                backgroundColor:
                                                    Colors.pink.shade100,
                                                child: const Center(
                                                    child: Icon(Icons.person)),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    copassangersController
                                                            .passengersdata
                                                            .isNotEmpty
                                                        ? Text(
                                                            copassangersController
                                                                .passengersdata[
                                                                    index]
                                                                .name,
                                                            style: const TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          )
                                                        : Text(''),
                                                    Row(
                                                      children: [
                                                        copassangersController
                                                                .passengersdata
                                                                .isNotEmpty
                                                            ? Text(copassangersController
                                                                .passengersdata[
                                                                    index]
                                                                .gender)
                                                            : Text(''),
                                                        Text(' ,'),
                                                        Text(
                                                            '${copassangersController.passengersdata[index].age} years')
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {


                                                    controller.editender(copassangersController
                                                                .passengersdata[
                                                                    index]
                                                                .gender);

                                                                editageTextController.text = copassangersController
                                                                .passengersdata[
                                                                    index]
                                                                .age;

                                                              editnameTextController.text = copassangersController
                                                                .passengersdata[
                                                                    index]
                                                                .name;
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            contentPadding: const EdgeInsets.symmetric(horizontal: 7,vertical: 25),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            backgroundColor:
                                                                Colors.white,
                                                            // title: Column(
                                                            //   children: [
                                                            //     Lottie.asset(
                                                            //         'assets/images/deletepassengergif.json',
                                                            //         height: 80,
                                                            //         fit: BoxFit.fitHeight,),

                                                            //   ],
                                                            // ),
                                                            content: Container(
                                                              height: 200,
                                                              child: Column(
                                                                children: [
                                                                  TextField(
                                                                    controller:
                                                                        editnameTextController,
                                                                    style: smalbalckfont.copyWith(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                    decoration: InputDecoration(
                                                                        border: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                        ),
                                                                        hintText: "Enter name",
                                                                        labelText: "Name",
                                                                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8)),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  TextField(
                                                                    controller:
                                                                        editageTextController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    inputFormatters: [
                                                                      LengthLimitingTextInputFormatter(
                                                                          3),
                                                                      FilteringTextInputFormatter
                                                                          .digitsOnly,
                                                                      FilteringTextInputFormatter
                                                                          .deny(
                                                                              RegExp(r'\s')),
                                                                    ],
                                                                    style: smalbalckfont.copyWith(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                    decoration: InputDecoration(
                                                                        border: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                        ),
                                                                        hintText: "Enter age",
                                                                        labelText: "Age",
                                                                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8)),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  GetBuilder<
                                                                          PassengerInfoController>(
                                                                      builder:
                                                                          (_) {
                                                                    return Row(
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                RadioListTile<String>(
                                                                              title: Text("Male", style: primaryFont.copyWith(fontSize: 13)),
                                                                              value: "male",
                                                                              groupValue: controller.editender.value,
                                                                              onChanged: (String? value) {
                                                                                controller.editender(value);
                                                                                controller.update();
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                RadioListTile<String>(
                                                                              title: Text("Female", style: primaryFont.copyWith(fontSize: 12)),
                                                                              value: "female",
                                                                              groupValue: controller.editender.value,
                                                                              onChanged: (String? value) {
                                                                                controller.editender(value);
                                                                                controller.update();
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  }),
                                                                ],
                                                              ),
                                                            ),
                                                            actions: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  InkWell(
                                                                    onTap: () {
                                                                      Get.back();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          38,
                                                                      width:
                                                                          105,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(6),
                                                                          // ignore: unrelated_type_equality_checks
                                                                          color: kgrey),
                                                                      child: Center(
                                                                          child: Text(
                                                                              "Cancel",
                                                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: kblack))),
                                                                    ),
                                                                  ),
                                                                  Obx(()=>copassangersController.isLoading.isTrue ? Container(
                                                                        height:
                                                                            38,
                                                                        width:
                                                                            105,
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                kred,
                                                                            borderRadius:
                                                                                BorderRadius.circular(6)),
                                                                        child: const Center(
                                                                          child: CircularProgressIndicator(
                                                                            color: Colors.white,
                                                                          ),
                                                                        ),
                                                                      ): InkWell(
                                                                      onTap: () {
                                                                        copassangersController.editCoPassengersApi(
                                                                            coPassengerId: copassangersController
                                                                                .passengersdata[index]
                                                                                .id,
                                                                                addCoPassangersModel: AddCoPassangersModel(age: editageTextController.text, gender: controller.editender.value, name: editnameTextController.text));
                                                                      
                                                                        copassangersController
                                                                            .update();
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            38,
                                                                        width:
                                                                            105,
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                kred,
                                                                            borderRadius:
                                                                                BorderRadius.circular(6)),
                                                                        child:
                                                                            Center(
                                                                          child: Text(
                                                                              "Update",
                                                                              style: TextStyle(
                                                                                  fontSize: 15,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  color: kwhite)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              ksizedbox10
                                                            ],
                                                          );
                                                        });
                                                  },
                                                  icon: Icon(Icons
                                                      .edit_note_outlined)),
                                              Checkbox(
                                                  value: copassangersController
                                                      .passengersdata[index]
                                                      .isSelected,
                                                  onChanged: (value) {
                                                    bool isEqualTo = copassangersController
                                                            .passengersdata
                                                            .where((element) =>
                                                                element
                                                                    .isSelected ==
                                                                true)
                                                            .toList()
                                                            .length !=
                                                        boadingdroppingController
                                                            .selectedSeats
                                                            .length;
                                                    if (copassangersController
                                                        .passengersdata[index]
                                                        .isSelected) {
                                                      copassangersController
                                                          .passengersdata[index]
                                                          .isSelected = value!;
                                                      copassangersController
                                                          .update();
                                                    } else {
                                                      if (isEqualTo) {
                                                        copassangersController
                                                                .passengersdata[
                                                                    index]
                                                                .isSelected =
                                                            value!;
                                                        copassangersController
                                                            .update();
                                                      }
                                                    }
                                                  }),
                                            ],
                                          )
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Divider(),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 3, color: Colors.grey.withOpacity(0.6))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/home_page/oye_small_icon.png",
                            height: 40,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "Oye Bus Assurance Program",
                                  style: smalbalckfont.copyWith(fontSize: 16),
                                ),
                              ),
                              Text(
                                "Tearms & Conditions Apply",
                                style: primaryFont.copyWith(
                                    fontSize: 11, color: Colors.blue),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const MySeparatorSmall(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: kred,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 250,
                              child: Text(
                                "Upto Rs.75000 in the event of accidental hospitalisation",
                                style: primaryFont.copyWith(fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: kred,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Upto Rs.5 Lakhs in case of death/PTD/PPD",
                              style: primaryFont.copyWith(fontSize: 10),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 3, color: Colors.grey.withOpacity(0.6))
                    ]),
                child: Obx(
                  () => Column(
                    children: [
                      Row(
                        children: [
                          Obx(
                            () => Transform.scale(
                              scale: 0.8,
                              child: Switch(
                                // This bool value toggles the switch.
                                value: controller.iHaveGstNumber.value,
                                activeColor: Colors.red,
                                onChanged: (bool value) {
                                  // This is called when the user toggles the switch.
                                  controller.iHaveGstNumber(value);
                                },
                              ),
                            ),
                          ),
                          Text(
                            "I have a GST number (optional)",
                            style: smalbalckfont.copyWith(fontSize: 15),
                          )
                        ],
                      ),
                      if (controller.iHaveGstNumber.isTrue)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                style: smalbalckfont.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: "Enter GSTIN",
                                    labelText: "GSTIN",
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8)),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextField(
                                style: smalbalckfont.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: "Enter Business Name",
                                    labelText: "Business Name",
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8)),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextField(
                                style: smalbalckfont.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: "Enter Business Address",
                                    labelText: "Business Address",
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8)),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextField(
                                style: smalbalckfont.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: "Enter Business Address",
                                    labelText: "Business Email",
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8)),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "In case of Invalid/cancelled GSTIN, this booking shall be considered as personal booking",
                          style: primaryFont.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "By clicking proceed with the purchase, i accept the",
                style: primaryFont.copyWith(
                    fontSize: 11, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                    text: TextSpan(
                        text: "Terms & Conditions",
                        style: primaryFont.copyWith(
                            color: kred,
                            fontSize: 12,
                            decoration: TextDecoration.underline),
                        children: [
                      TextSpan(
                        text: " & ",
                        style: primaryFont.copyWith(
                          color: Colors.black87,
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: "Privacy Policy",
                        style: primaryFont.copyWith(
                            color: kred,
                            fontSize: 12,
                            decoration: TextDecoration.underline),
                      )
                    ]))),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 3, color: Colors.grey.withOpacity(0.6))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Amount: ",
                            style: primaryFont.copyWith(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            calculateTotalOf(
                                boadingdroppingController.selectedSeats),
                            style: primaryFont.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: kred),
                          )
                        ],
                      ),
                      Text(
                        "(Exclusive of Taxes)",
                        style: primaryFont.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 50,
            )
          ],
        );
      }),
      bottomNavigationBar: Obx(
        () => passengerController.isLoading.isTrue
            ? Container(
                height: 55,
                decoration: BoxDecoration(color: kred),
                alignment: Alignment.center,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : InkWell(
                onTap: () {
                  List<PassangersData> selectedPassengersdataList =
                      copassangersController.passengersdata
                          .where((element) => element.isSelected == true)
                          .toList();

                  bool isEqualTo = copassangersController.passengersdata
                          .where((element) => element.isSelected == true)
                          .toList()
                          .length !=
                      boadingdroppingController.selectedSeats.length;

                  if (isEqualTo) {
                    Get.rawSnackbar(
                        message: "Select or Add Passangers for the seats",
                        backgroundColor: Colors.red);
                  } else if (controller.emailController.text.isEmpty ||
                      controller.mobileController.text.isEmpty) {
                    Get.rawSnackbar(
                        message: "Please fill the contact details",
                        backgroundColor: Colors.red);
                  } else {
                    print('booking number');
                    print(boadingdroppingController.boardingpointdata);
                    print(boadingdroppingController.droppointdata);
                    print(buslistController.selectedBookingDate);
                    print(controller.nameController);
                    // print(boadingdroppingController.routedata!.price);
                    print(boadingdroppingController.busDetailsdata!.id);
                    //print(boadingdroppingController.tripdata!.routeId);
                    print(boadingdroppingController.selectedSeats);
                    print(boadingdroppingController.selectedSeats.first.id);

                    print(controller.mobileController);
                    AddBookingModel addBookingModel = AddBookingModel(
                        age: controller.ageController.text,
                        boardingPoint: boadingdroppingController
                            .boardinglocationvalue.value,
                        date: buslistController.selectedBookingDate.value,
                        droppingPoint: boadingdroppingController
                            .destinationlocationvalue.value,
                        emailId: controller.emailController.text,
                        gender: controller.gender.value,
                        mobile: controller.mobileController.text,
                        passengerName: controller.nameController.text,
                        perticketPrice: boadingdroppingController.selectedSeats.isEmpty
                            ? ''
                            : boadingdroppingController
                                .selectedSeats.first.seatPrice,
                        primaryCustomerName:
                            Get.find<ProfileController>().profiledata.isEmpty
                                ? "User1"
                                : Get.find<ProfileController>()
                                    .profiledata
                                    .first
                                    .name,
                        busid: boadingdroppingController.busDetailsdata == null
                            ? ""
                            : boadingdroppingController.busDetailsdata!.id
                                .toString(),
                        routeid: boadingdroppingController.routedata == null
                            ? ''
                            : boadingdroppingController.routedata!.id
                                .toString(),
                        seatid: boadingdroppingController.selectedSeats,
                        seatmapid: passengerController.blockedid.toString(),
                        tripid: boadingdroppingController.tripdata == null
                            ? ""
                            : boadingdroppingController.tripdata!.id.toString(),
                        vendorid: boadingdroppingController.busDetailsdata == null
                            ? ""
                            : boadingdroppingController.busDetailsdata!.vendorId,
                        iswomenseat: boadingdroppingController.selectedSeats.isEmpty ? '' : boadingdroppingController.selectedSeats.first.ladiesSeat,
                        selectedSeats: boadingdroppingController.selectedSeats,
                        passengermodel: selectedPassengersdataList,
                        sourcedestination: boadingdroppingController.routedata!.destinationLocation,
                        subtotal: calculateTotalOf(boadingdroppingController.selectedSeats),
                        unitprice: boadingdroppingController.routedata!.price,
                        passengergender: controller.gender.value);
                    passengerController.payAndBook(
                        amount: calculateTotalOf(
                            boadingdroppingController.selectedSeats),
                        email: Get.find<ProfileController>().profiledata.isEmpty
                            ? "test@gmail.com"
                            : Get.find<ProfileController>()
                                .profiledata
                                .first
                                .email,
                        mobilenumber:
                            Get.find<ProfileController>().profiledata.isEmpty
                                ? "9876543210"
                                : Get.find<ProfileController>()
                                    .profiledata
                                    .first
                                    .mobile,
                        name: Get.find<ProfileController>().profiledata.isEmpty
                            ? "User1"
                            : Get.find<ProfileController>()
                                .profiledata
                                .first
                                .name,
                        addBookingModel: addBookingModel);
                  }
                  //Get.to(ReviewbookingdetailsView());
                },
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(color: kred),
                  alignment: Alignment.center,
                  child: Text(
                    "Proceed".toUpperCase(),
                    style: primaryFont.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
      ),
    );
  }
}
