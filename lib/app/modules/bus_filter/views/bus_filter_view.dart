
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/bus_filter/widgets/bus_arrivaltime_destination_widget.dart';
import 'package:oye_bus/app/modules/bus_filter/widgets/bus_boardingpoint_widget.dart';
import 'package:oye_bus/app/modules/bus_filter/widgets/bus_facilites_widget.dart';
import 'package:oye_bus/app/modules/bus_filter/widgets/bus_features_widget.dart';
import 'package:oye_bus/app/modules/bus_filter/widgets/bus_operator_widget.dart';
import 'package:oye_bus/app/modules/bus_filter/widgets/busdropping_widget.dart';

import '../controllers/bus_filter_controller.dart';

class BusFilterView extends GetView<BusFilterController> {
   BusFilterView({Key? key}) : super(key: key);
  var boardingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Filter Buses',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600
                      ),),
                      Image.asset('assets/offers_icon/filtercancelicon.png')
                    ],
                  ),
                 
    ),
      body:ListView(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                children: [
                
                  Obx(()=>
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                             Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    controller.colorindex(0);
                                    controller.update();
                                  },
                                  child: Container(
                                    height: 70,
                                    width: 165,
                                    decoration: BoxDecoration(
                                                         
                                      color:controller.colorindex.value==0? Color(0xffFF0000):
                                      Color(0xffFFEDED)
                                    ),
                                    child: Center(
                                      child: Text('Sort by',
                                      style: TextStyle(
                                        color: controller.colorindex.value==0?kwhite:Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Proxima '
                                      ),),
                                    ),
                                  ),
                                ),
                                  Container(
                                  height: 1,
                                  width: 165,
                                  decoration: BoxDecoration(
                                    color: Colors.black
                                  ),
                                ),
                                 GestureDetector(
                                  onTap: (){
                                    controller.colorindex(1);
                                    controller.update();
                                  },
                                   child: Container(
                                    height: 70,
                                    width: 165,
                                    decoration: BoxDecoration(
                                                          
                                       color:controller.colorindex.value==1? Color(0xffFF0000):
                                        Color(0xffFFEDED)
                                    ),
                                     child: Center(
                                      child: Text('Bus departure time from',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Proxima ',
                                        color: controller.colorindex.value==1?kwhite:Colors.black
                                      ),),
                                    ),
                                   ),
                                 ),
                                  Container(
                                  height: 1,
                                  width: 165,
                                  decoration: BoxDecoration(
                                    color: Colors.black
                                  ),
                                ),
                                 GestureDetector(
                                  onTap: (){
                                    controller.colorindex(2);
                                    controller.update();
                                  },
                                   child: Container(
                                    height: 70,
                                    width: 165,
                                    decoration: BoxDecoration(
                                                          
                                     color:controller.colorindex.value==2? Color(0xffFF0000):
                                        Color(0xffFFEDED)
                                    ),
                                     child: Center(
                                      child: Text('Bus Type',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Proxima ',
                                        color: controller.colorindex.value==2?kwhite:Colors.black
                                      ),),
                                    ),
                                 ),
                                 ),
                                  Container(
                                  height: 1,
                                  width: 165,
                                  decoration: BoxDecoration(
                                    color: Colors.black
                                  ),
                                ),
                                 GestureDetector(
                                  onTap: (){
                                     controller.colorindex(3);
                                     controller.update();
                                  },
                                   child: Container(
                                    height: 70,
                                    width: 165,
                                    decoration: BoxDecoration(
                                    color:controller.colorindex.value==3? Color(0xffFF0000):
                                        Color(0xffFFEDED)
                                    ),
                                     child: Center(
                                      child: Text('Single Window Sleeper/Seater',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Proxima ',
                                        color: controller.colorindex.value==3?kwhite:Colors.black
                                      ),),
                                    ),
                                   ),
                                 ),
                                Container(
                                  height: 1,
                                  width: 165,
                                  decoration: BoxDecoration(
                                    color: Colors.black
                                  ),
                                ),
                                 GestureDetector(
                                  onTap: (){
                                    controller.colorindex(4);
                                    controller.update();
                                  },
                                   child: Container(
                                    height: 70,
                                    width: 165,
                                    decoration: BoxDecoration(
                                      color:controller.colorindex.value==4? Color(0xffFF0000):
                                        Color(0xffFFEDED)
                                    ),
                                            child: Center(
                                      child: Text('Boarding Point',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Proxima ',
                                        color: controller.colorindex.value==4?kwhite:Colors.black
                                      ),),
                                    ),
                                   ),
                                 ),
                                  Container(
                                  height: 1,
                                  width: 165,
                                  decoration: BoxDecoration(
                                    color: Colors.black
                                  ),
                                ),
                                 GestureDetector(
                                  onTap: (){
                                    controller.colorindex(5);
                                    controller.update();
                                  },
                                   child: Container(
                                    height: 70,
                                    width: 165,
                                    decoration: BoxDecoration(
                                      color:controller.colorindex.value==5? Color(0xffFF0000):
                                        Color(0xffFFEDED)
                                    ),
                                       child: Center(
                                      child: Text('Dropping Point',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Proxima ',
                                        color: controller.colorindex.value==5?kwhite:Colors.black
                                      ),),
                                    ),
                                    ),
                                 ),  Container(
                                  height: 1,
                                  width: 165,
                                  decoration: BoxDecoration(
                                    color: Colors.black
                                  ),
                                ),
                                 GestureDetector(
                                  onTap: (){
                                    controller.colorindex(6);
                                    controller.update();
                                  },
                                   child: Container(
                                    height: 70,
                                    width: 165,
                                    decoration: BoxDecoration(
                                         color:controller.colorindex.value==6? Color(0xffFF0000):
                                        Color(0xffFFEDED)
                                    ),
                                     child: Center(
                                      child: Text('Bus Operator',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Proxima ',
                                        color: controller.colorindex.value==6?kwhite:Colors.black
                                      ),),
                                    ),
                                   ),
                                 ),
                                 Container(
                                  height: 1,
                                  width: 165,
                                  decoration: BoxDecoration(
                                    color: Colors.black
                                  ),
                                ),
                                 GestureDetector(
                                  onTap: (){
                                    controller.colorindex(7);
                                    controller.update();
                                  },
                                   child: Container(
                                    height: 70,
                                    width: 165,
                                    decoration: BoxDecoration(
                                         color:controller.colorindex.value==7? Color(0xffFF0000):
                                        Color(0xffFFEDED)
                                    ),
                                    child: Center(
                                      child: Text('Bus Facilities',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Proxima ',
                                        color: controller.colorindex.value==7?kwhite:Colors.black
                                      ),),
                                    ),
                                   ),
                                 ),
                                   Container(
                                  height: 1,
                                  width: 165,
                                  decoration: BoxDecoration(
                                    color: Colors.black
                                  ),
                                ),
                                 GestureDetector(
                                  onTap: (){
                                    controller.colorindex(8);
                                    controller.update();
                                  },
                                   child: Container(
                                    height: 70,
                                    width: 165,
                                    decoration: BoxDecoration(
                                         color:controller.colorindex.value==8? Color(0xffFF0000):
                                        Color(0xffFFEDED)
                                    ),
                                         child: Center(
                                      child: Text('Bus Features',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Proxima ',
                                        color: controller.colorindex.value==8?kwhite:Colors.black
                                      ),),
                                    ),
                                   ),
                                 ),
                                   Container(
                                  height: 1,
                                  width: 165,
                                  decoration: BoxDecoration(
                                    color: Colors.black
                                  ),
                                ),
                                 GestureDetector(
                                  onTap: (){
                                    controller.colorindex(9);
                                    controller.update();
                                  },
                                   child: Container(
                                    height: 70,
                                    width: 165,
                                    decoration: BoxDecoration(
                                         color:controller.colorindex.value==9? Color(0xffFF0000):
                                        Color(0xffFFEDED)
                                    ),
                                       child: Center(
                                      child: Text('Bus arrival time at destination',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Proxima ',
                                        color: controller.colorindex.value==9?kwhite:Colors.black
                                      ),),
                                    ),
                                   ),
                                 )
                              ],
                            ),
                        
                         
                          if(controller.colorindex.value==0)
                          Container(
                            child: Column(
                            
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 120,
                                      child: Text('Relevance')),
                                    Checkbox( 
                                      shape: CircleBorder(),
                                      value: controller.checkbox1.value, 
                                    onChanged:(value){
                                     controller.checkbox1.value=value!;
                                    } )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 120,
                                      child: Text('Price - Low to High')),
                                     Checkbox( 
                                      shape: CircleBorder(),
                                      value: controller.checkbox2.value, 
                                    onChanged:(value){
                                     controller.checkbox2.value=value!;
                                    } )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 120,
                                      child: Text('Best rated first')),
                                     Checkbox( 
                                      shape: CircleBorder(),
                                      value: controller.checkbox3.value, 
                                    onChanged:(value){
                                     controller.checkbox3.value=value!;
                                    } )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 120,
                                      child: Text('Early departure')),
                                     Checkbox( 
                                      shape: CircleBorder(),
                                      value: controller.checkbox4.value, 
                                    onChanged:(value){
                                     controller.checkbox4.value=value!;
                                    } )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 120,
                                      child: Text('Late departure')),
                                     Checkbox( 
                                      shape: CircleBorder(),
                                      value: controller.checkbox5.value, 
                                    onChanged:(value){
                                     controller.checkbox5.value=value!;
                                    } )
                                  ],
                                )
                              ],
                            ),
                          ),
                          if(controller.colorindex.value==1)
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                                         
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 20,
                                      child: Image.asset('assets/offers_icon/depatureicon1.png')),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10,left: 3),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 95,
                                            child: Text('06:00 - 12:00')),
                                          Container(
                                            width:95,
                                            child: Text('Morning ',
                                            style: TextStyle(
                                              fontSize: 11
                                            ),),
                                          )
                                        ],
                                      ),
                                    ),
                                     Checkbox( 
                                      shape: CircleBorder(),
                                      value: controller.depatcheck1.value, 
                                    onChanged:(value){
                                     controller.depatcheck1.value=value!;
                                    } )
                                  ],
                                ),
                                  Row(
                                                         
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 20,
                                      child: Image.asset('assets/offers_icon/depatureicon2.png')),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10,left: 3),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 95,
                                            child: Text('12:00 - 18:00')),
                                          Container(
                                            width: 95,
                                            child: Text('Afternoon',
                                            style: TextStyle(
                                              fontSize: 11
                                            ),),
                                          )
                                        ],
                                      ),
                                    ),
                                     Checkbox( 
                                      shape: CircleBorder(),
                                      value: controller.depatcheck2.value, 
                                    onChanged:(value){
                                     controller.depatcheck2.value=value!;
                                    } )
                                  ],
                                ),
                                Row(
                                                         
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 20,
                                      child: Image.asset('assets/offers_icon/depatureicon3.png',
                                
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10,left: 3),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width:95,
                                            child: Text('18:00 - 24:00')),
                                          Container(
                                            width: 95,
                                            child: Text('Evening',
                                            style: TextStyle(
                                              fontSize: 11
                                            ),),
                                          )
                                        ],
                                      ),
                                    ),
                                     Checkbox( 
                                      shape: CircleBorder(),
                                      value: controller.depatcheck3.value, 
                                    onChanged:(value){
                                     controller.depatcheck3.value=value!;
                                    } )
                                  ],
                                ),
                                  Row(
                                                         
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 20,
                                      child: Image.asset('assets/offers_icon/depatureicon4.png')),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10,left: 3),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width:95,
                                            child: Text('00:00 - 06:00')),
                                          Container(
                                            width: 95,
                                            child: Text('Night',
                                            style: TextStyle(
                                              fontSize: 11
                                            ),),
                                          )
                                        ],
                                      ),
                                    ),
                                     Checkbox( 
                                      shape: CircleBorder(),
                                      value: controller.depatcheck4.value, 
                                    onChanged:(value){
                                     controller.depatcheck4.value=value!;
                                    } )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          if(controller.colorindex.value==2)
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                                         
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 20,
                                      child: Image.asset('assets/offers_icon/bustypeicon1.png')),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0,left: 5),
                                      child: 
                                          Container(
                                            width: 95,
                                            child: Text('Seater')),
                                          
                                        
                                    ),
                                     Checkbox( 
                                      shape: CircleBorder(),
                                      value: controller.bustypecheck1.value, 
                                    onChanged:(value){
                                     controller.bustypecheck1.value=value!;
                                    } )
                                  ],
                                ),
                                  Row(
                                                         
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 20,
                                      child: Image.asset('assets/offers_icon/bustypeicon2.png')),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0,left: 5),
                                      child: 
                                          Container(
                                            width: 95,
                                            child: Text('Sleeper')),
                                         
                                        
                                    ),
                                     Checkbox( 
                                      shape: CircleBorder(),
                                      value: controller.bustypecheck2.value, 
                                    onChanged:(value){
                                     controller.bustypecheck2.value=value!;
                                    } )
                                  ],
                                ),
                                Row(
                                                         
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 20,
                                      child: Image.asset('assets/offers_icon/bustypeicon3.png',
                                
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0,left: 5),
                                      child:
                                          Container(
                                            width:95,
                                            child: Text('AC')),
                                        
                                    ),
                                     Checkbox( 
                                      shape: CircleBorder(),
                                      value: controller.bustypecheck3.value, 
                                    onChanged:(value){
                                     controller.bustypecheck3.value=value!;
                                    } )
                                  ],
                                ),
                                  Row(
                                                         
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 20,
                                      child: Image.asset('assets/offers_icon/bustypeicon4.png')),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0,left: 5),
                                      child: 
                                          Container(
                                            width:95,
                                            child: Text('Non - Ac')),
                                        
                                    ),
                                     Checkbox( 
                                      shape: CircleBorder(),
                                      value: controller.bustypecheck4.value, 
                                    onChanged:(value){
                                     controller.bustypecheck4.value=value!;
                                    } )
                                  ],
                                ),
                              ],
                            ),
                          ),
                             if(controller.colorindex.value==3)
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                                         
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 20,
                                      child: Image.asset('assets/offers_icon/singlewinseaticon.png')),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0,left: 5),
                                      child: 
                                          Container(
                                            width: 95,
                                            child: Text('Single Seats')),
                                          
                                        
                                    ),
                                     Checkbox( 
                                      shape: CircleBorder(),
                                      value: controller.singlewindcheck.value, 
                                    onChanged:(value){
                                     controller.singlewindcheck.value=value!;
                                    } )
                                  ],
                                ),
                              
                              ],
                            ),
                          ),
                          if(controller.colorindex.value==4)
                          BusBoardingwidget(),
                          if(controller.colorindex.value==5)
                          BusDroppingwidget(),
                          if(controller.colorindex.value==6)
                          BusOperatorWidget(),
                          if(controller.colorindex.value==7)
                          BusfacilitiesWidget(),
                          if(controller.colorindex.value==8)
                          BusfeaturesWidget(),
                          if(controller.colorindex.value==9)
                          BusArrivaltimeAndDestinationWidget()
                        ],
                      ),
                    ),
                  ),
                 ksizedbox10,
                ],
              ),
            ),
          ),
             
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 51,
                          width: 155,
                          decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(7),
                            color: Colors.grey.shade300
                          ),
                          child: Center(
                            child: Text('CLEAR',
                            style: TextStyle(
                              fontFamily: 'Proxima ',
                              fontSize: 17,
                              fontWeight: FontWeight.w700
                            ),),
                          ),
                        ),
                        Container(
                        height: 51,
                          width: 155,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color:Color(0xffFF0000)
                          ),
                          child: Center(
                            child: Text('APPLY',
                            style: TextStyle(
                              fontFamily: 'Proxima ',
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: kwhite
                            )),
                          ),
                        )
                      ],
                    ),
      ) ,
    );
  }
}
