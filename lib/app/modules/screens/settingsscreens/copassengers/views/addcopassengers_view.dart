import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/components/custom_button.dart';
import 'package:oye_bus/app/data/api_service/models/passengers/add_copassengers_model.dart';
import 'package:oye_bus/app/modules/screens/profile/views/widget/formfield_view.dart';
import 'package:oye_bus/app/modules/screens/settingsscreens/copassengers/controllers/copassengers_controller.dart';

class AddcopassengersView extends GetView<CopassengersController> {
   AddcopassengersView({Key? key,}) : super(key: key);
 final  passengerController  = Get.find<CopassengersController>();
 final ValueNotifier<String> languageOption = ValueNotifier<String>('');
  String dropdownvalue='';  
 bool textvalue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kwhite,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[300],
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back),
            ),
            title: Text(
              'Add Co-Passengers',
              style: appbarfont,
            ),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              Center(
                child: GetBuilder<CopassengersController>(
                  builder: (_) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ksizedbox20,
                        Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: TextField(
                        keyboardType: TextInputType.name,
                        controller: passengerController.nameController,
                              autofocus: true,
                               decoration: InputDecoration(
                                 focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide:
                                       BorderSide(color: kblack, width: 2.0), // Border when focused
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide(
                                       color: kblack, width: 2.0), // Border when not focused
                                 ),
                                
                                 hintStyle: TextStyle(fontWeight: FontWeight.w300, color: kgrey),
                                 labelText: 'Name', // Changed label text
                                 labelStyle: TextStyle(
                                     color: kblack, fontSize: 18.0, fontWeight: FontWeight.w600),
                                 // Text style for the label
                               ),
                       ),
                     ),
                          Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: TextField(
                        keyboardType: TextInputType.number,
                       
                        controller: passengerController.ageController,
                              autofocus: true,
                               decoration: InputDecoration(
                                 focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide:
                                       BorderSide(color: kblack, width: 2.0), // Border when focused
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10),
                                   borderSide: BorderSide(
                                       color: kblack, width: 2.0), // Border when not focused
                                 ),
                                
                                 hintStyle: TextStyle(fontWeight: FontWeight.w300, color: kgrey),
                                 labelText: 'Age', // Changed label text
                                 labelStyle: TextStyle(
                                     color: kblack, fontSize: 18.0, fontWeight: FontWeight.w600),
                                 // Text style for the label
                               ),
                       ),
                     ),
                        // FormfieldView(
                        //   text: '',
                        //   labeltext: 'Age', 
                        //   controller: passengerController.ageController, 
                        //   readOnly: true,
                        // ),
                        
                         GetBuilder<CopassengersController>(
                           builder: (_) {
                             return Padding(
                               padding: const EdgeInsets.all(10.0),
                               child: Container(
                                height: 59,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: kblack,
                                    width: 2.2
                                  )
                                ),
                             
                                 child: Padding(
                                   padding: const EdgeInsets.only(top: 15,right: 10,left: 10),
                                   child: DropdownButton<String>(
                                                                     
                                     isDense: true,
                                     itemHeight: 80.0,
                                                              isExpanded: true,
                                               value: controller.chosenValue,
                                               //elevation: 5,
                                               style: TextStyle(color: Colors.black),
                                                 
                                                
                                               items: <String>[
                                                 'Male',
                                                 'Female',
                                                 
                                               ].map<DropdownMenuItem<String>>((String value) {
                                                 return DropdownMenuItem<String>(
                                                   value: value,
                                                   child: Text(value,
                                                   style: TextStyle(
                                                    color: Colors.black,
                                                     fontSize: 16,
                                                     fontWeight: FontWeight.w500
                                                   ),
                                                   ),
                                                 );
                                               }).toList(),
                                               hint: Text(
                                                 "Gender",
                                                 style: TextStyle(
                                                     color: Colors.black,
                                                     fontSize: 16,
                                                     fontWeight: FontWeight.w600),
                                               ),
                                               onChanged: (String ?value) {
                                               
                                                   controller.chosenValue = value;
                                   
                                                     controller.update();
                                               },
                                             ),
                                 ),
                               ),
                             );
                           }
                         ),
      
               
                          
                        ksizedbox40,
                        ksizedbox40,
                        ksizedbox40,
                        controller.isLoading.isTrue?
                        Container(
                      child:  Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      )),
                      //      width: double.infinity, 
                      height: 55,
                      color: korange,
                    ):
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.h, left: 8, right: 8),
                          child: CustomElevatedButton(
                            height: 45.h,
                            width: 1.sw,
                            onPressed: () {
                             AddCoPassangersModel addCoPassangersModel = 
                                  AddCoPassangersModel(
                                    age: passengerController.ageController.text, 
                                    gender: controller.chosenValue, 
                                    name: passengerController.nameController.text);
                                    if (passengerController.isLoading.isFalse) {
                                      passengerController.addCopassangers(addCoPassangersModel: addCoPassangersModel);
                                   passengerController.update();
                               Get.back();
                                    }else{
                                       Get.rawSnackbar(
                                  backgroundColor: Colors.red,
                                  messageText: Text(
                                    "Please Enter Passengers Details",
                                    style:
                                        primaryFont.copyWith(color: Colors.white),
                                  ),
                                );
                                    }
                                    
                            },
                            text: 'SAVE', 
                            color: kred,
                            textColor: kwhite,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.h, left: 8, right: 8),
                          child: CustomElevatedButton(
                            height: 45.h,
                            width: 1.sw,
                            onPressed: () {
                            Get.back();
                            },
                            text: 'Cancel',
                            color: kwhite,
                            textColor: kred,
                          ),
                        ),
                      ],
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
