import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';

import '../controllers/helpfaq_controller.dart';

class HelpfaqView extends GetView<HelpfaqController> {
   HelpfaqView({Key? key}) : super(key: key);

  final faqsController = Get.find<HelpfaqController>();
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
              'Help & FAQs',
              style: appbarfont,
            ),
            centerTitle: true,
          ),
          body: ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Column(
                children: [
               
                  GetBuilder<HelpfaqController>(
                    builder: (_) {
                      return Container(
                        height: 400,
                        child: ListView.builder(
                          itemCount: faqsController.faqsdata.length,
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                            return ExpansionTileGroup(children: [
                             ExpansionTileWithoutBorderItem(
                              title: Text(faqsController.faqsdata[index].title),
                              expendedBorderColor: Colors.grey,
                              children: [
                                Text(
                                faqsController.faqsdata[index].description),
                              ],
                            ),
                          ]);
                          },
                          
                        ),
                      );
                    }
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

