import 'package:flutter/material.dart';


class RecentChip extends StatelessWidget {
  String places;
   RecentChip({super.key,required this.places});

  @override
  Widget build(BuildContext context) {
    return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(40)
                ),
                child:  Padding(
                  padding:  const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                  child: Center(child: Text(places)),
                ),
              );
  }
}