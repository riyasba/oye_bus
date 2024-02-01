import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';

import '../controllers/mywallet_screen_controller.dart';

class MywalletScreenView extends GetView<MywalletScreenController> {
   MywalletScreenView({Key? key}) : super(key: key);
  @override
  List image=[
    'assets/images/rupeesimage.png',
    'assets/images/rupeesimage.png',
    'assets/images/rupeesimage.png',
    'assets/images/rupeesimage.png',
    'assets/images/rupeesimage.png',
     'assets/images/rupeesimage.png',
      'assets/images/rupeesimage.png',
  ];
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[300],
            leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back)),
            title: Text(
              'My Wallet Amount',
              style: appbarfont,
            ),
            centerTitle: true,
          ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ksizedbox20,
                Text('This wallet amount is used for only ticket booking using OYE.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Proxima Nova'
                ),),
                ksizedbox30,
                Container(
                  height: 145,
                  width: 387,
                  decoration: BoxDecoration(
                    color: kred,
                    borderRadius: BorderRadius.circular(9)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('₹5,479',
                      style: TextStyle(
                        fontFamily: 'Proxima Nova',
                         color: kwhite,
                         fontSize: 35,
                         fontWeight: FontWeight.w700
                      ),),
                      Text('Wallet Main Balance',
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 17,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w600,
                      color: kwhite
                      ),)
                    ],
                  ),
                ),
                ksizedbox20,
                Text('Recent Ticket Cancellation Amounts',
                style: TextStyle(
                   fontSize: 16,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w600,
                ),),
                ksizedbox20,
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: image.length,
                  itemBuilder: (context,index){
                   return Container(
                    
                     color: kwhite,
                     child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(image[index]),
                            Column(
                              children: [
                                Container(
                                  width: 210,
                                  child: Text('New refer Join this app in OYE. So get 100 rupees for your wallets.'))
                              ],
                            ),
                            Column(           
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('₹100',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green
                                ),),
                                Text('21,Jan,2024')
                              ],
                            )
                          ],
                        ),
                        ksizedbox10,
                        Divider(
                          thickness: 2,
                        ),
                        ksizedbox10,
                      ],
                     ),
                   );
                })
              ],
            ),
          ],
        ),
      )
    );
  }
}
