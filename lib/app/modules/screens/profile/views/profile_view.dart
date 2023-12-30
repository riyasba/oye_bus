import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/models/profile/profile_update_model.dart';
import 'package:oye_bus/app/modules/screens/profile/views/editprofile_view.dart';
import 'package:oye_bus/app/modules/screens/profile/views/widget/formfield_view.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  
   ProfileView({Key? key}) : super(key: key);

  final profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kwhite,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[300],
         leading: Column(),
            title: Text(
              'ProfileView',
              style: appbarfont,
            ),
            actions: [
              Obx(()=>profileController.isLoading==true?   
               Center(
                         child: CircularProgressIndicator(
                          color: kred,
                         )
                       ):
                 InkWell(
                  onTap: () {
                    Get.to(EditprofileView());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.blue),
                    ),
                  ),
                ),
              )
            ],
            centerTitle: true,
          ),
          body: Center(
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                GetBuilder<ProfileController>(
                  builder: (_) {
                    return  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Image.asset(
                                    "assets/images/fi_2102647.png",
                                  )
                    
                                  //  profileController.isLoading.isTrue
                                  //     ? const Center(
                                  //         child: CircularProgressIndicator(),
                                  //       )
                                  // : profileController
                                  //         .otherUserProfileData.isEmpty
                                  //     ? Container()
                                  //     : ClipRRect(
                                  //         borderRadius:
                                  //             BorderRadius.circular(50),
                                  //         child: profileController
                                  //                     .otherUserProfileData
                                  //                     .first
                                  //                     .user
                                  //                     .profilePicture ==
                                  //                 null
                    
                                  //             ?
                                  //              Image.asset(
                                  //                 "assets/icons/profil_img.jpeg",
                                  //               )
                    
                                  //             : Image.network(
                                  //                 profileController
                                  //                     .otherUserProfileData
                                  //                     .first
                                  //                     .user
                                  //                     .profilePicture,
                                  //               ),
                                  //       ),
                                  ),
                            ),
                          ],
                        ),
                        ksizedbox20,
                     Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: TextField(
                        readOnly: true,
                        controller: profileController.nameController,
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
                        // FormfieldView(
                        //   readOnly: true,
                        //   text: '',
                        //   labeltext: 'Name', 
                        //   controller:profileController.nameController,
                        // ),
                        FormfieldView(
                          readOnly: false,
                          text: '23',
                          labeltext: 'Age', 
                          controller: profileController.ageController,
                        ),
                        FormfieldView(
                          readOnly: false,
                          text: 'Male',
                          labeltext: 'Gender', 
                          controller: profileController.genderController,
                        ),
                         Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: TextField(
                        readOnly: true,
                        controller: profileController.mobileController,
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
                                 labelText: 'Mobile Number', // Changed label text
                                 labelStyle: TextStyle(
                                     color: kblack, fontSize: 18.0, fontWeight: FontWeight.w600),
                                 // Text style for the label
                               ),
                       ),
                     ),
                          Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: TextField(
                        readOnly: true,
                        controller: profileController.emailController,
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
                                 labelText: 'Email', // Changed label text
                                 labelStyle: TextStyle(
                                     color: kblack, fontSize: 18.0, fontWeight: FontWeight.w600),
                                 // Text style for the label
                               ),
                       ),
                     ),
                      ],
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
