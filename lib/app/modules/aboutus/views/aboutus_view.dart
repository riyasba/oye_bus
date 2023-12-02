import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/aboutus_controller.dart';

class AboutusView extends GetView<AboutusController> {
  const AboutusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AboutusView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AboutusView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
