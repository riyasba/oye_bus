import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oye_bus/app/components/const.dart';

import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/controllers/busseatmaping_controller.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DropingbordingView extends GetView<BusseatmapingController> {
   DropingbordingView({Key? key}) : super(key: key);
  final boadingdroppingController = Get.find<BusseatmapingController>();
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<BusseatmapingController>(
      () => BusseatmapingController(),
    );
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Boarding / Dropping Points',
            style: bussmidfont,
          ),
          ksizedbox20,
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    controller.dropingIndex(1);
                  },
                  child: Text(
                    'Boarding Point',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 14.sp,
                          color: controller.currentbording.value == 1
                              ? kred
                              : kblack,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: controller.currentbording.value == 1
                              ? kred
                              : kwhite,
                        ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.dropingIndex(2);
                  },
                  child: Text(
                    'Dropping Point',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 14.sp,
                          color: controller.currentbording.value == 2
                              ? kred
                              : kblack,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: controller.currentbording.value == 2
                              ? kred
                              : kwhite,
                        ),
                  ),
                )
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: boadingdroppingController.boadroppointdata.length,
            itemBuilder: (BuildContext context, int index) {
              final example = 9;

              return TimelineTile(
                alignment: TimelineAlign.center,
                lineXY: 0.4,
                isFirst: index == 0,
                isLast: index == 8 - 1,
                indicatorStyle: IndicatorStyle(
                  width: 10,
                  height: 10,
                  indicator: _IndicatorExample(number: '${index + 1}'),
                  drawGap: true,
                ),
                beforeLineStyle: LineStyle(
                  color: Color.fromARGB(255, 22, 3, 3).withOpacity(0.2),
                ),
                endChild: GestureDetector(
                  child: _RowExample(example: 'Location ${boadingdroppingController.boadroppointdata[index].location}'),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute<ShowcaseTimeline>(
                    //     builder: (_) =>
                    //         ShowcaseTimeline(example: example),
                    //   ),
                    // );
                  },
                ),
              );
            },
          ),
        ],
      ),
    ));
  }
}

class _IndicatorExample extends StatelessWidget {
  const _IndicatorExample({Key? key, required this.number}) : super(key: key);

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      decoration: BoxDecoration(
        color: kgrey,
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(
            color: kgrey,
            width: 2,
          ),
        ),
      ),
      // child: Center(
      //   child: Text(
      //     number,
      //     style: const TextStyle(fontSize: 30),
      //   ),
      // ),
    );
  }
}

class _RowExample extends StatelessWidget {
  const _RowExample({Key? key, required this.example}) : super(key: key);

  final String example;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              example,
              style: GoogleFonts.jura(
                color: kblack,
                fontSize: 14,
              ),
            ),
          ),
          // Icon(
          //   Icons.navigate_next,
          //   color: kblue,
          //   size: 26,
          // ),
        ],
      ),
    );
  }
}

class Example {
  const Example({
    required this.name,
    required this.description,
    required this.code,
    required this.childHorizontal,
    required this.childVertical,
  });

  final String name;
  final String description;
  final String code;
  final Widget childVertical;
  final Widget childHorizontal;
}
