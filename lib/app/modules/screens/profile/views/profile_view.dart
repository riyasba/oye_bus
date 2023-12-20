import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                    ProfileUpdateModel profileUpdateModel =
                    ProfileUpdateModel( 
                    email: profileController.emailController.text,  
                    mobilenumber: profileController.mobileController.text, 
                    name: profileController.nameController.text);
                    Get.to(EditprofileView(profileUpdateModel: profileUpdateModel,));
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
                  builder: (context) {
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
                        FormfieldView(
                          text: '',
                          labeltext: 'Name', 
                          controller:profileController.nameController,
                        ),
                        FormfieldView(
                          text: '23',
                          labeltext: 'Age', 
                          controller: profileController.ageController,
                        ),
                        FormfieldView(
                          text: 'Male',
                          labeltext: 'Gender', 
                          controller: profileController.genderController,
                        ),
                        FormfieldView(
                          text: '',
                          labeltext: 'Mobile Number', 
                          controller: profileController.mobileController,
                        ),
                        FormfieldView(
                          text:'',
                          labeltext: 'Email ID', 
                          controller: profileController.emailController,
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
