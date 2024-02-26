import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/home/controllers/home_controller.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/bording_droping/droping_view.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/controllers/busseatmaping_controller.dart';


class BoardingListView extends StatefulWidget {
  @override
  _BoardingListViewState createState() => _BoardingListViewState();
}

class _BoardingListViewState extends State<BoardingListView> {
  static int  len =10;
 List<bool> isselected = List.generate(len, (index) => false);
 
  @override
  void initState() {
    super.initState();
  }

    bool isvalue = false;
  int val = -1;
  final boadingdroppingController = Get.find<BusseatmapingController>();
   final homeController = Get.find<HomeController>();

   String getActualTime(String time){
    var temptime = time.split(':');
    String actualTime = '${temptime[0]}:${temptime[1]}';

    return actualTime;
   }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
      child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kwhite,
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(0.0, 0.75),
            blurRadius: 1,
            color: kgrey
          )
        ]
      ),
        child: GetBuilder<BusseatmapingController >(
          builder: (_) {
            print('boardingpoint');
            print(boadingdroppingController.boardingpointdata);
          
            return boadingdroppingController.boardingpointdata.isEmpty ? const Center(
              child: Text("No data Found"),
            ) : ListView.builder(
              shrinkWrap: true,
              itemCount: boadingdroppingController.boardingpointdata.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
                  child: Column(
                    children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                           Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(getActualTime(boadingdroppingController.boardingpointdata[index].time),
                               style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                               ),),
                               Text(
                              formatDate(DateTime.parse(homeController.selectedBookingDate.value), [d," ",M],
                            ),textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600
                            ),),
                             ],
                           ),
                             Padding(
                                             padding: const EdgeInsets.only(left: 11),
                                             child: Column(
                                               children: [
                                                 Container(
                                                                                   
                                                                      width: 180,
                                                                       child: Text(boadingdroppingController.boardingpointdata[index].point,
                                                                       style: const TextStyle(
                                                                        fontSize: 15,
                                                                        fontWeight: FontWeight.w600,
                                                                         fontFamily: 'Proxima Nova' 
                                                                       ),),
                                                                     ),
                                                                      Text(''),
                                               ],
                                             ),
                                           ),
                                                              
                             Radio(
                                        value: boadingdroppingController.boardingpointdata[index].id,
                                        groupValue: val,
                                        onChanged: (value) {
                                        //  DefaultTabController.of(context).animateTo(1);
                                          setState(() {
                                          val = value!;
                                          boadingdroppingController.boardinglocationvalue.value=value.toString();
                                                  
                                          });
                                        //  DefaultTabController.of(context).animateTo(1);
                                        },
                                        
                                        activeColor:kred,
                                         
                                      ),
                          
                       ],
                     ),
                     
                        Divider(),
                    
                     
                    ],
                  ),
                );
              },
            );
          }
        ),
      ),
    );
  }
}
