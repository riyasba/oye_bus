import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/components/custom_button.dart';
import 'package:oye_bus/app/data/api_service/models/settings_models/country_models.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({Key? key}) : super(key: key);

  String dropdowncountry = 'Canada';
  String dropdowncurrency = 'INR';
  String dropdownlanguage = 'Hindi';
  String dropdownAccount = 'Delete your account';
  
  final ValueNotifier<String> selectedOption = ValueNotifier<String>('');
   final ValueNotifier<String> currencyOption = ValueNotifier<String>('');
   final ValueNotifier<String> languageOption = ValueNotifier<String>('');
  final settingController = Get.find<SettingsController>();
  var itemSelected;
  back(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: Colors.white,
          title: Column(
            children: [],
          ),
          content: Text("Are you sure want to delete your account?",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 40.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                        child: Text("NO",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500))),
                  ),
                ),
                InkWell(
                  child: Container(
                    height: 40.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: kred, borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: Text(
                        "YES",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kwhite),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ksizedbox10
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return Container(
      color: kwhite,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kwhite,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.grey[300],
            leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: kblack,
                )),
            title: Text(
              'Settings',
              style: appbarfont,
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: ListView(
                children: [
                  GetBuilder<SettingsController>(builder: (_) {
                    return Column(
                      children: [
                        ksizedbox30,
                        Row(
                          children: [
                            Text(
                              'Country',
                              style: smalbalckfont,
                            )
                          ],
                        ),
                        ksizedbox20,
                        InkWell(
                          onTap: () {
                            if (controller.isontouch.isTrue) {
                              (controller.isontouch(false));
                            } else {
                              controller.isontouch(true);
                            }
                            controller.update();
                          },
                          child: DropdownSearch<CountryData>(
        items: controller.countydata,
        popupProps: PopupProps.menu(
          showSearchBox: true,
          itemBuilder: (context,data,val){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(data.countries,
                         
                 style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)
              ),
            );

          }
        ),
        dropdownButtonProps: DropdownButtonProps(color:kblack,
        padding: EdgeInsets.only(top: 10,left: 10)),
        
        dropdownDecoratorProps: DropDownDecoratorProps(
          
          textAlignVertical: TextAlignVertical.center,
          dropdownSearchDecoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: kblack,width: 2),
            borderRadius: BorderRadius.circular(5.0),
          )),
        ),
        onChanged: (value) {
         
            itemSelected = value;
      
        },
        selectedItem: itemSelected,
        itemAsString: (data)=> data.countries,
      ),
//                           child: controller.isontouch.isTrue
//                               ? Container(
//                                   height: 50,
//                                   decoration: BoxDecoration(
//                                     border:
//                                         Border.all(color: kblack, width: 1.0),
//                                     borderRadius: BorderRadius.circular(5.0),
//                                   ),
//                                   padding: EdgeInsets.all(12.0),
//                                   child: Row(
//                                     mainAxisAlignment: 
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(selectedOption.value,
//                                           style: GoogleFonts.montserrat(
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w500,
//                                               color: Colors.black)),
//                                       Icon(Icons.arrow_drop_down_outlined)
//                                     ],
//                                   ),
//                                 )
//                               : Column(
//                                   children: [
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color: kblack, width: 1.0),
//                                         borderRadius:
//                                             BorderRadius.circular(5.0),
//                                       ),
//                                       padding: EdgeInsets.all(12.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(selectedOption.value,
//                                               style: GoogleFonts.montserrat(
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.w500,
//                                                   color: Colors.black)),
//                                           Icon(Icons.arrow_drop_up_outlined)
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 2,
//                                     ),
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color: kblack, width: 1.0),
//                                         borderRadius:
//                                             BorderRadius.circular(5.0),
//                                       ),
//                                       padding: EdgeInsets.all(12.0),
//                                       child: // Inside your build method in SettingsView

// // ...

//                                          GetBuilder<SettingsController>(
//                                             builder: (_) {
//                                               return ListView.builder(
//                                                                                       shrinkWrap: true,
//                                                                                       physics: NeverScrollableScrollPhysics(),
//                                                                                       itemCount: settingController.countydata.length,
//                                                                                       itemBuilder: (context, index) {
//                                               return Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.spaceBetween,
//                                                 children: [
//                                                   Row(
//                                                     children: [
                                                    
//                                                       SizedBox(width: 8),
//                                                       Text(
//                                                         settingController.countydata[index].countries,
//                                                         style:
//                                                             TextStyle(fontSize: 16),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   Container(
//                                                     width: 50,
//                                                     height: 50,
//                                                     child: ValueListenableBuilder(
//                                                       valueListenable:
//                                                           selectedOption,
//                                                       builder: (context, value, _) {
//                                                         return Radio(
//                                                           value: settingController.countydata[index].countries,
//                                                           groupValue: value,
//                                                           onChanged: ( newValue) {
//                                                             selectedOption.value =
//                                                                 newValue.toString();
//                                                           },
//                                                         );
//                                                       },
//                                                     ),
//                                                   ),
//                                                 ],
//                                               );
//                                                                                       },
//                                                                                     );
//                                             }
//                                           ),

// // ...
//                                     ),
//                                   ],
//                                 ),
                        ),
                        ksizedbox30,
                        Row(
                          children: [
                            Text(
                              'Currency',
                              style: smalbalckfont,
                            )
                          ],
                        ),
                        ksizedbox10,
                        InkWell(
                          onTap: () {
                            if (controller.isontouchcurrency.isTrue) {
                              (controller.isontouchcurrency(false));
                            } else {
                              controller.isontouchcurrency(true);
                            }
                            controller.update();
                          },
                          child: controller.isontouchcurrency.isTrue
                              ? Container(
                                  height: 57,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: kblack, width: 1.0),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  padding: EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(currencyOption.value,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)),
                                      Icon(Icons.arrow_drop_down_outlined)
                                    ],
                                  ),
                                )
                              : Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: kblack, width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      padding: EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('INR',
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black)),
                                          Icon(Icons.arrow_drop_up_outlined)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: kblack, width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      padding: EdgeInsets.all(12.0),
                                      child: // Inside your build method in SettingsView

// ...

                                          GetBuilder<SettingsController>(
                                            builder: (_) {
                                              return ListView.builder(
                                                   shrinkWrap: true,
                                                    physics: NeverScrollableScrollPhysics(),
                                                     itemCount: settingController.currencydata.length,
                                                      itemBuilder: (context, index) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    settingController.currencydata[index].currency,
                                                    style: TextStyle(fontSize: 16),
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    child: ValueListenableBuilder(
                                                      valueListenable:
                                                          currencyOption,
                                                      builder: (context, value, _) {
                                                        return Radio(
                                                          value: settingController.currencydata[index].currency,
                                                          groupValue: value,
                                                          onChanged: (newValue) {
                                                            currencyOption.value =
                                                                newValue!;
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              );
                                                                                      },
                                                                                    );
                                            }
                                          ),

// ...
                                    ),
                                  ],
                                ),
                        ),
                        ksizedbox30,
                        Row(
                          children: [
                            Text(
                              'Language',
                              style: smalbalckfont,
                            )
                          ],
                        ),
                        ksizedbox10,
                        //
                        InkWell(
                          onTap: () {
                            if (controller.islanguage.isTrue) {
                              (controller.islanguage(false));
                            } else {
                              controller.islanguage(true);
                            }
                            controller.update();
                          },
                          child: controller.islanguage.isTrue
                              ? Container(
                                  height: 57,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: kblack, width: 1.0),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  padding: EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(languageOption.value,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)),
                                      Icon(Icons.arrow_drop_down_outlined)
                                    ],
                                  ),
                                )
                              : Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: kblack, width: 1.0.w),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      padding: EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Hindi',
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black)),
                                          Icon(Icons.arrow_drop_up_outlined)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: kblack, width: 1.0.w),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      padding: EdgeInsets.all(12.0),
                                      child: // Inside your build method in SettingsView

// ...

                                          GetBuilder<SettingsController>(
                                            builder: (_) {
                                              return ListView.builder(
                                              shrinkWrap: true,
                                              physics: NeverScrollableScrollPhysics(),
                                              itemCount: settingController.languagedata.length,
                                               itemBuilder: (context, index) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    settingController.languagedata[index].languages,
                                                    style: TextStyle(fontSize: 16.sp),
                                                  ),
                                                  Container(
                                                    width: 50.w,
                                                    height: 50.h,
                                                    child: ValueListenableBuilder(
                                                      valueListenable:
                                                          languageOption,
                                                      builder: (context, value, _) {
                                                        return Radio(
                                                          value: settingController.languagedata[index].languages,
                                                          groupValue: value,
                                                          onChanged: (newValue) {
                                                            languageOption.value =
                                                                newValue!;
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              );
                                                                                      },
                                                                                    );
                                            }
                                          ),

// ...
                                    ),
                                  ],
                                ),
                        ),
                        ksizedbox30,
                        Row(
                          children: [
                            Text(
                              'Account Settings',
                              style: smalbalckfont,
                            )
                          ],
                        ),
                        //
                        ksizedbox10,
                        InkWell(
                          onTap: () {
                            if (controller.isdeletacount.isTrue) {
                              (controller.isdeletacount(false));
                            } else {
                              controller.isdeletacount(true);
                            }
                            controller.update();
                          },
                          child: controller.isdeletacount.isTrue
                              ? Container(
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: kblack, width: 1.0),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  padding: EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Delete your account',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)),
                                      Icon(Icons.arrow_drop_down_outlined)
                                    ],
                                  ),
                                )
                              : Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: kblack, width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      padding: EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Delete your account',
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black)),
                                          Icon(Icons.arrow_drop_up_outlined)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: kblack, width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        padding: EdgeInsets.all(12.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              'This action will permanently delete your account and booking history information.',
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            ksizedbox10,
                                            Text(
                                                'You can log in any time in the next 90 days to cancel the deletion of your account.',
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black)),
                                            Container(
                                              height: 106.h,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius: BorderRadius.circular(
                                                    15), // half of the height for a circular shape
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Column(
                                                  children: [
                                                    ksizedbox10,
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Feedback ',
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  fontSize:
                                                                      15.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color:
                                                                      kblack),
                                                        ),
                                                        Text('(optional)')
                                                      ],
                                                    ),
                                                    TextField(
                                                      decoration: InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintText:
                                                              'Share your thoughts here',
                                                          hintStyle: GoogleFonts
                                                              .montserrat(
                                                                  fontSize: 16.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      kgrey)),
                                                    ),
                                                    ksizedbox40,
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ) // Inside your build method in SettingsView

// ...

// ...
                                        ),
                                  ],
                                ),
                        ),
                        ksizedbox30,
                        ksizedbox30,
                        ksizedbox30,
                        ksizedbox30,
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: 10.h, left: 8, right: 8),
                          child: CustomElevatedButton(
                            height: 45.h,
                            width: 1.sw,
                            onPressed: () {
                              back(context);
                              // Get.toNamed(
                              //   Routes.REGISTER,
                              // );
                            },
                            text: 'Keep my account with oyeNus',
                             
                            color: kred,
                            textColor: kwhite,
                          ),
                        ),
                        controller.isLoading.isTrue?
                         Container(
                      child:  Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      ))):
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: 10.h, left: 8, right: 8),
                          child: CustomElevatedButton(
                            height: 45.h,
                            width: 1.sw,
                            onPressed: () {
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
                                           settingController.deleteAccount();
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
                            text: 'Delete my account',
                            color: kwhite,
                            textColor: kred,
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
