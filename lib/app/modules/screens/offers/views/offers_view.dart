import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/contsands.dart';

import '../controllers/offers_controller.dart';

class OffersView extends GetView<OffersController> {
   OffersView({Key? key}) : super(key: key);
  List offresimage=[
    'assets/offers_icon/offersimage1.png',
    'assets/offers_icon/offersimage2.png',
    'assets/offers_icon/offersimage3.png',
    'assets/offers_icon/offersimage4.png',
    'assets/offers_icon/offersimage5.png',
    'assets/offers_icon/offersimage6.png',
    'assets/offers_icon/offersimage7.png',
    'assets/offers_icon/offersimage8.png'
  ];
  List title= [
    'Save up to Rs 250 on bus tickets',
    '10% instant discount up to Rs 100.',
    'Save up to Rs 500 on bus tickets',
    '10% instant discount up to Rs 100.',
    'Save up to Rs 250 on bus tickets',
    '10% instant discount up to Rs 100.',
    'Save up to Rs 250 on bus tickets',
    '10% instant discount up to Rs 100.'
  ];
  List buttonmsg=[
    'ABCR34',
    'FIRSTBUS',
    'First',
    'ABCD676',
    '34SJ24',
    'SUPERHIT',
    'First',
    'NOV2345'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: const Text('Checkout some offers?',
        style: TextStyle(
          fontSize: 20
        ),),
        centerTitle: true,
        actions: [
        Image.asset('assets/offers_icon/bellicon.png')
        ],
      ),
       body: ListView(
         children: [
           Column(
            children: [
              ksizedbox10,
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: offresimage.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    childAspectRatio: 5/6,
                    crossAxisSpacing: 20), 
                    itemBuilder:(context,index){
                      return Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kwhite,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(0.0, 0.75),
                              color: kgrey,
                              blurRadius: 5
                            )
                          ]
                        ),
                        child: Column(
                          
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(offresimage[index],
                              height: 100,
                              fit: BoxFit.fitHeight,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5,top: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(title[index],
                                  style: TextStyle(
                                     fontFamily: 'Proxima',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600
                                  ),),
                                     Padding(
                              padding: const EdgeInsets.only(left: 0,top: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Valid till: 30 Nov',
                                  style: TextStyle(
                                     fontFamily: 'Proxima',
                                    fontSize: 12
                                  ),
                                  ),
                                  Container(
                                    height: 18,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: Color(0xff263238),
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Center(
                                      child: Text(buttonmsg[index],
                                      style: TextStyle(
                                        fontFamily: 'Proxima',
                                        fontSize: 12,
                                        color: kwhite
                                      ),),
                                    ),
                                  )
                                ],
                              ),
                            )
                                ],
                              ),
                            ),
                         
                          ],
                        ),
                      );
                    }),
              )
            ],
           ),
         ],
       ),
    );
  }
}
