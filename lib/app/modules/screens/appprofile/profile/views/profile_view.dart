import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/appprofile/profile/views/editprofile_view.dart';
import 'package:oye_bus/app/modules/screens/appprofile/profile/views/widget/formfield_view.dart';
import 'package:oye_bus/app/modules/screens/bottumnavigation/views/bottumnavigation_view.dart';
import '../controllers/profile_controller.dart';





class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kwhite,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[300],
         
            title: Text(
              'ProfileView',
              style: appbarfont,
            ),
            actions: [
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
              )
            ],
            centerTitle: true,
          ),
          body: Center(
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                Column(
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
                      text: 'Riyas',
                      labeltext: 'Name',
                    ),
                    FormfieldView(
                      text: '23',
                      labeltext: 'Age',
                    ),
                    FormfieldView(
                      text: 'Male',
                      labeltext: 'Gender',
                    ),
                    FormfieldView(
                      text: '9633749714',
                      labeltext: 'Mobile Number',
                    ),
                    FormfieldView(
                      text: 'riyasklb89@gmail.com',
                      labeltext: 'Email ID',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
