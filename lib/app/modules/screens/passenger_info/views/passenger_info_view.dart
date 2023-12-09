import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/bus_list/widgets/seperator_widgets.dart';
import 'package:oye_bus/app/modules/screens/passenger_info/widgets/dotted_line_small.dart';

import '../controllers/passenger_info_controller.dart';

class PassengerInfoView extends GetView<PassengerInfoController> {
  const PassengerInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => 
    PassengerInfoController());
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('passenger information'),
        centerTitle: true,
      ),
      body: ListView(
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
                       const  SizedBox(
                          width: 10,
                        ),
                        Text("KMPL Kalaimakal Travels",style: smalbalckfont.copyWith(
                          fontSize: 15
                        ),)
                      ],
                    ),
                   const  SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 110,
                                child: Text("Tambaram valacherry",maxLines: 1, overflow: TextOverflow.ellipsis,style: primaryFont.copyWith(
                                  fontSize: 14
                                ),)),
                        
                              Container(
                                width: 110,
                                  child: Text("Chennai",style: primaryFont.copyWith(
                                    color: Colors.black45,
                                    fontSize: 12
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              Container(
                                width: 110,
                                  child: RichText(
                                    text: TextSpan(text: "22:45 ",style: primaryFont.copyWith(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Fri, 10 Nov",style: primaryFont.copyWith(
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
                        ),
                        Icon(Icons.arrow_right_alt_outlined),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 110,
                              child: Text("Attibele toll plaza",maxLines: 1, overflow: TextOverflow.ellipsis,style: primaryFont.copyWith(
                                fontSize: 14
                              ),)),

                            Container(
                              width: 110,
                                child: Text("bangalore",style: primaryFont.copyWith(
                                  color: Colors.black45,
                                  fontSize: 12
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            Container(
                              width: 110,
                                child: RichText(
                                  text: TextSpan(text: "05:35 ",style: primaryFont.copyWith(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Sat, 11 Nov",style: primaryFont.copyWith(
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
                        )
                      ],
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

                          Text("Send Booking details and Trip updates on Whatsapp",style: primaryFont.copyWith(fontSize: 10),)
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
                                  Text("OYE BUS Assurance Program",style: smalbalckfont.copyWith(
                                    fontSize: 18
                                  ),),
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
                                Text("Upto Rs.75000 in the event of accidental hospitalisation",style: primaryFont.copyWith(
                                  fontSize: 10
                                ),)
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
                  
                                        
                   if(controller.iHaveGstNumber.isTrue)       Padding(
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
                    const  SizedBox(
                    height: 50,
                    )
        ],
      ),
      bottomNavigationBar: Container(
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
    );
  }
}
