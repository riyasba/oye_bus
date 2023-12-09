import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/bus_filter/views/bus_filter_view.dart';
import 'package:oye_bus/app/modules/screens/bus_list/widgets/seperator_widgets.dart';
import 'package:oye_bus/app/modules/screens/passenger_info/views/passenger_info_view.dart';
import 'package:oye_bus/app/routes/app_pages.dart';

import '../../../bus_filter/views/bus_filter_view.dart';
import '../controllers/bus_list_controller.dart';

class BusListView extends GetView<BusListController> {
  const BusListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: Column(
          children: [
            AppBar(
              elevation: 0,
              title:  Text('Chennai → Bengaluru',style: smalbalckfont.copyWith(
                
              ),),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(Routes.BUSFILTER);
                    },
                    child: Container(
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                        color: klightGrey,
                        borderRadius: BorderRadius.circular(40)
                      ),
                      child: Center(
                        child: Image.asset('assets/offers_icon/filtericon.png'),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kYellow
                      ),
                      
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                              ClipRRect(
                              borderRadius: BorderRadius.circular(35),
                              child: Image.asset("assets/home_page/calendar_gif.gif",height: 40,)),
                           const   SizedBox(
                                width: 5,
                              ),
                               Text("Friday, 10 Nov 2023",style: primaryFont.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900
                                  ),)
                                  
                          ],
                        ),
                      ),
                    ),
                  ),
                
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kred
                        ),
                        child:  Center(
                          child: Text("5 Buses Availble",style: primaryFont.copyWith(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900
                                      ),),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.fromLTRB(15,5,15,5),
            child: InkWell(
              onTap: (){
                Get.to(PassengerInfoView());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: klightGrey
                    )
                  ],
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/home_page/oye_small_icon.png",height: 40,),
                             const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("KMPL Kalaimakal Travels",style: smalbalckfont.copyWith(
                                    fontSize: 14
                                  ),),
                                  Text("Volvo Multi Axle Semi Sleeper (2+2)",style: primaryFont.copyWith(
                                    fontSize: 11
                                  ),)
                                ],
                              )
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color.fromARGB(255, 148, 238, 151).withOpacity(0.5)
                            ),
                            padding: EdgeInsets.all(5),
                            child: Center(
                              child: Text("CHEAPEST",style: smalbalckfont.copyWith(
                                color: const Color.fromARGB(255, 45, 172, 53),
                                fontSize: 12
                              ),),
                            ),
                          )
                        ],
                      ),
                     const SizedBox(
                        height: 20,
                      ),
                      //time row
            
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("06:50AM",style: smalbalckfont.copyWith(
                                fontSize: 14,
                              ),),
                               Text("Chennai CMBT",style: primaryFont.copyWith(
                                fontSize: 11,
                                color: Colors.black45
                              ),)
                            ],
                          ),
                         
                          Column(
                            children: [
                              Text("04:05hrs",style: primaryFont.copyWith(
                                fontSize: 10,
                                color: Colors.black54
                              ),),
                              Row(
                                children: [
                                  Container(
                                    height: 4,
                                    width: 4,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(115, 66, 66, 66),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                       color: Color.fromARGB(115, 141, 139, 139),
                                    
                                    ),
                                    
                                  ),
                                 const  Icon(Icons.directions_bus_rounded,size: 13,color: Colors.black54,),
                                  Container(
                                    height: 1,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(115, 141, 139, 139),
                                    ),
                                  ),
                                   Container(
                                    height: 4,
                                    width: 4,
                                    decoration: BoxDecoration(
                                       color: const Color.fromARGB(115, 66, 66, 66),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("06:50AM",style: smalbalckfont.copyWith(
                                fontSize: 14,
                              ),),
                               Text("Chennai CMBT",style: primaryFont.copyWith(
                                fontSize: 11,
                                color: Colors.black45
                              ),)
                            ],
                          ),
                        ],
                      ),
                    const  SizedBox(
                        height: 20,
                      ),
                      //Amount row
                      const MySeparator(
                        color: Colors.grey,
                      ),
                     const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                             const Icon(Icons.star,color: Colors.yellow,),
                              Text("4.4",style: primaryFont.copyWith(
                                fontSize: 11
                              ),)
                            ],
                          ),
                           Row(
                            children: [
                             const Icon(Icons.person_outlined,size: 17,),
                              Text("32",style: primaryFont.copyWith(
                                fontSize: 11
                              ),)
                            ],
                          ),
                          Text("₹3454",style: smalbalckfont.copyWith(
                            fontSize: 15,
            
                          ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );

      })
    );
  }
}
