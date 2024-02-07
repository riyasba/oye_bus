import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/controllers/busseatmaping_controller.dart';


class BoardingListView extends StatefulWidget {
  @override
  _BoardingListViewState createState() => _BoardingListViewState();
}

class _BoardingListViewState extends State<BoardingListView> {
  
  bool isselected = false;
  @override
  void initState() {
    super.initState();
   
  }
  bool isSelected = false;
  final boadingdroppingController = Get.find<BusseatmapingController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemCount: boadingdroppingController.boardingpointdata.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
            child: Container(
               height: 90,
               width: 350,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kwhite,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(0.0, 0.75),
                    blurRadius: 5,
                    color: kgrey
                  )
                ]
               ),
               child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Row(
                     children: [
                       Checkbox(
                         shape: CircleBorder(),
                         value: boadingdroppingController.boardingpointdata[index].isSelected, 
                       onChanged: (value){
                       setState(() {
                         boadingdroppingController.boardingpointdata[index].isSelected=value!;
                       });
                       }),
                       Container(
                        width: 180,
                         child: Text(boadingdroppingController.boardingpointdata[index].location,
                         style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                           fontFamily: 'Proxima Nova'
                         ),),
                       ),
                     ],
                   ),
                   
                   Padding(
                     padding: const EdgeInsets.only(right: 15),
                     child: Text(boadingdroppingController.boardingpointdata[index].time,
                     textAlign: TextAlign.end,),
                   )
                 ],
               ),
            ),
          );
        },
      ),
    );
  }
}
