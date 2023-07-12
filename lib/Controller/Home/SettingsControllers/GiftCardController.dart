import 'package:ebuy/Controller/Home/CheckOutController.dart';
import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/constant/ArgumentsNames.dart';
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
  void chooseGiftCard(int index);
}

class GiftCardControllerimp extends GiftCardController {
  Box authBox = Hive.box(HiveBoxes.authBox);
  late TextEditingController longDigitController;
  late TextEditingController shortDigitController;
  List<GiftCardModel> giftCards = [];
  bool anyGiftCard = false;
  late bool canChooseCard;
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
      return 'Must be 16 Digit'.tr;
    }
    if (val.contains('-') ||
        val.contains('.') ||
        val.contains(',') ||
        val.contains(' ')) {
      return 'Must not contain any . - , or white spaces'.tr;
    }
    return null;
  }

  @override
  validateShortDigit(String val) {
    if (val.length != 4) {
      return 'Must be 4 Digit'.tr;
    }
    if (val.contains('-') ||
        val.contains('.') ||
        val.contains(',') ||
        val.contains(' ')) {
      return 'Must not contain any . - , or white spaces'.tr;
    }
    return null;
  }

  @override
  void addGiftCard() async {
    FormState formData = formState.currentState!;
    if (formData.validate()) {
      if (giftCards
          .where((card) =>
              card.cardShortDigit!.contains(shortDigitController.text) &&
              card.cardLongDigit!.contains(longDigitController.text))
          .isEmpty) {
        checkStatusRequest = StatusRequest.loading;
        update();
        var response = await giftCardData.checkGiftCard(
            shortDigitController.text,
            longDigitController.text,
            authBox.get(HiveKeys.userid));
        checkStatusRequest = handlingData(response);
        if (checkStatusRequest == StatusRequest.success) {
          if (response['status'] == "success") {
            shortDigitController.clear();
            longDigitController.clear();
            giftCards.clear();
            List tempCard = response['data'];
            giftCards.addAll(tempCard.map((e) => GiftCardModel.fromJson(e)));
            Get.back();
            succesSnackBar('Done.'.tr,
                'Gift card have been added successfully to your account'.tr);

            if (anyGiftCard == false) {
              anyGiftCard = true;
            }
          } else {
            errorSnackBar(
                "No Card".tr, "There is no gift card with this codes".tr);
            checkStatusRequest = StatusRequest.failure;
          }
        }
      } else if (giftCards
          .where((card) =>
              card.cardShortDigit!.contains(shortDigitController.text) &&
              card.cardLongDigit!.contains(longDigitController.text))
          .isNotEmpty) {
        errorSnackBar(
            'Card already exist!'.tr,
            'the gift card you are trying to add already exist in your gift cards page'
                .tr);
      }
      update();
    }
  }

  @override
  void chooseGiftCard(int index) {
    if (canChooseCard == true) {
      CheckOutControllerimp checkOutController = Get.find();
      checkOutController.selectedGiftCard = giftCards[index];
      Get.back();
      checkOutController.useGiftCard();
    }
  }

  @override
  void onInit() {
    getGiftCards();
    longDigitController = TextEditingController();
    shortDigitController = TextEditingController();
    canChooseCard = Get.arguments[ArgumentsNames.canChooseCard];
    super.onInit();
  }

  @override
  void onClose() {
    longDigitController.dispose();
    shortDigitController.dispose();
    super.onClose();
  }
}
