import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/contsands.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {


   NotificationView({Key? key}) : super(key: key);
  
 
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
          itemCount: 5,
          shrinkWrap: true,
      
          itemBuilder: (context,index){
             return ListTile(
             title: Container(
              height: 80,
          
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffFFC107
)
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                   
                        ),
                      )
                    ],
                  )
                ],
              )
             ),
             );
        })
        ],
      )
    );
  }
}
