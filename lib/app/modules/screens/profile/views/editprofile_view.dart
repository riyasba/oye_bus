import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/components/custom_button.dart';
import 'package:oye_bus/app/data/api_service/models/profile/profile_update_model.dart';
import 'package:oye_bus/app/modules/screens/profile/controllers/profile_controller.dart';
import 'package:oye_bus/app/modules/screens/profile/views/widget/formfield_view.dart';
import 'package:oye_bus/app/routes/app_pages.dart';

class EditprofileView extends GetView {
  
   EditprofileView({Key? key,}) : super(key: key);
  final profileController = Get.find<ProfileController>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var ageController = TextEditingController();
  var genderController = TextEditingController();


  getprofileData() async{
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      if(nameController.text.isEmpty){

       await profileController.getprofile();

       if(profileController.profiledata.isNotEmpty){
      nameController.text = profileController.profiledata.first.name;
      emailController.text = profileController.profiledata.first.email;
      mobileController.text = profileController.profiledata.first.mobile;
      ageController.text = profileController.profiledata.first.age.toString();
      genderController.text = profileController.profiledata.first.gender;

      
      
       }
      

    }
    });
  }

  @override
  Widget build(BuildContext context) {
    getprofileData();
    return Container(color: kwhite,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kwhite,
          appBar: AppBar(
            backgroundColor: Colors.grey[300],
            leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back)),
            title: Text(
              'ProfileView',
              style: appbarfont,
            ),
            centerTitle: true,
          ),
          body: Center(
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                GetBuilder<ProfileController>(
                  builder: (_) {
                    return Column(
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
                                ),
                        
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
                     SizedBox(
                      height: 7,
                     ),
                          Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Container(
                        height: 54,
                         child: TextField(
                        
                          controller: ageController,
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
                     ),
                     SizedBox(
                      height: 7,
                     ),
                           Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Container(
                        height: 54,
                         child: TextField(
                        
                          controller: genderController,
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
                                   labelText: 'Gender', // Changed label text
                                   labelStyle: TextStyle(
                                       color: kblack, fontSize: 18.0, fontWeight: FontWeight.w600),
                                   // Text style for the label
                                 ),
                         ),
                       ),
                     ),
                     SizedBox(
                      height: 7,
                     ),
                            Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Container(
                        height: 54,
                         child: TextField(
                        
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
                      height: 7,
                     ),
                            Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Container(
                        height: 54,
                         child: TextField(
                          
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
                ksizedbox40,
                ksizedbox40,
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h, left: 8, right: 8),
                  child: CustomElevatedButton(
                    height: 45.h,
                    width: 1.sw,
                    onPressed: () {
                      ProfileUpdateModel profileUpdateModel =
                    ProfileUpdateModel( 
                    email: emailController.text,  
                    mobilenumber: mobileController.text, 
                    name: nameController.text,
                     age: ageController.text, 
                     gender: genderController.text);
                    profileController.updateprofile(profileUpdateModel: profileUpdateModel);
                    profileController.isEdited(true);
                    profileController.update();
                    // Get.back();
                    },
                    text: 'DONE',
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
                      Get.toNamed(
                        Routes.LOGIN,
                      );
                    },
                    text: 'Cancel',
                    color: kwhite,
                    textColor: kred,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
