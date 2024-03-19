import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';

import '../controllers/offers_controller.dart';

class OffersView extends StatefulWidget {
   OffersView({Key? key}) : super(key: key);

  @override
  State<OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends State<OffersView> {
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

    final offerscontroller = Get.find<OffersController>();

    @override
    void initState() {
      super.initState();
      offerscontroller.getoffers();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title:  Text('Checkout some offers',
          style: appbarfont,),
        centerTitle: true,
        actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Image.asset('assets/offers_icon/bellicon.png'),
        )
        ],
      ),
       body: ListView(
         children: [
           Column(
            children: [
              ksizedbox10,
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: GetBuilder<OffersController>(
                  builder: (_) {
                    return offerscontroller.offersdata.isEmpty?Center(
                      child: Container(
                        child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            ksizedbox40,
                            ksizedbox40,
                            ksizedbox30,
                           Image.asset('assets/images/offers_image.jpg')])),
                    ) :GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: offerscontroller.offersdata.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 20), 
                        itemBuilder:(context,index){
                          return Container(
                            width: 300.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kwhite,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  offset: const Offset(0.0, 0.75),
                                  color: kgrey,
                                  blurRadius: 5
                                )
                              ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                     height: 100.h,
                                     width: 300.w,
                                    child: Image.network(offerscontroller.offersdata[index].images.toString(),
                                    fit: BoxFit.fill,),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5,top: 8),
                                  child: Column(
                               
                                    children: [
                                      Text(offerscontroller.offersdata[index].title.toString(),
                                      style: TextStyle(
                                         fontFamily: 'Proxima',
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600
                                      ),),
                                         Padding(
                                  padding: const EdgeInsets.only(top: 6,right: 36),
                                  child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Valid till: ${offerscontroller.offersdata[index].validTill}',
                                      style: TextStyle(
                                         fontFamily: 'Proxima',
                                        fontSize: 12.sp
                                      ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 7),
                                        child: Container(
                                          height: 18.h,
                                          width: 60.w,
                                          decoration: BoxDecoration(
                                            color: Color(0xff263238),
                                            borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Center(
                                            child: Text(offerscontroller.offersdata[index].couponCode.toString(),
                                            style: TextStyle(
                                              fontFamily: 'Proxima',
                                              fontSize: 12.sp,
                                              color: kwhite
                                            ),),
                                          ),
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
                        });
                  }
                ),
              )
            ],
           ),
           ksizedbox10,
         ],
       ),
    );
  }
}
