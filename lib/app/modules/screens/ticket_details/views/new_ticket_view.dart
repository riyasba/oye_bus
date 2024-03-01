import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';


class NewTicketView extends StatefulWidget {
  const NewTicketView({super.key});

  @override
  State<NewTicketView> createState() => _NewTicketViewState();
}

class _NewTicketViewState extends State<NewTicketView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.red,
                
                ),
              ),
               Expanded(
                flex: 2,
                 child: Container(
                  color: Colors.white,
                           ),
               ),
               
            ],
          ),
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 500,
                width: size.width,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey.withOpacity(0.5),
                      
                    )
                  ],
                  borderRadius: BorderRadius.circular(20)
                ),
               child: Padding(
                 padding: const EdgeInsets.only(top: 5,),
                 child: Column(
                  children: [
                    Text('KMRL Kalaimagal',
                     style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600
                              )),
                    Text('Ac/seater/slepper'),
                    ksizedbox20,
                    Padding(
                      padding: const EdgeInsets.only(left: 7,right: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Chennai',
                              style: TextStyle(
                                fontSize: 16.5,
                                fontWeight: FontWeight.w500
                              ),),
                              Text('Koyanbedu',
                              ),
                              Text('8:30  10 Nov',
                              style: TextStyle(
                                fontSize: 12
                              ),)
                            ],
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Column(
                              children: [
                                Text('7h 15m'),
                                Row(
                                                      
                                  children: [
                                    Container(
                                      height: 13,
                                      width: 13,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kred
                                      ),
                                    ),
                                    Container(
                                                              height: 2,
                                                              width: 90,
                                                              decoration: BoxDecoration(
                                    color: kred
                                                              ),
                                                            ),
                                                            Container(
                                      height: 13,
                                      width: 13,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: kred,
                                          width: 1.5
                                        ),
                                        shape: BoxShape.circle,
                                    
                                      ),
                                    ),
                                                      
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Bangalore',
                              style: TextStyle(
                                fontSize: 16.5,
                                fontWeight: FontWeight.w500
                              ),),
                              Text('Bommasandra'),
                              Text('8:30  10 Nov',
                              style: TextStyle(
                                fontSize: 12
                              ),)
                            ],
                          ),
                        ],
                      ),
                    ),
                    ksizedbox20,
                    Row(
                      children: [
                        Text('--------------')
                      ],
                    )
                  ],
                 ),
               ),
              ),
            ),
          ),
          Positioned(
            top: 50,

            child: Container(
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 6,right: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back,
                    color: kwhite,),
                  ),
                  Text('Your Ticket Details',
                   style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: kwhite
                                      ),),
                                      SvgPicture.asset('assets/home_page/bell_icons.svg',
                                      color: kwhite,)
                ],
                          ),
              ),
            ))
        ],
      ),
    );
  }
}