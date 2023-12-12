import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/paymentsuccesfull_view.dart';

import '../controllers/reservation_details_controller.dart';

class ReservationDetailsView extends GetView<ReservationDetailsController> {
  const ReservationDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservation Details',
        style: TextStyle(
          fontWeight: FontWeight.w500
        ),),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                                
                      width: 374,
                      decoration: BoxDecoration(
                        color: Color(0xffFF0000),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Chennai  - Bengaluru',
                                style: TextStyle(
                                  fontFamily: 'Proxima',
                                  fontSize: 20.5,
                                  fontWeight: FontWeight.w600,
                                  color: kwhite
                                ),),
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kwhite
                                  ),
                                  child: Image.asset('assets/offers_icon/resershareicon.png'),
                                )
                              ],
                            ),
                            Text('10 Nov 2023, Saturday',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Proxima',
                              fontWeight: FontWeight.w400,
                              color: kwhite
                            ),),
                            ksizedbox10,
                            Container(
                              width: 374,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4,right: 4),
                                child: Text('---------------------------------------------------------------------------',
                                style: TextStyle(
                                  color: kwhite
                                ),),
                              )),
                              ksizedbox20,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Bus Name',
                                  style: TextStyle(
                                    fontFamily: 'Proxima ',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: kwhite
                                  ),),
                                  Text('Seat Number',
                                    style: TextStyle(
                                    fontFamily: 'Proxima ',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: kwhite))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 150,
                                      child: Text('KMPL Kalaimakal Travels',
                                      style: TextStyle(
                                        fontFamily: 'Proxima ',
                                        color: kwhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700
                                      ),),
                                    ),
                                    Text('L17',
                                    textAlign: TextAlign.start,
                                     style: TextStyle(
                                      
                                      color: kwhite,
                                        fontFamily: 'Proxima ',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700
                                      ),
                                    )
                                  ],
                                ),
                              ),
                                 ksizedbox20,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Ticket ID',
                                  style: TextStyle(
                                    fontFamily: 'Proxima ',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: kwhite
                                  ),),
                                  Text('Bus Number',
                                    style: TextStyle(
                                    fontFamily: 'Proxima ',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: kwhite))
                                ],
                              ),
                                 Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('LA345678',
                                    style: TextStyle(
                                      fontFamily: 'Proxima ',
                                      color: kwhite,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700
                                    ),),
                                    Text('TN 01 BC 3432',
                                    textAlign: TextAlign.start,
                                     style: TextStyle(
                                      
                                      color: kwhite,
                                        fontFamily: 'Proxima ',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              ksizedbox20,
                                   Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Arrival',
                                  style: TextStyle(
                                    fontFamily: 'Proxima ',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: kwhite
                                  ),),
                                  Text('Drop',
                                    style: TextStyle(
                                    fontFamily: 'Proxima ',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: kwhite))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('21:50 PM',
                                    style: TextStyle(
                                      fontFamily: 'Proxima ',
                                      color: kwhite,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700
                                    ),),
                                    Text('06:15AM',
                                    textAlign: TextAlign.start,
                                     style: TextStyle(
                                      
                                      color: kwhite,
                                        fontFamily: 'Proxima ',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              ksizedbox30,
                               Container(
                              width: 374,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4,right: 4),
                                child: Text('---------------------------------------------------------------------------',
                                style: TextStyle(
                                  color: kwhite
                                ),),
                              )),
                              ksizedbox20,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('TOTAL:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Proxima ',
                                    color: kwhite
                                  ),),
                                   Text('₹ 4,558.00',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Proxima ',
                                    color: kwhite
                                  ),)
                                ],
                              ),
                              ksizedbox30,
                                Padding(
                                  padding: const EdgeInsets.only(left: 4,right: 4),
                                  child: Container(
                                  width: 374,
                                  child: Text('---------------------------------------------------------------------------',
                                  style: TextStyle(
                                  color: kwhite
                                    ),)),
                                ),
                              ksizedbox20,
                              Center(
                                child: Image.asset('assets/images/qrimage.png'),
                              ),
                          
                          ],
                        ),
                      ),
                    ),
                   Positioned(
                    top: 56,
                    right: 330,
                    child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                )),
                    Positioned(
                      top: 56,

                      left: 330,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                      )), 
                       Positioned(
                      top: 357,
                      right: 330,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                      )),
                        Positioned(
                      top: 357,
                      left: 330,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                      )),
                       Positioned(
                      top: 450,
                      right: 330,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                      )),
                        Positioned(
                      top: 450,
                      left: 330,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                      )),
                  ],
                ), 
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                              children: [
                                Text('Note: ',
                                style: TextStyle(
                                  color: kred
                                ),),
                                Column(
                                  children: [
                                    Text('Just show your QR code while boarding bus.',
                                                                 ),
                                  ],
                                )
                              ],
                            ),
                    ),
                          ksizedbox20,
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 12,top: 3),
        child: GestureDetector(
          onTap: (){
            Get.to(PaymentsuccesfullView());
          },
          child: Container(
            height: 51,
            width: 374,
            decoration: BoxDecoration(
              color: kred,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: Text('Download PDF',
              style: TextStyle(
                fontFamily: 'Proxima ',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: kwhite
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
