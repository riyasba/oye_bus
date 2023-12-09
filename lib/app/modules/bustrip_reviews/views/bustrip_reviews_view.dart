import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';

import '../controllers/bustrip_reviews_controller.dart';

class BustripReviewsView extends GetView<BustripReviewsController> {
  const BustripReviewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar:AppBar(
          centerTitle: true,
          leading:GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back)),
          title: Text('Bus Trip Reviews',
          style: TextStyle(
            fontSize: 20
          ),),
          actions: [
          Image.asset('assets/offers_icon/supporticon.png')
          ],
         ),
         body: Padding(
           padding: const EdgeInsets.only(left: 10,right: 10),
           child: ListView(
             children: [
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Container(
                  height: 131,
                  width: 470,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text('KMPL Kalaimakal Travels',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Proxima',
                          fontWeight: FontWeight.w700
                        ),),
                        Row(
                          children: [
                            Text('06:50AM   →  12:15PM  Fri,10 Nov',
                            style: TextStyle(
                              color: kgrey
                            ),)
                          ],
                        ),
                        Text('Chennai  - Bengaluru',
                        style: TextStyle(
                              color: kgrey
                            ),
                        ),
                        Text('Travel Completed',
                        style:TextStyle(
                          color: Color(0xffFF0000),
                          fontWeight: FontWeight.w600
                        ),)
                    ],
                  ),
                ),
                ksizedbox10,
                Text('Ratings & Reviews',
                style: TextStyle(
                  fontFamily: 'Proxima ',
                  fontSize: 16.5,
                  fontWeight: FontWeight.w600
                ),),
                ksizedbox10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star,
                        color: Color(0xffFFC107),),
                         Icon(Icons.star,
                        color: Color(0xffFFC107),),
                         Icon(Icons.star,
                        color: Color(0xffFFC107),),
                         Icon(Icons.star,
                        color:kgrey,),
                         Icon(Icons.star,
                        color:kgrey,)
                      ],
                    ),
                    Text('3.4 ',
                    style: TextStyle(
                      fontFamily: 'Proxima',
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),)
                  ],
                ),
                       
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Text('What Travellers Liked',
                  style: TextStyle(
                      fontFamily: 'Proxima',
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                  ),
                  ),
                ),
                ksizedbox20,
                Obx(()=>
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          controller.containercolor(0);
                          controller.update();
                        },
                        child: Container(
                          height: 45,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(34),
                            color: controller.containercolor.value==0?
                      Colors.amber[200]:Colors.grey.shade200
                          ),
                          child: Center(
                            child: Text('Punctually ',
                            style: TextStyle(
                              fontFamily: 'Proxima ',
                              
                            ),),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.containercolor(1);
                          controller.update();
                        },
                        child: Container(
                          height: 45,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(34),
                            color: controller.containercolor.value==1?
                             Colors.amber[200]:Colors.grey.shade200
                          ),
                          child: Center(
                            child: Text('Seat Comfort',
                            style: TextStyle(
                              fontFamily: 'Proxima '
                            ),)),
                        ),
                      )
                    ],
                  ),
                ),
                 ksizedbox20,
                Obx(()=>
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          controller.containercolor(2);
                          controller.update();
                        },
                        child: Container(
                          height: 45,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(34),
                            color: controller.containercolor.value==2?
                             Colors.amber[200]:Colors.grey.shade200
                          ),
                          child: Center(
                            child: Text('Cleanlines',
                            style: TextStyle(
                              fontFamily: 'Proxima ',
                              
                            ),),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.containercolor(3);
                          controller.update();
                        },
                        child: Container(
                          height: 45,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(34),
                            color: controller.containercolor.value==3?
                             Colors.amber[200]:Colors.grey.shade200
                          ),
                          child: Center(
                            child: Text('Staff behavior',
                            style: TextStyle(
                              fontFamily: 'Proxima '
                            ),)),
                        ),
                      )
                    ],
                  ),
                ),
                 ksizedbox20,
                Obx(()=>
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          controller.containercolor(4);
                          controller.update();
                        },
                        child: Container(
                          height: 45,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(34),
                            color: controller.containercolor.value==4?
                               Colors.amber[200]:Colors.grey.shade200
                          ),
                          child: Center(
                            child: Text('Driving',
                            style: TextStyle(
                              fontFamily: 'Proxima ',
                              
                            ),),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.containercolor(5);
                          controller.update();
                        },
                        child: Container(
                          height: 45,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(34),
                            color: controller.containercolor.value==5?
                             Colors.amber[200]:Colors.grey.shade200
                          ),
                          child: Center(
                            child: Text('Ac',
                            style: TextStyle(
                              fontFamily: 'Proxima '
                            ),)),
                        ),
                      )
                    ],
                  ),
                ),
                 ksizedbox20,
                Obx(()=>
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          controller.containercolor(6);
                          controller.update();
                        },
                        child: Container(
                          height: 45,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(34),
                            color: controller.containercolor.value==6?
                               Colors.amber[200]:Colors.grey.shade200
                          ),
                          child: Center(
                            child: Text('Live Tracking ',
                            style: TextStyle(
                              fontFamily: 'Proxima ',
                              
                            ),),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.containercolor(7);
                          controller.update();
                        },
                        child: Container(
                          height: 45,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(34),
                            color: controller.containercolor.value==7?
                             Colors.amber[200]:Colors.grey.shade200
                          ),
                          child: Center(
                            child: Text('Rest Stop',
                            style: TextStyle(
                              fontFamily: 'Proxima '
                            ),)),
                        ),
                      )
                    ],
                  ),
                ),
                ksizedbox20,
                Text('Reviews',
                style: TextStyle(
                 fontFamily: 'Proxima ',
                 fontSize: 16.5,
                 fontWeight:FontWeight.w700
               
                ),),
                ksizedbox20,
                Container(
                  height: 100,
                  width: 377,
                  decoration: BoxDecoration(
                        border: Border.all(
                         width: 1,
                         color: kgrey
                        ),
                        borderRadius: BorderRadius.circular(4)
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5),
                      child: Text('Hi this bus super and good qulaitys and pick up and dropping safe this bus..',
                      style: TextStyle(
                        height: 1.4,
                      fontSize: 15.5,
                         fontFamily: 'Proxima ',
                      ),),
                    ),
                  ),
                ),
                ksizedbox20,
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    height: 50,
                    width: 399,
                    decoration: BoxDecoration(
                      color: Color(0xffEE0000),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: Center(
                      child: Text('SUBMIT REVIEWS',
                      style: TextStyle(
                         fontFamily: 'Proxima ',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: kwhite
                      ),
                      ),
                    ),
                  ),
                ),
                ksizedbox20,
                ],
               ),
             ],
           ),
         ),
    
      
    );
  }
}
