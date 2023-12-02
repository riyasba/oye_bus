import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/contsands.dart';

import '../controllers/ticket_cancellation_controller.dart';

class TicketCancellationView extends GetView<TicketCancellationController> {
  const TicketCancellationView({Key? key}) : super(key: key);
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
          title: Text('Your Ticket Details',
          style: TextStyle(
            fontSize: 20
          ),),
          actions: [
          Image.asset('assets/offers_icon/supporticon.png')
          ],
         ),
      body: ListView(
        children: [
         Padding(
           padding: const EdgeInsets.only(left: 8,right: 8),
           child: Column(
            children: [
             Container(
              height: 532,
              width: 374,
              decoration: BoxDecoration(
                color: Color(0xffFFD400)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ksizedbox10,
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('KMRL Kalaimakal',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),),
                        Text('A/C Seater / Sleepr (2+1) - 1 Seat')
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 15),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 130,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text('21:50'),
                                        Text('10 Nov',
                                  style: TextStyle(
                                    fontSize: 10
                                  ),)
                                    ],
                                  ),
                                   Text('7h 15m',
                                   style: TextStyle(
                                    fontSize: 10
                                   ),),
                                   Column(
                                    children: [
                                      Text('05:05'),
                                      Text('11 Nov',
                                      style: TextStyle(
                                        fontSize: 10
                                      ),)
                                    ],
                                   )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            children: [
                              Container(
                                height: 15,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle
                                ),
                              ),
                              Container(
                                height: 92,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: Colors.black
                                ),
                              ),
                                 Container(
                                height: 15,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 130,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                         Text('Chennai \nAirport (Meenambakkam Metro)'),
                             
                              Text('Bangalore \nBommasandra')
                                  ],
                                ),
                              )
                            
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  ksizedbox10,
                  Container(
                    width: 374,
                    decoration: BoxDecoration(
                      
                    ),
                    child: Text('-----------------------------------------------------------------------------------',
                    style: TextStyle(
                      color: kwhite
                    ),),
                  ),
                  ksizedbox10,
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('21:50 PM - 06:15AM',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2,left: 10),
                    child: Text('10 Nov 2023, Saturday',
                    style: TextStyle(
                    ),),
                  ),
                  ksizedbox10,
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Seat Number : L19',
                        style: TextStyle(
                          fontWeight: FontWeight.w700
                        ),),
                        Row(
                          children: [
                            Text('Ticket ID : ',
                            style: TextStyle(
                    
                    
                            ),),
                            Text('LA345678',
                            style: TextStyle(
                              fontWeight: FontWeight.w700
                            ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  ksizedbox10,
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 0,right: 10),
                    child: Row(
                      children: [
                        Text('PHR : '),
                        Text('5565456679',
                        style: TextStyle(
                          fontWeight: FontWeight.w600
                        ),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      children: [
                        Text('Booking ID: '),
                        Text('86J8645JE75',
                        style: TextStyle(
                            fontWeight: FontWeight.w600
                        ),)
                      ],
                    ),
                  ),
                  ksizedbox10,
                  Container(
                    width: 374,
                    decoration: BoxDecoration(
                      
                    ),
                    child: Text('-----------------------------------------------------------------------------------',
                    style: TextStyle(
                      color: kwhite
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      width: 200,
                      child: Text('KMPL Kalaimakal Travels TN 01 BC 3432',
                      style: TextStyle(
                        fontWeight: FontWeight.w700
                      ),)),
                  ),
                     ksizedbox10,
                  Container(
                    width: 374,
                    decoration: BoxDecoration(
                      
                    ),
                    child: Text('-----------------------------------------------------------------------------------',
                    style: TextStyle(
                      color: kwhite
                    ),),
                  ),
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('TOTAL:',
                        style: TextStyle(
                          fontWeight: FontWeight.w700
                        ),),
                        Text('₹ 4,558.00',
                        style: TextStyle(
                          fontWeight: FontWeight.w700
                        ),)
                      ],
                    ),
                  )
                ],
              ),
             ),
             ksizedbox20,
             Container(
              height: 52,
              width: 372,
              decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(6),
                color: Color(0xffEE0000).withOpacity(0.2)
              ),
              child: Row(
                children: [
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      color: kwhite,
                      shape: BoxShape.circle
                    ),
                    child: Center(
                      child: Image.asset('assets/offers_icon/refundicon.png'))),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ticket cancelled',
                          style: TextStyle(
                            fontFamily: 'Proxima '
                          ),),
                          Text('on Nov 10,2023, 14:19',
                          style: TextStyle(
                            fontFamily: 'Proxima '
                          ))
                        ],
                      ),
                    )  
                ],
              ),
             ),
             ksizedbox10,
             Column(
               children: [
                 Text('Refund will be credited back to your payment method soon',
                 style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  fontFamily: 'Proxima '
                 ),),
                 
               ],
             ),
           
            
            ],
           ),
         )
        ],
      ),
    );
  }
}
