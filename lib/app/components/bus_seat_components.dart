import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget seater = Padding(
  padding: const EdgeInsets.symmetric(vertical: 2),
  child: Column(
      children: [
        SvgPicture.asset("assets/icons/seater.svg",height: 22,),
        const SizedBox(
          height: 6,
        ),
        SvgPicture.asset("assets/icons/seater.svg",height: 22,),
      ],
    ),
);

Widget singleSeater =  Column(
  children: [
    SizedBox(
      height: 30,
    ),
    SvgPicture.asset("assets/icons/seater.svg",height: 22,),
  ],
);




Widget sleeper = Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 5),
    child: SvgPicture.asset("assets/icons/sleeper.svg",height: 45,),
);


Widget w2sleeper = Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 5),
    child: SvgPicture.asset("assets/icons/w2SleeperSeats.svg",height: 25,),
);


Widget empty = const SizedBox(
    width: 10,
);

   Widget driver = Padding(
     padding: const EdgeInsets.symmetric(vertical: 10),
     child: SvgPicture.asset("assets/icons/driver.svg",height: 20,),
   );