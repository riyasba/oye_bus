import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bottumnavigation_controller.dart';

class BottumnavigationView extends GetView<BottumnavigationController> {
  const BottumnavigationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottumnavigationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BottumnavigationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
