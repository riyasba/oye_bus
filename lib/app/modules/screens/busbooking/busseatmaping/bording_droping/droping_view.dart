import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/home/controllers/home_controller.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/controllers/busseatmaping_controller.dart';

class DroppingListView extends StatefulWidget {
  @override
  _DroppingListViewState createState() => _DroppingListViewState();
}

class _DroppingListViewState extends State<DroppingListView> {
  @override
  void initState() {
    super.initState();
  }

  bool isvalue = false;
  int val = -1;
  final boadingdroppingController = Get.find<BusseatmapingController>();
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kwhite,
            boxShadow: <BoxShadow>[
              BoxShadow(offset: const Offset(0.0, 0.75), blurRadius: 1, color: kgrey)
            ]),
        child: GetBuilder<BusseatmapingController>(builder: (_) {
          return boadingdroppingController.droppointdata.isEmpty
              ? const Center(
                  child: Text("No Data Found"),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: boadingdroppingController.droppointdata.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 10, right: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    boadingdroppingController
                                        .droppointdata[index].time,
                                    style: TextStyle(
                                        fontSize: 16.5,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    formatDate(
                                      DateTime.parse(homeController
                                          .selectedBookingDate.value),
                                      [d, " ", M],
                                    ),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 14.8,
                                        color: Colors.grey.shade600),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 11),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 180,
                                      child: Text(
                                        boadingdroppingController
                                            .droppointdata[index].location,
                                        style: TextStyle(
                                            fontSize: 16.5,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Proxima Nova'),
                                      ),
                                    ),
                                    Text(''),
                                  ],
                                ),
                              ),
                              Radio(
                                value: boadingdroppingController
                                    .droppointdata[index].id,
                                groupValue: val,
                                onChanged: (value) {
                                  setState(() {
                                    val = value!;
                                    boadingdroppingController
                                        .destinationlocationvalue
                                        .value = value.toString();
                                  });
                                },
                                activeColor: kred,
                              ),
                            ],
                          ),
                          Divider(),
                        ],
                      ),
                    );
                  },
                );
        }),
      ),
    );
  }
}
