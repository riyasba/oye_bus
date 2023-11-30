// import 'package:flutter/material.dart';
// import 'package:oye_bus/app/components/contsands.dart';

// class CommonButton extends StatefulWidget {
//   String text;
//   Color color;
//   Color textColor;
//   final VoidCallback onPressed;

//   CommonButton(
//       {super.key,
//       required this.text,
//       required this.color,
//       required this.textColor,
//       required this.onPressed});

//   @override
//   State<CommonButton> createState() => _CommonButtonState();
// }

// class _CommonButtonState extends State<CommonButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25),
//       child: InkWell(
//         onTap: onPressed,
//         child: Container(
//           alignment: Alignment.center,
//           height: 50,
//           width: double.infinity,
//           decoration: BoxDecoration(
//               color: widget.color,
//               borderRadius: BorderRadius.circular(5),
//               border: Border.all(width: 1.5, color: kred)),
//           child: Text(widget.text,
//               style: TextStyle(
//                   color: widget.textColor,
//                   fontSize: 20,
//                   fontWeight: FontWeight.w700)),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oye_bus/app/components/contsands.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? width;
  final double height;
  final VoidCallback onPressed;
 
   String text;
   Color color;
   Color textColor;

   CustomElevatedButton({

    Key? key,
    required this.text,
      required this.color,
       required this.textColor,
    required this.onPressed,
    
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child:Container(
          alignment: Alignment.center,
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(  35.r,),
              border: Border.all(width: 1.5, color: kred)),
          child: Text(text,
              style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
        ),
    );
  }
}
