import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/contsands.dart';
import 'package:oye_bus/app/routes/app_pages.dart';

import '../controllers/review_refund_details_controller.dart';

class ReviewRefundDetailsView extends GetView<ReviewRefundDetailsController> {
  const ReviewRefundDetailsView({Key? key}) : super(key: key);
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
          title: Text('Review Refund Details',
          style: TextStyle(
            fontSize: 20
          ),),
          actions: [
          Image.asset('assets/offers_icon/supporticon.png')
          ],
         ),
      body:Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 46,
              width: 399,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 
                10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Refund Amount',
                    style: TextStyle(
                      fontSize: 16.5,
                      fontFamily: 'Proxima '
                    ),),
                    Text('₹ 58.00',
                    style: TextStyle(
                      fontFamily: 'Proxima '
                    ),)
                  ],
                ),
              ),
            ),
            ksizedbox20,
               Container(
              height: 46,
              width: 399,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 
                10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Seat to be cancelled',
                    style: TextStyle(
                      fontSize: 16.5,
                      fontFamily: 'Proxima '
                    ),
                    ),
                    Text('L19',
                    style: TextStyle(
                   
                      fontFamily: 'Proxima '
                    ),
                    )
                  ],
                ),
              ),
            ),
            ksizedbox30,
            Text('Bus Tickets',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18
            ),),
            ksizedbox20,
            Container(
              height: 150,
              width: 399,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade200
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 180,
                          child: Text('Amount paid(excl discount & offers)',
                          style: TextStyle(
                      fontFamily: 'Proxima ',
                      fontSize: 16.5
                    ),)),
                        Text('₹ 4,558.00',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                      fontFamily: 'Proxima '
                    ),)
                      ],
                    ),
                    Container(
                      width: 399,
                      child: Text('-----------------------------------------------------------------------------'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Refund Amount',
                        style: TextStyle(
                          fontSize: 16.5,
                      fontFamily: 'Proxima '
                    ),),
                        Text('₹ 58.00',
                        style: TextStyle(
                      fontFamily: 'Proxima '
                    ),)
                      ],
                    )
                  ],
                ),
              ),
            ),
            ksizedbox20,
            Text('Certain fees collected are not refundable',
             style: TextStyle(
                      fontFamily: 'Proxima '
                    )),
                    SizedBox(
                      height: 150,
                    ),
                      ksizedbox20,
                GestureDetector(
                  onTap: (){
                   showDialog(
                    context: context, 
                     barrierDismissible: false,
                   builder: (BuildContext contex){
                    return AlertDialog(
                         
                      title: Text('TICKET  CANCELLATION',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Proxima ',
                        fontWeight: FontWeight.w600
                      ),),
                      content: Text('Are you sure?, your booking bus seat tickets remove then completes'),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.back();
                              },
                              child: Container(
                                height: 34,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(7)
                                ),
                                child: Center(
                                  child: Text('No',
                                  style: TextStyle(
                                         fontFamily: 'Proxima ',
                                         fontWeight: FontWeight.w600
                                  ),),
                                ),
                              ),
                            ),
                             GestureDetector(
                              onTap: (){
                                Get.toNamed(Routes.TICKET_CANCELLATION);
                              },
                               child: Container(
                                height: 34,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xff05903C),
                                     borderRadius: BorderRadius.circular(7)
                                ),
                                child: Center(
                                  child: Text('Yes',
                                  style: TextStyle(
                                    color: kwhite,
                                         fontFamily: 'Proxima ',
                                         fontWeight: FontWeight.w600
                                  ),),
                                ),
                                                           ),
                             )
                          ],
                        )
                      ],
                    );
                   });
                  },
                  child: Container(
                    height: 50,
                    width: 399,
                    decoration: BoxDecoration(
                      color: Color(0xffEE0000),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: Center(
                      child: Text('CONFIRM CANCELLATION',
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
                  ),
                  ),
                ),
                ksizedbox20,
          ],
        ),
      ) 
      
    );
  }
}
