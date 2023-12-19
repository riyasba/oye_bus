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
    ProfileUpdateModel profileUpdateModel;
   EditprofileView({Key? key,required this.profileUpdateModel}) : super(key: key);
  final profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
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
                  builder: (context) {
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
                        FormfieldView(
                          text: '',
                          labeltext: 'Name', 
                          controller: profileController.nameController,
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
                          text:'',
                          labeltext: 'Mobile Number', 
                          controller: profileController.mobileController,
                        ),
                        FormfieldView(
                          text: '',
                          labeltext: 'Email ID', 
                          controller: profileController.emailController,
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
                      Get.toNamed(
                        Routes.REGISTER,
                      );
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
