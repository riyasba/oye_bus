import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/add_booking_model.dart';
import 'package:oye_bus/app/modules/home/controllers/home_controller.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/controllers/busseatmaping_controller.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/reviewbookingdetails_view.dart';
import 'package:oye_bus/app/modules/screens/passenger_info/widgets/dotted_line_small.dart';
import 'package:oye_bus/app/modules/screens/settingsscreens/copassengers/controllers/copassengers_controller.dart';

import '../controllers/passenger_info_controller.dart';

class PassengerInfoView extends GetView<PassengerInfoController> {
   PassengerInfoView({Key? key}) : super(key: key);
  final copassangersController = Get.find<CopassengersController>();
      final boadingdroppingController = Get.find<BusseatmapingController>();
      final passengerController = Get.find<PassengerInfoController>();
      //final homeController = Get.find<HomeController>();
       final buslistController = Get.find<HomeController>();

     
  @override
    String getActualTime(String time){
        var temptime = time.split(':');
        String actualTime = "${temptime[0]}:${temptime[1]}";
        return actualTime;
       }
  Widget build(BuildContext context) {
    Get.lazyPut(() => 
    PassengerInfoController());
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('passenger information'),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        builder: (_) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: size.width,  
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        color: Colors.grey.withOpacity(0.6)
                      )
                    ]
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                    
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.directions_bus_rounded,color: kred,),
                             SizedBox(
                              width: 10.w,
                            ),
                           buslistController.busdata.isNotEmpty? Container(
                          
                             child: Text(buslistController.busdata.first.route.busDetails.busName,
                             style: smalbalckfont.copyWith(
                                fontSize: 16.sp
                              ),),
                           ):Text('')
                          ],
                        ),
                         
                        Padding(
                          padding: const EdgeInsets.only(left: 0,top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Column(
                                  
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 110.w,
                                      child:Text(buslistController.boardinglocation.toString(),
                                      maxLines: 2, overflow: TextOverflow.ellipsis,
                                      style: primaryFont.copyWith(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp
                                          ),)),
                                      
                                    // Container(
                                    //   width: 110.w,
                                    //     child: Text(buslistController.boardinglocation.toString(),style: primaryFont.copyWith(
                                    //       color: Colors.black45,
                                    //       fontSize: 12.sp
                                    //     ),
                                    //     maxLines: 1,
                                    //     overflow: TextOverflow.ellipsis,
                                    //     )
                                    //   ),
                                    Container(
                                      width: 125.w,
                                        child: RichText(
                                          text: TextSpan(
                                            text:getActualTime(buslistController.busdata.first.route.arrivalTime),
                                          style: primaryFont.copyWith(
                                            color: Colors.black45,
                                            fontSize: 14.sp),
                                          children: [
                                            TextSpan(text: "  "),
                                            TextSpan(
                                              text: formatDate(
                                                DateTime.parse(
                                                  buslistController.selectedBookingDate.value),
                                                   [ M,"",d," ",yyyy]),style: primaryFont.copyWith(
                                            color: const Color.fromRGBO(0, 0, 0, 0.451),
                                            fontSize: 13.sp
                                          ),
                                            )
                                          ]
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                  ],
                                ),
                              ),
                              Icon(Icons.arrow_right_alt_outlined),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 110.w,
                                      child: Text(buslistController.destinationlocation.toString(),
                                      maxLines: 2, overflow: TextOverflow.ellipsis,
                                      style: primaryFont.copyWith(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.sp
                                            ),)),
                                    // Container(
                                    //   width: 110.w,
                                    //     child: Text(buslistController.destinationlocation.toString(),style: primaryFont.copyWith(
                                    //       color: Colors.black45,
                                    //       fontSize: 12.sp
                                    //     ),
                                    //     maxLines: 1,
                                    //     overflow: TextOverflow.ellipsis,
                                    //     ),
                                    //   ),
                                    Container(
                                      width: 125,
                                        child: RichText(
                                          
                                          text: TextSpan(text: 
                                          getActualTime(buslistController.busdata.first.route.departureTime),
                                          style: primaryFont.copyWith(
                                              color: Colors.black45,
                                              fontSize: 14.sp),
                                          children: [
                                            TextSpan(text: "  "),
                                            TextSpan(
                                              
                                              text: formatDate(
                                                DateTime.parse(
                                                   buslistController.selectedBookingDate.value), 
                                                   [ M,"",d,' ',yyyy]),style: primaryFont.copyWith(
                                            color: Colors.black45,
                                            fontSize: 13
                                          ),
                                            )
                                          ]
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ) ,
                ),
              ),
          
              //Contact details ui
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Colors.grey.withOpacity(0.6)
                        )
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                           Row(
                            children: [
                              Icon(Icons.person_pin_outlined,color: kred,),
                             const  SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Contact Details",style: smalbalckfont.copyWith(
                                    fontSize: 16
                                  ),),
                                  Text("Your ticket and bus details will be sent here",style: primaryFont.copyWith(fontSize: 11),)
                                ],
                              )
                            ],
                          ),
                          //email - phone number field
                         const  SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: controller.emailController,
                            style: smalbalckfont.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText:"Enter your email id",
                              labelText: "Email ID",
                              contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8)
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                            TextField(
                              controller: controller.mobileController,
                            style: smalbalckfont.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText:"Enter your phone",
                              labelText: "Phone",
                              contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8)
                            ),
                          ),
                         const SizedBox(
                            height: 10,
                          ),
                        Row(
                          children: [
                            Obx(()=> Transform.scale(
                              scale: 0.8,
                              child: Switch(
                                      // This bool value toggles the switch.
                                      value: controller.isWhatsappSend.value,
                                      activeColor: Colors.red,
                                      onChanged: (bool value) {
                                        // This is called when the user toggles the switch.
                                        controller.isWhatsappSend(value);
                                      },
                                    ),
                            ),
                            ),
                              Container(
                                width: 250,
                                child: Text("Send Booking details and Trip updates on Whatsapp",
                                style: primaryFont.copyWith(fontSize: 10),maxLines: 2,),
                              )
                          ],
                        )
                        ],
                      ),
                    ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // passener details
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Colors.grey.withOpacity(0.6)
                        )
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                           Row(
                            children: [
                              Icon(Icons.person_pin_outlined,color: kred,),
                             const  SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Add Passengers",style: smalbalckfont.copyWith(
                                    fontSize: 16
                                  ),),
                                  Text("Your ticket and bus details will be sent here",style: primaryFont.copyWith(fontSize: 11),)
                                ],
                              )
                            ],
                          ),
                         const SizedBox(
                            height: 15,
                          ),
                          //passenger count
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Passenger 01",style: smalbalckfont.copyWith(
                                    fontSize: 16,
                                  ),),
                                  Text("Seat No: U10, Upper Deck",style: primaryFont.copyWith(
                                    fontSize: 11
                                  ),)
                                ],
                              ),
                              Text("Reserved for Male",style: primaryFont.copyWith(
                                color: kred,
                                fontSize: 11
                              ),)
          
                            ],
                          ),
                          //email - phone number field
                         const  SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: controller.nameController,
                            style: smalbalckfont.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText:"Enter name",
                              labelText: "Name",
                              contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8)
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                            TextField(
                              controller:controller.ageController ,
                            style: smalbalckfont.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText:"Enter age",
                              labelText: "Age",
                              contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8)
                            ),
                          ),
                        const SizedBox(
                            height: 10,
                          ),
                            TextField(
                              controller: controller.genderController,
                            style: smalbalckfont.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText:"Enter gender",
                              labelText: "Gender",
                              contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8)
                            ),
                          ),
                           const SizedBox(
                            height: 10,
                          ),
                            TextField(
                            style: smalbalckfont.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),   
                              ),
                              hintText:"Enter residence",
                              labelText: "City",
                              contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8)
                            ),
                          ),
                           const SizedBox(
                            height: 10,
                          ),
                            TextField(
                            style: smalbalckfont.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),   
                              ),
                              hintText:"Enter state",
                              labelText: "State",
                              contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8)
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child:  Container(
                    height: 150,
                     width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.grey.withOpacity(0.6)
                            )
                          ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('Passenger Details',
                                                       style: smalbalckfont.copyWith(
                                            fontSize: 18
                                          )
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('0/1 selected'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Divider(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15,top: 5),
                                child: GetBuilder<CopassengersController>(
                                  builder: (_) {
                                    return Container( 
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: copassangersController.passengersdata.length,
                                        itemBuilder: (context,index){
                                          return  Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 23,
                                                  backgroundColor: Colors.pink.shade100,
                                                  child: Center(
                                                    child: Icon(Icons.person)),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                     children: [
                                                     copassangersController.passengersdata.isNotEmpty? Text(copassangersController.passengersdata[index].name,
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight: FontWeight.w600
                                                      ),):Text(''),
                                                      Row(
                                                        children: [
                                                          copassangersController.passengersdata.isNotEmpty?
                                                          Text(copassangersController.passengersdata[index].gender):
                                                          Text(''),
                                                          Text(' ,'),
                                                          Text('${copassangersController.passengersdata[index].age} years')
                                                        ],
                                                      )
                                                     ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Obx(()=>
                                               Checkbox(
                                                value: controller.ischeckvalue.value, 
                                                onChanged: (value){
                                                 controller.ischeckvalue.value=value!;
                                                }),
                                            )
                                          ],
                                          );
                                        },
                                      ),
                                    );
                                  }
                                ),
                              )
                            ],
                          ),
                        ),             
                  ),
              ),
                  const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                   width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            color: Colors.grey.withOpacity(0.6)
                          )
                        ]
                      ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                         Row(children: [
                                 Image.asset("assets/home_page/oye_small_icon.png",height: 40,),
                                 const  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                      
                                        child: Text("Oye Bus Assurance Program", style: smalbalckfont.copyWith(
                                          fontSize: 16
                                        ),),
                                      ),
                                      Text("Tearms & Conditions Apply",style: primaryFont.copyWith(fontSize: 11,color: Colors.blue),)
                                    ],
                                  )
                                ],
                              ),
                             const SizedBox(
                                height: 10,
                              ),
                             const  MySeparatorSmall(
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: kred,
                                        borderRadius:  BorderRadius.circular(30)
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 250,
                                      child: Text("Upto Rs.75000 in the event of accidental hospitalisation",style: primaryFont.copyWith(
                                        fontSize: 10
                                      ),),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: kred,
                                        borderRadius:  BorderRadius.circular(30)
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text("Upto Rs.5 Lakhs in case of death/PTD/PPD",style: primaryFont.copyWith(
                                      fontSize: 10
                                    ),)
                                  ],
                                ),
                              ),
                    ],
                  ),
                ),
                ),
              ),
             const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                   width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.grey.withOpacity(0.6)
                            )
                          ]
                        ),
                        child: Obx(()=>  Column(
                            children: [
                              Row(
                            children: [
                              Obx(()=> Transform.scale(
                                scale: 0.8,
                                child: Switch(
                                        // This bool value toggles the switch.
                                        value: controller.iHaveGstNumber.value,
                                        activeColor: Colors.red,
                                        onChanged: (bool value) {
                                          // This is called when the user toggles the switch.
                                          controller.iHaveGstNumber(value);
                                        },
                                      ),
                              ),
                                ),
                                Text("I have a GST number (optional)",style: smalbalckfont.copyWith(fontSize: 15),)
                            ],
                          ),
                      
                                            
                       if(controller.iHaveGstNumber.isTrue)       
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 10),
                         child: Column(
                              children: [          
                                 const SizedBox(
                                height: 10,
                              ),
                                TextField(
                                style: smalbalckfont.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText:"Enter GSTIN",
                                  labelText: "GSTIN",
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8)
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                                TextField(
                                style: smalbalckfont.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText:"Enter Business Name",
                                  labelText: "Business Name",
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8)
                                ),
                              ),
                                  const SizedBox(
                                height: 15,
                              ),
                                TextField(
                                style: smalbalckfont.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText:"Enter Business Address",
                                  labelText: "Business Address",
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8)
                                ),
                              ),
                                  const SizedBox(
                                height: 15,
                              ),
                                TextField(
                                style: smalbalckfont.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText:"Enter Business Address",
                                  labelText: "Business Email",
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8)
                                ),
                              ),             
                              ],
                            ),
                       ),
                       const SizedBox(
                        height: 10,
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 10),
                         child: Text("In case of Invalid/cancelled GSTIN, this booking shall be considered as personal booking",style: primaryFont.copyWith(
                          fontSize: 10,
                         ),),
                       ),
                        const SizedBox(
                        height: 10,
                       ),
                            ],
                          ),
                        ),
                ),
              ),
               const SizedBox(
                        height: 10,
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Text("By clicking proceed with the purchase, i accept the",style: primaryFont.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w600
                         ),),
                       ),
                      const  SizedBox(
                        height: 5,
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: RichText(text: TextSpan(
                          text: "Terms & Conditions",
                          style: primaryFont.copyWith(
                            color: kred,
                            fontSize: 12,
                            decoration: TextDecoration.underline
                          ),
                          children: [
                        TextSpan(
                          text: " & ",
                          style: primaryFont.copyWith(
                            color: Colors.black87,
                            fontSize: 12,
                          ),
                         ),
                          TextSpan(
                          text: "Privacy Policy",
                          style: primaryFont.copyWith(
                            color: kred,
                            fontSize: 12,
                            decoration: TextDecoration.underline
                          ),
                         )
                          ]
                         ))
                       ),
                        const SizedBox(
                        height: 10,
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                            width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Colors.grey.withOpacity(0.6)
                              )
                            ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Amount: ",style: primaryFont.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                    ),),
                                    Text("4,454.00",style: primaryFont.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: kred
                                    ),)
                                  ],
                                ),
                                Text("(Exclusive of Taxes)",style: primaryFont.copyWith(
                                      fontSize: 12,
                                    ),),
                              ],
                            ),
                          ),
                        ),
                      ),
                        Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              ksizedbox30,
                              Container(
                                height: 500.h,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: copassangersController.passengersdata.length,
                                  itemBuilder: (BuildContext context, int index) { 
                                    return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 90.h,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16.0),
                                          border: Border.all(
                                            color: Colors.black, // Border color
                                            width: 2.0.w, // Border width
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              copassangersController.passengersdata.isNotEmpty?
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Name: ${copassangersController.passengersdata[index].name}',
                                                    style: TextStyle(
                                                        fontSize: 15.sp, 
                                                        fontWeight: FontWeight.w600),
                                                  ),
                                                   GestureDetector(
                                                    onTap: (){
                                                       showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)),
                                      backgroundColor: Colors.white,
                                      title: Column(
                                        children: [
                                          Image.asset(
                                              'assets/images/deleteaccountimage.png'),
                                      
                                        ],
                                      ),
                                      content: Container(
                                        width: 150.w,
                                        child: const Text(
                                          "Are you sure want to delete your account?",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: Container(
                                                height: 38,
                                                width: 105,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                        BorderRadius.circular(6),
                                                    // ignore: unrelated_type_equality_checks
                                                    color: kgrey),
                                                child: Center(
                                                    child: Text("No",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: kblack))),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                             copassangersController.deletepassenger(
                                                        passengerid: copassangersController.passengersdata[index].id.toString()
                                                      );
                                                      copassangersController.update();
                                                      Get.back();
                                                
                                              },
                                              child: Container(
                                                height: 38,
                                                width: 105,
                                                decoration: BoxDecoration(
                                                    color: kred,
                                                    borderRadius:
                                                        BorderRadius.circular(6)),
                                                child: Center(
                                                  child: Text("yes ",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: kwhite)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        ksizedbox10
                                      ],
                                    );
                                  });
                                   },
                                   child: Container(
                                   height: 28,
                                   width: 28,
                                   decoration: BoxDecoration(
                                   shape: BoxShape.circle,
                                   color: Colors.grey[200],
                                   ),
                                   child: Center(
                                   child: Icon(Icons.clear,
                                   color: kred,))),
                                     ),
                                                ],
                                              ):Text(''),
                                              Text('Age:${copassangersController.passengersdata[index].age}',
                                                  style: TextStyle(
                                                      fontSize: 15.sp, 
                                                      fontWeight: FontWeight.w600)),
                                              Text('Gender:${copassangersController.passengersdata[index].gender}',
                                                  style: TextStyle(
                                                      fontSize: 15.sp, 
                                                      fontWeight: FontWeight.w600))
                                            ],
                                          ),
                                        ),
                                      ),
                                      ksizedbox20,
                                    ],
                                  );
                                   },
                                ),
                              ),
                                  ksizedbox40,
                            ],
                          ),
                        ),
                      ),
          
                          const SizedBox(
                        height: 50,
                        )
            ],
          );
        }
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          print('booking number');
          print(controller.mobileController);
          AddBookingModel addBookingModel = 
          AddBookingModel(
            age:controller.ageController.text, 
            boardingPoint: boadingdroppingController.boardingpointdata.first.location, 
            date: buslistController.selectedBookingDate.value, 
            droppingPoint: boadingdroppingController.droppointdata.first.location, 
            emailId: controller.emailController.text, 
            gender: controller.genderController.text, 
            mobile: controller.mobileController.text, 
            passengerName: controller.nameController.text, 
            perticketPrice: boadingdroppingController.routedata!.price, 
            primaryCustomerName: controller.nameController.text, 
            busid: boadingdroppingController.tripdata!.busId, 
            routeid: boadingdroppingController.tripdata!.routeId, 
            seatid: boadingdroppingController.busseatdata.isNotEmpty?
            boadingdroppingController.busseatdata.first.seatNo:'', 
            seatmapid: boadingdroppingController.busseatdata.isNotEmpty?
            boadingdroppingController.busseatdata.first.id.toString():'', 
            tripid: boadingdroppingController.tripdata!.id.toString(), 
            vendorid:boadingdroppingController.busDetailsdata!.vendorId, 
            iswomenseat:boadingdroppingController.busseatdata.isNotEmpty?
             boadingdroppingController.busseatdata.first.ladiesSeat:'') ;
            passengerController.addbooking(addBookingModel: addBookingModel);              
          //Get.to(ReviewbookingdetailsView());
          },
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: kred
          ),
          alignment: Alignment.center,
          child: Text(
          "Proceed".toUpperCase(),
          style: primaryFont.copyWith(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          ),
        ),
      ),
    );
  }
}
