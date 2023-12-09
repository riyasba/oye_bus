import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/home/controllers/home_controller.dart';



class HomeAppBarWidget extends GetView<HomeController>  {
   const HomeAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Container(
            height: 55,
            child: Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration:  BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/home_page/menu_icon.svg",height: 25,fit: BoxFit.fill,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      children: [
                        Text("Monday, 06 Nov 2024",style: smalbalckfont.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w800
                        ),),
                        Row(
                          children: [
                          const  Icon(Icons.location_on_outlined,size: 13,),
                            Text("Chennai, Nungambakkam",style: primaryFont.copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.w400
                            ),),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration:  BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)
                    ),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/home_page/bell_icons.svg",height: 25,fit: BoxFit.fill,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}