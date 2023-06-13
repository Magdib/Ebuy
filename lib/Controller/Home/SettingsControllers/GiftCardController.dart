import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/function/UiFunctions/SnackBars.dart';
import 'package:ebuy/core/function/handleData.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/data/dataSource/remote/settings/GiftCardData.dart';
import 'package:ebuy/data/model/SettingsModels/giftCardModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class GiftCardController extends GetxController {
  void getGiftCards();
  validateLongDigit(String val);
  validateShortDigit(String val);
  void addGiftCard();
}

class GiftCardControllerimp extends GiftCardController {
  Box authBox = Hive.box(HiveBoxes.authBox);
  late TextEditingController longDigitController;
  late TextEditingController shortDigitController;
  List<GiftCardModel> giftCards = [];
  bool anyGiftCard = false;
  GiftCardData giftCardData = GiftCardData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  StatusRequest checkStatusRequest = StatusRequest.none;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void getGiftCards() async {
    var response =
        await giftCardData.getGiftCards(authBox.get(HiveKeys.userid));
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        anyGiftCard = true;
        List giftCardsTemp = response['data'];
        giftCards.addAll(giftCardsTemp.map((e) => GiftCardModel.fromJson(e)));
      }
    }
    update();
  }

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
  void addGiftCard() async {
    FormState formData = formState.currentState!;
    if (formData.validate()) {
      checkStatusRequest = StatusRequest.loading;
      update();
      var response = await giftCardData.checkGiftCard(shortDigitController.text,
          longDigitController.text, authBox.get(HiveKeys.userid));
      checkStatusRequest = handlingData(response);
      if (checkStatusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          shortDigitController.clear();
          longDigitController.clear();
          Get.back();
          succesSnackBar('Done.',
              'Gift card have been added successfully to your account');
          GiftCardModel tempCard = GiftCardModel.fromJson(response['data']);
          giftCards.add(tempCard);
          if (anyGiftCard == false) {
            anyGiftCard = true;
          }
        } else {
          checkStatusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    getGiftCards();
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
