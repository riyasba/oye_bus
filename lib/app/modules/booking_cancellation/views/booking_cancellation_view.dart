import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/contsands.dart';
import 'package:oye_bus/app/routes/app_pages.dart';


import '../controllers/booking_cancellation_controller.dart';

class BookingCancellationView extends GetView<BookingCancellationController> {
   BookingCancellationView({Key? key}) : super(key: key);
  bool ischeck = false;
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
          title: Text('Cancellation',
          style: TextStyle(
            fontSize: 20
          ),),
          actions: [
          Image.asset('assets/offers_icon/supporticon.png')
          ],
         ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
        
        child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Container(
                height: 140,
                width: 399,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                          Text('KMPL Kalaimakal Travels',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Proxima ',
                  
                          ),
                          ),
                          Container(
                            width: 399,
                            child: Text('------------------------------------------------------------------------------',
                            maxLines: 1,
                            style: TextStyle(
                              color: kgrey
                            ),)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Chennai',
                              style: TextStyle(
                                   color: Colors.grey,
                                  fontSize: 15.5,
                                    fontFamily: 'Proxima ',
                              ),),
                              Icon(Icons.arrow_forward),
                              Text('Bengaluru',
                            style: TextStyle(
                                 color: Colors.grey,
                                  fontSize: 15.5,
                                    fontFamily: 'Proxima ',
                            ),)
                            ],
                          ),
                           Container(
                            width: 399,
                            child: Text('------------------------------------------------------------------------------',
                            maxLines: 1,
                            style: TextStyle(
                              color: kgrey
                            ),)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('06:50AM',
                                 style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.5,
                                    fontFamily: 'Proxima ',
                                ),),
                                Text('12:15PM',
                                 style: TextStyle(
                                     fontSize: 15.5,
                                  color: Colors.grey,
                                    fontFamily: 'Proxima ',
                                ),)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Fri,10 Nov',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                    fontFamily: 'Proxima ',
                                ),),
                                Text('Fri,10 Nov',
                                 style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                    fontFamily: 'Proxima ',
                                ),
                                )
                              ],
                            )
                    ],
                  ),
                ),
              ),
              ksizedbox20,
              Text('Journey Details',
              style: TextStyle(
                  fontFamily: 'Proxima ',
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),),
              ksizedbox10,
              Row(
                children: [
                  Text('Ticket Number :',
                  style: TextStyle(
                    fontSize: 16,
                    color: kgrey,
                    fontFamily: 'Proxima ',
                  ),),
                  Text(' 33434JS776WU',
                   style: TextStyle(
                    fontSize: 16,
                  
                    fontFamily: 'Proxima ',
                    fontWeight: FontWeight.w600
                  ),
                  )
                ],
              ),
              ksizedbox30,
              Text('Select Passengers',
              style: TextStyle(
                fontSize: 18,
                  
                    fontFamily: 'Proxima ',
                    fontWeight: FontWeight.w600
              ),),
              ksizedbox20,
              Obx(()=>
                 Container(
                  height: 52,
                  width: 389,
                  decoration:BoxDecoration(
                   borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      width: 1,
                      color: Colors.black
                    )
                  ),
                   child: Column(
                     children: [
                       Row(
                
                        children: [
                         Checkbox(
                          shape: CircleBorder(),
                          value: controller.ischeck.value, 
                         onChanged: (value){
                           controller.ischeck(value);
                         }),
                               Column(
                          
                                crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text('Prakash'),
                                   Container(
                                    width: MediaQuery.of(context).size.width * 0.77,
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Text('Male, 25'),
                                          Text('L19',
                                     textAlign: TextAlign.end,
                                      style: TextStyle(
                                      color: Color(0xffFF0000)
                                     ),)
                                       ],
                                     ),
                                   ),
                                  
                                 ],
                               ),
                        ],
                         ),
                       
                     ],
                   ),
                 ),
              ),
              SizedBox(
                height: 200,
              ),
            GestureDetector(
                    onTap: (){
                      Get.toNamed(Routes.REVIEW_REFUND_DETAILS);
                    },
                    child: Container(
                      height: 50,
                      width: 399,
                      decoration: BoxDecoration(
                        color: Color(0xffEE0000),
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Center(
                        child: Text('REVIEW REFUND DETAILS',
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
                  ksizedbox10,
                  Center(
                    child: Text('Cancel',
                    style: TextStyle(
                      fontFamily: 'Proxima ',
                      fontSize: 16
                    ),),
                  )


              
            
          ],
        ),
      ),
      
    );
  }
}
