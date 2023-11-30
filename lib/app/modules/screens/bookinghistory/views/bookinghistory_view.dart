import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bookinghistory_controller.dart';

class BookinghistoryView extends GetView<BookinghistoryController> {
  const BookinghistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookinghistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BookinghistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
