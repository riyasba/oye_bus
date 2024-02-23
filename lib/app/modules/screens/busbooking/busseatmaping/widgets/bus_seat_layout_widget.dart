import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/bus_seat_components.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/models/bus_seat_model.dart';
import 'package:oye_bus/app/data/api_service/models/get_bus_seat_layout_model.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/controllers/busseatmaping_controller.dart';

class BusSeatLayoutWidget extends StatefulWidget {
  List<List<Seat>> nonAcLowerSeats;
  List<List<Seat>> nonAcUpperSeats;
  BusSeatLayoutWidget(
      {super.key,
      required this.nonAcLowerSeats,
      required this.nonAcUpperSeats});

  @override
  State<BusSeatLayoutWidget> createState() => _BenzeMultiAxleState();
}

class _BenzeMultiAxleState extends State<BusSeatLayoutWidget> {
  var seatvalue = '';
  final busDetailsController = Get.find<BusseatmapingController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusseatmapingController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Lower",
                      style: primaryFont.copyWith(color: Colors.black54),
                    ),
                    ksizedbox10,
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black45),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              for (int i = 0;
                                  i < widget.nonAcLowerSeats.length;
                                  i++)
                                Row(
                                  children: [
                                    for (int j = 0;
                                        j < widget.nonAcLowerSeats[i].length;
                                        j++)
                                      widget.nonAcLowerSeats[i][j].position ==
                                              "Empty"
                                          ? empty
                                          : widget.nonAcLowerSeats[i][j].position ==
                                                  "Driver"
                                              ? driver
                                              : widget.nonAcLowerSeats[i][j].length == "1" &&
                                                      widget.nonAcLowerSeats[i][j].width ==
                                                          "1" &&
                                                      widget.nonAcLowerSeats[i][j].layout ==
                                                          "11"
                                                  ? Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 30,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              widget
                                                                      .nonAcLowerSeats[
                                                                          i][j]
                                                                      .isSelected =
                                                                  !widget
                                                                      .nonAcLowerSeats[
                                                                          i][j]
                                                                      .isSelected;
                                                            });
                                                            busDetailsController
                                                                .update();
                                                          },
                                                          child:
                                                              SvgPicture.asset(
                                                            "assets/icons/seater.svg",
                                                            height: 22,
                                                            color: widget.nonAcLowerSeats[i][j].isSelected ==
                                                                        false &&
                                                                    widget
                                                                            .nonAcLowerSeats[i][
                                                                                j]
                                                                            .isBookable ==
                                                                        "0"
                                                                ? const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    230,
                                                                    87,
                                                                    36)
                                                                : widget
                                                                        .nonAcLowerSeats[
                                                                            i]
                                                                            [j]
                                                                        .isSelected
                                                                    ? Colors
                                                                        .green
                                                                    : Colors.grey[
                                                                        400],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : widget.nonAcLowerSeats[i][j]
                                                                  .length ==
                                                              "1" &&
                                                          widget.nonAcLowerSeats[i][j].width ==
                                                              "1" &&
                                                          widget
                                                                  .nonAcLowerSeats[i]
                                                                      [j]
                                                                  .layout ==
                                                              "01"
                                                      ? Container(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        2),
                                                            child: Column(
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      widget.nonAcLowerSeats[i][j].isSelected = !widget
                                                                          .nonAcLowerSeats[
                                                                              i]
                                                                              [
                                                                              j]
                                                                          .isSelected;
                                                                    });
                                                                    busDetailsController
                                                                        .update();
                                                                  },
                                                                  child: Stack(
                                                                    children: [
                                                                      SvgPicture
                                                                          .asset(
                                                                        "assets/icons/seater.svg",
                                                                        height:
                                                                            22,
                                                                        color: widget.nonAcLowerSeats[i][j].isSelected == false &&
                                                                                widget.nonAcLowerSeats[i][j].isBookable == "0"
                                                                            ? const Color.fromARGB(255, 230, 87, 36)
                                                                            : widget.nonAcLowerSeats[i][j].isSelected
                                                                                ? Colors.green
                                                                                : Colors.grey[400],
                                                                      ),
                                                                      // if (widget
                                                                      //         .nonAcLowerSeats[i][
                                                                      //             j]
                                                                      //         .amount !=
                                                                      //     "")
                                                                      //   const Positioned(
                                                                      //       left:
                                                                      //           0,
                                                                      //       right:
                                                                      //           0,
                                                                      //       top:
                                                                      //           0,
                                                                      //       bottom:
                                                                      //           0,
                                                                      //       child: Icon(Icons.check,
                                                                      //           size: 20,
                                                                      //           color: Colors.red))
                                                                    ],
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 6,
                                                                ),
                                                                InkWell(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        widget.nonAcLowerSeats[i][j + 1].isSelected = !widget
                                                                            .nonAcLowerSeats[i][j +
                                                                                1]
                                                                            .isSelected;
                                                                      });
                                                                      busDetailsController
                                                                          .update();
                                                                    },
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      "assets/icons/seater.svg",
                                                                      height:
                                                                          22,
                                                                      color: widget
                                                                              .nonAcLowerSeats[i][j +
                                                                                  1]
                                                                              .isSelected
                                                                          ? Colors
                                                                              .green
                                                                          : Colors
                                                                              .grey[400],
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      : widget.nonAcLowerSeats[i][j].length == "1" &&
                                                              widget.nonAcLowerSeats[i][j].width ==
                                                                  "1" &&
                                                              widget.nonAcLowerSeats[i][j]
                                                                      .layout ==
                                                                  "1" &&
                                                              widget.nonAcLowerSeats[i][j].columnNo == "5"
                                                          ? Container(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                        vertical:
                                                                            2),
                                                                child: Column(
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          widget
                                                                              .nonAcLowerSeats[i][j]
                                                                              .isSelected = !widget.nonAcLowerSeats[i][j].isSelected;
                                                                        });
                                                                        busDetailsController
                                                                            .update();
                                                                      },
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          SvgPicture
                                                                              .asset(
                                                                            "assets/icons/seater.svg",
                                                                            height:
                                                                                22,
                                                                            color: widget.nonAcLowerSeats[i][j].isSelected == false && widget.nonAcLowerSeats[i][j].isBookable == "0"
                                                                                ? const Color.fromARGB(255, 230, 87, 36)
                                                                                : widget.nonAcLowerSeats[i][j].isSelected
                                                                                    ? Colors.green
                                                                                    : Colors.grey[400],
                                                                          ),
                                                                          // if (widget.nonAcLowerSeats[i][j].amount !=
                                                                          //     "")
                                                                          //   const Positioned(
                                                                          //       left: 0,
                                                                          //       right: 0,
                                                                          //       top: 0,
                                                                          //       bottom: 0,
                                                                          //       child: Icon(Icons.check, size: 20, color: Colors.red))
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 6,
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          widget
                                                                              .nonAcLowerSeats[i][j + 1]
                                                                              .isSelected = !widget.nonAcLowerSeats[i][j + 1].isSelected;
                                                                        });
                                                                        busDetailsController
                                                                            .update();
                                                                      },
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          SvgPicture
                                                                              .asset(
                                                                            "assets/icons/seater.svg",
                                                                            height:
                                                                                22,
                                                                            color: widget.nonAcLowerSeats[i][j + 1].isSelected == false && widget.nonAcLowerSeats[i][j + 1].isBookable == "0"
                                                                                ? const Color.fromARGB(255, 230, 87, 36)
                                                                                : widget.nonAcLowerSeats[i][j + 1].isSelected
                                                                                    ? Colors.green
                                                                                    : Colors.grey[400],
                                                                          ),
                                                                          // if (widget.nonAcLowerSeats[i][j + 1].amount !=
                                                                          //     "")
                                                                          //   const Positioned(
                                                                          //       left: 0,
                                                                          //       right: 0,
                                                                          //       top: 0,
                                                                          //       bottom: 0,
                                                                          //       child: Icon(Icons.check, size: 20, color: Colors.red))
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          : widget.nonAcLowerSeats[i][j].length == "2" && widget.nonAcLowerSeats[i][j].width == "1"
                                                              ? Container(
                                                                  child: InkWell(
                                                                      onTap: () {
                                                                        setState(
                                                                            () {
                                                                          widget
                                                                              .nonAcLowerSeats[i][j]
                                                                              .isSelected = !widget.nonAcLowerSeats[i][j].isSelected;
                                                                        });
                                                                        busDetailsController
                                                                            .update();
                                                                      },
                                                                      child: Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                3,
                                                                            vertical:
                                                                                5),
                                                                        child: widget.nonAcLowerSeats[i][j].isSelected ==
                                                                                false
                                                                            ? SvgPicture.asset(
                                                                                "assets/icons/sleeper.svg",
                                                                                height: 45,
                                                                              )
                                                                            : SvgPicture.asset(
                                                                                'assets/icons/busseatgreen.svg',
                                                                                height: 45,
                                                                              ),
                                                                      )),
                                                                )
                                                              : widget.nonAcLowerSeats[i][j].width == "2"
                                                                  ? InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          widget
                                                                              .nonAcLowerSeats[i][j]
                                                                              .isSelected = !widget.nonAcLowerSeats[i][j].isSelected;
                                                                        });
                                                                        busDetailsController
                                                                            .update();
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsets
                                                                              .symmetric(
                                                                              horizontal: 3,
                                                                              vertical: 5),
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              SvgPicture.asset(
                                                                                "assets/icons/w2SleeperSeats.svg",
                                                                                height: 25,
                                                                                color: widget.nonAcLowerSeats[i][j].isSelected == false && widget.nonAcLowerSeats[i][j].isBookable == "0"
                                                                                    ? const Color.fromARGB(255, 230, 87, 36)
                                                                                    : widget.nonAcLowerSeats[i][j].isSelected
                                                                                        ? Colors.green
                                                                                        : Colors.grey[300],
                                                                              ),
                                                                              // if (widget.nonAcLowerSeats[i][j].amount != "")
                                                                              //   const Positioned(left: 0, right: 0, top: 0, bottom: 0, child: Icon(Icons.check, size: 20, color: Colors.white))
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : Container()
                                  ],
                                )
                            ],
                          ),
                        )),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Upper",
                      style: primaryFont.copyWith(color: Colors.black54),
                    ),
                    ksizedbox10,
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black45),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              for (int i = 0;
                                  i < widget.nonAcUpperSeats.length;
                                  i++)
                                Row(
                                  children: [
                                    for (int j = 0;
                                        j < widget.nonAcUpperSeats[i].length;
                                        j++)
                                      widget.nonAcUpperSeats[i][j].position ==
                                              "Empty"
                                          ? empty
                                          : widget.nonAcUpperSeats[i][j].length == 1 &&
                                                  widget.nonAcUpperSeats[i][j]
                                                          .width ==
                                                      "1" &&
                                                  widget.nonAcUpperSeats[i][j]
                                                          .layout ==
                                                      "11"
                                              ? singleSeater
                                              : widget.nonAcUpperSeats[i][j].length ==
                                                          "1" &&
                                                      widget
                                                              .nonAcUpperSeats[i]
                                                                  [j]
                                                              .width ==
                                                          "1"
                                                  ? Container(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 2),
                                                        child: Column(
                                                          children: [
                                                            SvgPicture.asset(
                                                              "assets/icons/seater.svg",
                                                              height: 22,
                                                            ),
                                                            const SizedBox(
                                                              height: 6,
                                                            ),
                                                            SvgPicture.asset(
                                                              "assets/icons/seater.svg",
                                                              height: 22,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  : widget.nonAcUpperSeats[i][j]
                                                                  .length ==
                                                              "2" &&
                                                          widget
                                                                  .nonAcUpperSeats[i]
                                                                      [j]
                                                                  .width ==
                                                              "1"
                                                      ? Container(
                                                          child: InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  widget
                                                                          .nonAcUpperSeats[i]
                                                                              [j]
                                                                          .isSelected =
                                                                      !widget
                                                                          .nonAcUpperSeats[
                                                                              i]
                                                                              [
                                                                              j]
                                                                          .isSelected;
                                                                });
                                                                busDetailsController
                                                                    .update();
                                                              },
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        3,
                                                                    vertical:
                                                                        5),
                                                                child: widget
                                                                            .nonAcUpperSeats[i][
                                                                                j]
                                                                            .isSelected ==
                                                                        false
                                                                    ? SvgPicture
                                                                        .asset(
                                                                        "assets/icons/sleeper.svg",
                                                                        height:
                                                                            45,
                                                                      )
                                                                    : SvgPicture
                                                                        .asset(
                                                                        'assets/icons/busseatgreen.svg',
                                                                        height:
                                                                            45,
                                                                      ),
                                                              )),
                                                        )
                                                      : widget.nonAcUpperSeats[i][j].width == "2"
                                                          ? Container(
                                                              child: w2sleeper,
                                                            )
                                                          : Container()
                                  ],
                                )
                            ],
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
