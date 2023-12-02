import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bustrip_reviews_controller.dart';

class BustripReviewsView extends GetView<BustripReviewsController> {
  const BustripReviewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar:AppBar(
          leading:Icon(Icons.arrow_back),
          title: Text('Bus Trip Reviews',
          style: TextStyle(
            fontSize: 20
          ),),
          actions: [
          Image.asset('assets/offers_icon/bellicon.png')
          ],
         ),
         body: Column(
          children: [
            
          ],
         ),
    
      
    );
  }
}
