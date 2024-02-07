import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/bording_droping/boarding_view.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/bording_droping/droping_view.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/listviewwidget_view.dart';

class DropingselectionView extends GetView {
  const DropingselectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DroppingListView();
  }
}
