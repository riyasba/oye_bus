import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/modules/screens/busseatmaping/views/busseatmaping_view.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/bus_list/views/bus_list_view.dart';
import 'package:oye_bus/app/modules/screens/home/widgets/home_app_bar_widget.dart';
import 'package:oye_bus/app/modules/screens/search/views/search_destiny_view.dart';
import 'package:oye_bus/app/modules/screens/search/views/search_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
     Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize:  Size.fromHeight(55),
        child: HomeAppBarWidget(),
      ),
      body: ListView(
        children: [
        const  SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Where to go?",style: smalbalckfont.copyWith(
                      fontSize: 19,
                    ),),
                     Text("Search for Bus Tickets",style: primaryFont.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.w400
                    ),),
                  ],
                ),
                Image.asset("assets/home_page/bus_loading_gif.gif",height: 70,),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                color:const Color(0xffEEEEEF),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)
                              ),
                              ),
                       
                            ],
                          ),
                        ),
                        
                   const SizedBox(
                      height: 2,
                    ),
                         SvgPicture.asset(
                                  "assets/home_page/dotted_line_svg.svg",
                                  height: 45,
                        ),
                         const SizedBox(
                      height: 2,
                    ),
                          SvgPicture.asset(
                                  "assets/home_page/location_red_large_icon.svg"
                        ),
                        
                    
                      ],
                    ),
                  const  SizedBox(
                      width: 10,
                    ),
                    GetBuilder<HomeController>(
                      builder: (_) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("From",style: primaryFont.copyWith(
                              fontSize: 11,
                            ),),
                            Container(
                              height: 35,
                              width: size.width * 0.6,
                              child:  TextField(
                                controller: controller.fromPlaceTxtController,
                                readOnly: true,
                                onTap: ()=> Get.to(()=> SearchView()),
                                  style: smalbalckfont.copyWith(
                                  fontSize: 15
                                 ),
                                decoration: const InputDecoration.collapsed(hintText: "Enter from place"),
                              ),
                            ),
                              Container(
                              height: 1,
                              width: size.width * 0.6.w,
                              color: const Color.fromRGBO(158, 158, 158, 1),
                              ),
                            const  SizedBox(
                                height: 5,
                              ),
                               Text("To",style: primaryFont.copyWith(
                              fontSize: 11,
                            ),),
                            Container(
                              height: 35,
                              width: size.width * 0.6,
                              child:  TextField(
                                 controller: controller.toPlaceTxtController,
                                  readOnly: true,
                                onTap: ()=> Get.to(()=> SearchDestinyView()),
                                 style: smalbalckfont.copyWith(
                                  fontSize: 15
                                 ),
                                decoration: const InputDecoration.collapsed(hintText: "Enter to place"),
                              ),
                            ),
                          ],
                        );
                      }
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: (){
                        controller.ulta();
                      },
                      child: Container(
                        height: 45,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/home_page/arrow.svg",
                                        height: 25,
                              ),
                          ],
                        ),
                      ),
                    )
              
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffEEEEEF)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Row(
                      children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Image.asset("assets/home_page/calendar_gif.gif",height: 40,)),
                     Padding(
                       padding: const EdgeInsets.only(top: 8),
                       child: Column(
                          children: [
                            Text("Departure date",style: primaryFont.copyWith(
                            fontSize: 10
                            ),),
                          const  SizedBox(
                              height: 7,
                            ),
                             Text("06-11-2023",style: primaryFont.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w900
                            ),)
                          ],
                        ),
                     )
                    ]),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),

                Container(
                   height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffEEEEEF)
                  ),
                  child:   Padding(
                       padding: const EdgeInsets.only(top: 7,left: 7,right: 7),
                       child: Column(
                          children: [
                            Text("Traveller",style: primaryFont.copyWith(
                            fontSize: 10
                            ),),
                          const  SizedBox(
                              height: 7,
                            ),
                             Text("01",style: primaryFont.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w900
                            ),)
                          ],
                        ),
                     )
                ),
                  const SizedBox(
                  width: 10,
                ),

                Container(
                   height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffEEEEEF)
                  ),
                  child:   Padding(
                       padding: const EdgeInsets.only(top: 7,left: 7,right: 7),
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Seat Type (optional)",style: primaryFont.copyWith(
                            fontSize: 10
                            ),),
                          const  SizedBox(
                              height: 10,
                            ),
                           Row(
                            children: [
                              Container(
                                height: 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xffD9D9D9)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Center(
                                    child: Text("Seater",style: primaryFont.copyWith(
                                      fontSize: 7
                                    ),),
                                  ),
                                ),
                              ),
                             const SizedBox(
                                width: 5,
                              ),
                               Container(
                                height: 15,
                                decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xffD9D9D9)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Center(
                                    child: Text("Sleeper",style: primaryFont.copyWith(
                                      fontSize: 7
                                    ),),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Container(
                                height: 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xffD9D9D9)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Center(
                                    child: Text("Semi-Sleeper",style: primaryFont.copyWith(
                                      fontSize: 7
                                    ),),
                                  ),
                                ),
                              ),
                            ],
                           ),
                          
                           
                          ],
                        ),
                     )
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Obx(() =>  Checkbox(
                          //  tristate: true,
                          activeColor: Colors.green,
                           value: controller.isAcBusOnly.value,
                           onChanged: (bool? value) {
                            
                            controller.isAcBusOnly(value);
                           
                           },
                         ),

                 ),
                 Text("Show AC Buses only",style: primaryFont.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w400
                 ),)
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: (){
                Get.to(()=> BusListView());
                
              },
              child: Container(
                height: 55,
                width: size.width,
                decoration:  BoxDecoration(
                  color: const Color(0xffFF0000),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text("Search Buses".toUpperCase()
                  ,style: smalbalckfont.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                  ),),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Checkout some offers",style: smalbalckfont,),
                Text("View All",style: primaryFont.copyWith(
                  color: Colors.red,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.w500
                ),
              
                ),
              ],
            ),
          ),
            const SizedBox(
            height: 7,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
               height: 180,
              child: ListView.builder(
                itemCount: controller.offersList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kwhite,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    offset: const Offset(0.0, 0.75),
                                    color: kgrey,
                                    blurRadius: 5
                                  )
                                ]
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(controller.offersList[index].image,
                                    height: 80,
                                    fit: BoxFit.fitHeight,),
                                  ),
                               const   SizedBox(
                                    height: 5,
                                  ),
                                    Container(
                                          width: 150,
                                          child: Text(controller.offersList[index].title,
                                          style: const TextStyle(
                                             fontFamily: 'Proxima',
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600
                                          ),),
                                        ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Valid till: ${controller.offersList[index].validity}',
                                      style: const TextStyle(
                                  fontFamily: 'Proxima',
                                        fontSize: 10
                                      ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Container(
                                        height: 18,
                                        width: 60,
                                        decoration: BoxDecoration(
                                   color: Color(0xff263238),
                                   borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Center(
                                   child: Text(controller.offersList[index].buttonName,
                                   style: TextStyle(
                                     fontFamily: 'Proxima',
                                     fontSize: 10,
                                     color: kwhite
                                   ),),
                                        ),
                                      )
                                    ],
                                  ),
                               
                                ],
                              ),
                            ),
                );
              }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Text("Check PNR Status",style: smalbalckfont,),
           ),
           const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 60,
              child: TextField(
                   style: smalbalckfont.copyWith(
                                  fontSize: 17
                                 ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.5)
                    )
                  ),
                  hintText: "PNR Number",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color:const Color(0xffFFD400),
                      ),
                      child: Center(
                        child: Text("Check".toUpperCase(),style: smalbalckfont.copyWith(
                          fontSize: 14
                        ),),
                      ),
                    ),
                  )
                ),
              
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
             Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Previously Viewed",style: smalbalckfont,),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 65,
              width: size.width,
              decoration:  BoxDecoration(
                color:  Colors.yellow.withOpacity(0.55),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Image.asset("assets/home_page/oye_small_icon.png",height: 50,),
                  const  SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Chennai",style: smalbalckfont.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                            ),),
                           const Icon(Icons.arrow_right_alt_outlined),
                            Text("Salem",style: smalbalckfont.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                            ),),
                          ],
                        ),
                         Text("Mon, 06 Nov 2023",style: primaryFont.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                            ),),
              
              
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
         
       
          const SizedBox(
            height: 50,
          )
        ],
      )
    );
  }
}
