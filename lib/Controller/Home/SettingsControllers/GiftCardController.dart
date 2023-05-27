import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class GiftCardController extends GetxController {
  validateLongDigit(String val);
  validateShortDigit(String val);
  void addGiftCard();
}

class GiftCardControllerimp extends GiftCardController {
  late TextEditingController longDigitController;
  late TextEditingController shortDigitController;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  validateLongDigit(String val) {
    if (val.length != 16) {
      return 'Must be 16 Digit';
    }
    if (val.contains('-') ||
        val.contains('.') ||
        val.contains(',') ||
        val.contains(' ')) {
      return 'Must not contain any . - , or white spaces';
    }
    return null;
  }

  @override
  validateShortDigit(String val) {
    if (val.length != 4) {
      return 'Must be 4 Digit';
    }
    if (val.contains('-') ||
        val.contains('.') ||
        val.contains(',') ||
        val.contains(' ')) {
      return 'Must not contain any . - , or white spaces';
    }
    return null;
  }

  @override
  void addGiftCard() {
    FormState formData = formState.currentState!;
    if (formData.validate()) {
      print('Add Gift Card');
    }
  }

  @override
  void onInit() {
    longDigitController = TextEditingController();
    shortDigitController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    longDigitController.dispose();
    shortDigitController.dispose();
    super.onClose();
  }
}
