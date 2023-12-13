import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/modules/bustracking/views/widget/map.dart';

import '../controllers/bustracking_controller.dart';

class BustrackingView extends GetView<BustrackingController> {
  const BustrackingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MapSample();
  }
}
