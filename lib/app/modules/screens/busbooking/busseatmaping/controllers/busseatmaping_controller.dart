import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/paymentsuccesfull_view.dart';
import 'package:oye_bus/app/services/ease_buzz_payment_api_services.dart';

class BusseatmapingController extends GetxController {

  RxBool isLoading = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  RxInt current = 0.obs;
  RxInt currentbording = 1.obs;

  int get index1 => current.value;
 // int get index3 => currentbording.value;

  void setIndex(int currentIndex) {
    current(currentIndex);
  }

  void dropingIndex(int currentbordingindex) {
    currentbording(currentbordingindex);
  }
List<bool> seats = List.generate(30, (_) => false);

   void seatSelection(int index) {
    seats[index] = !seats[index];
    // Perform other operations related to seat selection here
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;


   String? mobilenumber;
   String?email;
   String?amount;
   String?name;

   static MethodChannel _channel = MethodChannel('easebuzz');
  EaseBuzzTokenApiService easeBuzzApi = EaseBuzzTokenApiService();

  payUseingEaseBuzzSubs(
      {required String mobilenumber,
      required String email,
      required String amount,
      required String name,
      }) async {
        print('mobile number');
      print(mobilenumber);
      print('emailid');
      print(email);
      print('amount');
      print(amount);
      print('name');
      print(name);

    var response = await easeBuzzApi.getPaymentToken(
        amount: amount,
        email: email,
        phone: mobilenumber,
        name: name,);


        print('::::::transaction easebusz id:::::::::');
        print(response['data']);

    String access_key = response["data"];
    String pay_mode = "test";

    print("access_key >>$access_key");
    Object parameters = {"access_key": access_key, "pay_mode": pay_mode};
    // isPayLoading(false);
    isLoading(false);
    final payment_response =
        await _channel.invokeMethod("payWithEasebuzz", parameters);
    print(payment_response);
    isLoading(false);
    if (payment_response["result"] == "payment_successfull") {
      //need to give id
      String transactionId = "";
      
      Get.to(() => PaymentsuccesfullView());
    } else {
      //Get.to(PaymentFailedScreen());
      Get.snackbar(
          "The last transaction has been cancelled!", "Please try again!",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
