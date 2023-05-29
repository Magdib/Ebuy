import 'package:ebuy/core/function/Ui%20Functions/SnackBars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class PaymentController extends GetxController {
  void changeExpiryMonth(int val);
  void changeExpiryYear(int val);
  void saveExpiryTime();
  resetExpiryTime();
}

class PaymentControllerimp extends PaymentController {
  late TextEditingController cardNumberController;
  late TextEditingController cardNameController;
  int selectedMonth = 1;
  int selectedYear = 2023;
  String? expryDate;
  @override
  void changeExpiryMonth(int val) {
    selectedMonth = val + 1;

    update();
  }

  @override
  void changeExpiryYear(int val) {
    selectedYear = val + DateTime.now().year;
    update();
  }

  @override
  void saveExpiryTime() {
    DateTime tempExpryDate = DateTime(selectedYear, selectedMonth);
    if (tempExpryDate.month < DateTime.now().month) {
      errorSnackBar('Wrong Date',
          'The expiry date is invalid please enter valid date and try again');
    } else {
      expryDate = DateTime(selectedYear, selectedMonth)
          .toString()
          .replaceRange(7, null, '');
      Get.back();
      update();
    }
  }

  @override
  resetExpiryTime() {
    selectedMonth = 1;
    selectedYear = DateTime.now().year;
    Get.back();
    return Future.value(false);
  }

  @override
  void onInit() {
    cardNumberController = TextEditingController();
    cardNameController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cardNumberController.dispose();
    cardNameController.dispose();
    super.onClose();
  }
}
