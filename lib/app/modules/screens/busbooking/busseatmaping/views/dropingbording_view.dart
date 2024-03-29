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
    return Obx(()=>
      Container(
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
          Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      controller.dropingIndex(0);
                      controller.update();
                    },
                    child: Text(
                      'Boarding Point',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 14.sp,
                            color: controller.dropingIndex.value == 0
                                ? kred
                                : kblack,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationColor: controller.dropingIndex.value == 0
                                ? kred
                                : kwhite,
                          ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.dropingIndex(1);
                      controller.update();
                    },
                    child: Text(
                      'Dropping Point',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 14.sp,
                            color: controller.dropingIndex.value == 1
                                ? kred
                                : kblack,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationColor: controller.dropingIndex.value == 1
                                ? kred
                                : kwhite,
                          ),
                    ),
                  )
                ],
              ),
              if(controller.dropingIndex.value==0)
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                      
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: boadingdroppingController.boardingpointdata.length,
                  itemBuilder: (BuildContext context, int index) {
                    final example = 9;
                
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80,
                          child: TimelineTile(
                            
                            alignment: TimelineAlign.manual,
                            lineXY: 0.4,
                            isFirst: index == 0,
                            isLast: index == 8 - 1,
                            indicatorStyle: IndicatorStyle(
                              color: kred,
                              width: 10,
                              height: 10,
                              indicator: _IndicatorExample(number: '${index + 1}'),
                              drawGap: true,
                            ),
                            startChild: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(  boadingdroppingController.boardingpointdata[index].time,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                   fontSize: 15,
                                  fontFamily: 'Proxima Nova',
                                  fontWeight: FontWeight.w400
                                ),
                              ),),
                            
                            beforeLineStyle: LineStyle(
                              color: Color.fromARGB(255, 22, 3, 3).withOpacity(0.2),
                            ),
                            endChild: Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Text(
                                boadingdroppingController.boardingpointdata[index].location,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Proxima Nova',
                                  fontWeight: FontWeight.w400
                                ),),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              
              ),
            ),
            if(controller.dropingIndex.value==1)
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: boadingdroppingController.droppointdata.length,
                  itemBuilder: (BuildContext context, int index) {
                    final example = 9;
                
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                                          
                          height: 80,
                          child: TimelineTile(
                            alignment: TimelineAlign.manual,
                            lineXY: 0.4,
                            isFirst: index == 0,
                            isLast: index == 8 - 1,
                            indicatorStyle: IndicatorStyle(
                              width: 10,
                              height: 10,
                              indicator: _IndicatorExample(number: '${index + 1}'),
                              drawGap: true,
                            ),
                            startChild: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(boadingdroppingController.droppointdata[index].time,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                   fontSize: 15,
                                  fontFamily: 'Proxima Nova',
                                  fontWeight: FontWeight.w400
                                
                              ),),
                            ),
                            beforeLineStyle: LineStyle(
                              color: Color.fromARGB(255, 22, 3, 3).withOpacity(0.2),
                            ),
                            endChild: Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Text(boadingdroppingController.droppointdata[index].location,
                              style: TextStyle(
                                   fontSize: 15,
                                  fontFamily: 'Proxima Nova',
                                  fontWeight: FontWeight.w400
                                
                              ),),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              
              ),
            )
          ]
        ),
      )
      )
    );
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
