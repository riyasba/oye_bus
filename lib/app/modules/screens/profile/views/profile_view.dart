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


  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var ageController = TextEditingController();
  var genderController = TextEditingController();


  getprofileData() async{
    if(nameController.text.isEmpty || profileController.isEdited.isTrue){

       await profileController.getprofile();

       if(profileController.profiledata.isNotEmpty){
      nameController.text = profileController.profiledata.first.name;
      emailController.text = profileController.profiledata.first.email;
      mobileController.text = profileController.profiledata.first.mobile;
      emailController.text = profileController.profiledata.first.email;
      profileController.isEdited(false);
       }
        

    }
  }


  getprofileDataRefresh() async{
    await profileController.getprofile();

       if(profileController.profiledata.isNotEmpty){
      nameController.text = profileController.profiledata.first.name;
      emailController.text = profileController.profiledata.first.email;
      mobileController.text = profileController.profiledata.first.mobile;
      emailController.text = profileController.profiledata.first.email;
      profileController.isEdited(false);
       }
  }



  @override
  Widget build(BuildContext context) {
     getprofileData();
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
                              padding: const EdgeInsets.only(top: 0),
                              child: Container(
                                  height: 90,
                                  width: 90,
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
                       child: Container(
                        height: 54,
                         child: TextField(
                          readOnly: true,
                          controller: nameController,
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
                     ),
                        // FormfieldView(
                        //   readOnly: true,
                        //   text: '',
                        //   labeltext: 'Name', 
                        //   controller:profileController.nameController,
                        // ),
                        
                    //     SizedBox(
                    //       height: 10,
                    //     ),
                    //    Padding(
                    //    padding: const EdgeInsets.all(10.0),
                    //    child: Container(
                    //     height: 54,
                    //      child: TextField(
                    //       readOnly: true,
                    //       controller: ageController,
                    //             autofocus: true,
                    //              decoration: InputDecoration(
                    //                focusedBorder: OutlineInputBorder(
                    //                  borderRadius: BorderRadius.circular(10),
                    //                  borderSide:
                    //                      BorderSide(color: kblack, width: 2.0), // Border when focused
                    //                ),
                    //                enabledBorder: OutlineInputBorder(
                    //                  borderRadius: BorderRadius.circular(10),
                    //                  borderSide: BorderSide(
                    //                      color: kblack, width: 2.0), // Border when not focused
                    //                ),
                                  
                    //                hintStyle: TextStyle(fontWeight: FontWeight.w300, color: kgrey),
                    //                labelText: 'Age', // Changed label text
                    //                labelStyle: TextStyle(
                    //                    color: kblack, fontSize: 18.0, fontWeight: FontWeight.w600),
                    //                // Text style for the label
                    //              ),
                    //      ),
                    //    ),
                    //  ),
                    //  SizedBox(
                    //       height: 10,
                    //     ),
                    //     Padding(
                    //    padding: const EdgeInsets.all(10.0),
                    //    child: Container(
                    //     height: 54,
                        
                    //      child: TextField(
                    //       readOnly: true,
                    //       controller:genderController,
                    //             autofocus: true,
                    //              decoration: InputDecoration(
                    //                focusedBorder: OutlineInputBorder(
                    //                  borderRadius: BorderRadius.circular(10),
                    //                  borderSide:
                    //                      BorderSide(color: kblack, width: 2.0), // Border when focused
                    //                ),
                    //                enabledBorder: OutlineInputBorder(
                    //                  borderRadius: BorderRadius.circular(10),
                    //                  borderSide: BorderSide(
                    //                      color: kblack, width: 2.0), // Border when not focused
                    //                ),
                                  
                    //                hintStyle: TextStyle(fontWeight: FontWeight.w300, color: kgrey),
                    //                labelText: 'Gender', // Changed label text
                    //                labelStyle: TextStyle(
                    //                    color: kblack, fontSize: 18.0, fontWeight: FontWeight.w600),
                    //                // Text style for the label
                    //              ),
                    //      ),
                    //    ),
                    //  ),
                     SizedBox(
                          height: 10,
                        ),
                         Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Container(
                        height: 53,
                         child: TextField(
                          readOnly: true,
                          controller: mobileController,
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
                     ), 
                     SizedBox(
                          height: 10,
                        ),
                          Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Container(
                        height: 54,
                         child: TextField(
                          readOnly: true,
                          controller: emailController,
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
