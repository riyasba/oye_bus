import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/contsands.dart';
import '../controllers/notification_controller.dart';



class NotificationView extends GetView<NotificationController> {
 

   NotificationView({Key? key}) : super(key: key);
  
  List names = ["M", "D", "Y", "T"];
  List msgname = ['Booking Alerts',
  '20% Offer this Coupons',
  'Your Trip Complete ',
  'Devon Lane'];
  List subtitle=[
    'Replied your message.',
    'Commented on your post.',
    'Followed your work.',
    'Followed your work.'
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: Icon(Icons.arrow_back),
        title: const Text('NotificationView',
        style: TextStyle(
          fontSize: 20,
          
        ),),
        actions: [
          Icon(Icons.search,
          size: 25,)
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
        Obx(()=>
           Row(
            children: [
              Column(
                children: [
                  TextButton(
                    onPressed: (){
                    controller.containerindex(0);
                    controller.update();
                  }, 
                  child: Text('All',
                  style: TextStyle(
                    color: Colors.black
                  ),)),
                  if(controller.containerindex.value==0)
                  Container(
                    height: 3,
                    width: 35,
                    decoration: BoxDecoration(
                      color:Color(0xffFF0000)
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: (){
                    controller.containerindex(1);
                    controller.update();
                  }, 
                  child: Text('Mark all as read',
                  style: TextStyle(
                       color: Colors.black
                  ),
                  )),
                  if(controller.containerindex.value==1)
                    Container(
                    height: 3,
                    width: 100,
                    decoration: BoxDecoration(
                      color:Color(0xffFF0000)
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        ksizedbox40,
        ListView.builder(
          itemCount: names.length,
          shrinkWrap: true,
          itemBuilder: (context,index){
             return ListTile(
             title: Container(
              height: 85,
          
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(0.0, 0.75),
                    blurRadius: 1,
                    color: kgrey
                  )
                ],
                borderRadius: BorderRadius.circular(5),
               color: Colors.grey.shade100
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.center,    
                        
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       
                        Row(
                      
                          children: [
                             Padding(
                          padding: const EdgeInsets.only(left: 0), 
                          child: Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffFFC107
                        )
                            ),
                          ),
                        ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff219F98)
                                ),
                                child: Center(
                                  child:Text(names[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                  ),),
                                ),
                              ),
                            ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(msgname[index],
                                             
                                    style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                    ),),
                                    Text(subtitle[index],
                                    style: TextStyle(
                                      fontSize:   12,
                                      color: kgrey
                                    ),)
                                            
                                  ],
                                ),
                              ),
                          ],
                        ),
                      
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0,left: 0),
                          child: Text('2m',
                          style: TextStyle(
                            fontSize: 11,
                            color: kgrey
                          ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
             ),
             );
        })
        ],
      )
    );
  }
}
