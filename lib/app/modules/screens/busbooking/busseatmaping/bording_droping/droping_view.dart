import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
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

  final boadingdroppingController = Get.find<BusseatmapingController>();
  @override
  Widget build(BuildContext context) {
    return Container(
     
      child: ListView.builder(
        itemCount: boadingdroppingController.droppointdata.length,
        itemBuilder: (context,index) {
          print('boarding data');
          print(boadingdroppingController.droppointdata[4].location);
          print('index value');
          print(index);
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
                         value: boadingdroppingController.droppointdata[index].isSelected, 
                       onChanged: (value){
                       setState(() {
                         boadingdroppingController.droppointdata[index].isSelected=value!;
                       });
                       }),
                       Container(
                        width: 180,
                         child: Text(boadingdroppingController.droppointdata[index].location,
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
                     child: Text(boadingdroppingController.droppointdata[index].time,
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
