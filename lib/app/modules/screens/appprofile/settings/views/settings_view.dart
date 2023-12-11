import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/components/custom_button.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({Key? key}) : super(key: key);

  String dropdowncountry = 'Canada';
  String dropdowncurrency = 'INR';
  String dropdownlanguage = 'Hindi';
  String dropdownAccount = 'Delete your account';
  List<String> logos = [
    'assets/images/Ellipse 1 (2).png',
    'assets/images/Ellipse 3 (1).png',
    'assets/images/Ellipse 5.png',
    'assets/images/Ellipse 7.png',
  ];
  List<String> contries = [
    'India',
    'England',
    'United States',
    'Canada',
  ];

  back(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.white,
          title: Column(
            children: [],
          ),
          content: const Text(
            "Are you sure want to delete your account?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 40,
                    width: 100,
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
                    height: 40,
                    width: 100,
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
    return Container(
      color: kwhite,
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
                          child: controller.isontouch.isTrue
                              ? Container(
                                  height: 50,
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
                                      Text(
                                        'India',
                                        style: TextStyle(fontSize: 16),
                                      ),
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
                                          Text(
                                            'India',
                                            style: TextStyle(fontSize: 16),
                                          ),
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

                                          ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: logos.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(logos[index]),
                                                  SizedBox(width: 8),
                                                  Text(
                                                    contries[index],
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                              Obx(() {
                                                return Radio<int?>(
                                                  value:
                                                      controller.selectedIndex,
                                                  groupValue: index,
                                                  onChanged:
                                                      (int? currentIndex) {
                                                    if (currentIndex != null) {
                                                      controller.setIndex(
                                                          currentIndex);
                                                    }
                                                  },
                                                );
                                              }),
                                            ],
                                          );
                                        },
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
                              'Country',
                              style: smalbalckfont,
                            )
                          ],
                        ),
                        ksizedbox10,
                        Container(
                          height: 44,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: Colors.black54)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                icon: const Icon(
                                    Icons.keyboard_arrow_down_outlined),
                                elevation: 1,
                                itemHeight: 55,
                                isDense: true,
                                dropdownColor: Colors.white,
                                style: const TextStyle(color: Colors.black54),
                                value: dropdowncountry,
                                onChanged: (String? newValue) {
                                  // When the value changes, update the dropdownValue
                                  //      if (newValue != null) {
                                  // Ensure newValue is not null before updating
                                  // This function will be called when an item is selected
                                  // setState(() {
                                  //   dropdownValue = newValue;
                                  // });
//}
                                },
                                items: <String>[
                                  'India',
                                  'USA',
                                  'UK',
                                  'Canada',
                                ] // Your dropdown items
                                    .map<DropdownMenuItem<String>>(
                                        (String value1) {
                                  return DropdownMenuItem<String>(
                                    value: value1,
                                    child: Text(value1),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
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
                        Container(
                          height: 44,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: Colors.black54)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                icon: const Icon(
                                    Icons.keyboard_arrow_down_outlined),
                                elevation: 1,
                                itemHeight: 55,
                                isDense: true,
                                dropdownColor: Colors.white,
                                style: const TextStyle(color: Colors.black54),
                                value: dropdowncurrency,
                                onChanged: (String? newValue) {
                                  // When the value changes, update the dropdownValue
                                  //    if (newValue != null) {
                                  // Ensure newValue is not null before updating
                                  // This function will be called when an item is selected
                                  // setState(() {
                                  //   dropdownValue = newValue;
                                  // });
                                  //   }
                                },
                                items: <String>[
                                  'Crypto',
                                  'INR',
                                ] // Your dropdown items
                                    .map<DropdownMenuItem<String>>(
                                        (String value2) {
                                  return DropdownMenuItem<String>(
                                    value: value2,
                                    child: Text(value2),
                                  );
                                }).toList(),
                              ),
                            ),
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
                        Container(
                          height: 44,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: Colors.black54)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                icon: const Icon(
                                    Icons.keyboard_arrow_down_outlined),
                                elevation: 1,
                                itemHeight: 55,
                                isDense: true,
                                dropdownColor: Colors.white,
                                style: const TextStyle(color: Colors.black54),
                                value: dropdownlanguage,
                                onChanged: (String? newValue) {
                                  // When the value changes, update the dropdownValue
                                  // if (newValue != null) {
                                  // Ensure newValue is not null before updating
                                  // This function will be called when an item is selected
                                  // setState(() {
                                  //   dropdownValue = newValue;
                                  // });
                                  //   }
                                },
                                items: <String>[
                                  'Lang1uage',
                                  'Hindi',
                                  'Telugu',
                                  'Urdu',
                                ] // Your dropdown items
                                    .map<DropdownMenuItem<String>>(
                                        (String value3) {
                                  return DropdownMenuItem<String>(
                                    value: value3,
                                    child: Text(value3),
                                  );
                                }).toList(),
                              ),
                            ),
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
                        ksizedbox10,
                        Container(
                          height: 44,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: Colors.black54)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                icon: const Icon(
                                    Icons.keyboard_arrow_down_outlined),
                                elevation: 1,
                                itemHeight: 55,
                                isDense: true,
                                dropdownColor: Colors.white,
                                style: const TextStyle(color: Colors.black54),
                                value: dropdownAccount,
                                onChanged: (String? newValue) {
                                  // When the value changes, update the dropdownValue
                                  //  if (newValue != null) {
                                  // Ensure newValue is not null before updating
                                  // This function will be called when an item is selected
                                  // setState(() {
                                  //   dropdownValue = newValue;
                                  // });
                                  //     }
                                },
                                items: <String>[
                                  "Delete your account",
                                  "This action will permanently delete your account and booking history information.",
                                  "You can log in any time in the next 90 days to cancel the deletion of your account."
                                ] // Your dropdown items
                                    .map<DropdownMenuItem<String>>(
                                        (String value4) {
                                  return DropdownMenuItem<String>(
                                    value: value4,
                                    child: Text(value4),
                                  );
                                }).toList(),
                              ),
                            ),
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
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: 10.h, left: 8, right: 8),
                          child: CustomElevatedButton(
                            height: 45.h,
                            width: 1.sw,
                            onPressed: () {
                              // Get.toNamed(
                              //   Routes.LOGIN,
                              // );
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
