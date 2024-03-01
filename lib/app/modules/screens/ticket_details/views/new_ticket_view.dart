import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
                  Icon(Icons.arrow_back,
                  color: kwhite,),
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