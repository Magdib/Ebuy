import 'package:ebuy/Controller/Home/CartController.dart';
import 'package:ebuy/core/constant/ArgumentsNames.dart';
import 'package:ebuy/core/function/getCountryData.dart';
import 'package:ebuy/data/dataSource/remote/settings/GiftCardData.dart';
import 'package:ebuy/data/model/CartModels/CartModel.dart';
import 'package:ebuy/data/model/SettingsModels/AddressModel.dart';
import 'package:ebuy/data/model/SettingsModels/giftCardModel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../core/class/enums.dart';
import '../../core/constant/AppWords.dart';
import '../../core/constant/Colors.dart';
import '../../core/constant/Images.dart';
import '../../core/function/handleData.dart';
import '../../data/dataSource/Static/HiveKeys.dart';
import '../../data/dataSource/Static/static.dart';
import '../../data/dataSource/remote/cart/VoucherData.dart';
import '../../data/dataSource/remote/home/AddressData.dart';
import '../../data/model/CartModels/ShippingModel.dart';
import '../../data/model/CartModels/StaticAddressModel.dart';

abstract class CheckOutController extends GetxController {
  void getAddresses();
  void changeShipWay(int index);
  void handleVoucher();
  void getVoucher();
  void reGetGift();
  void useGiftCard();
  void giftCardDiscount();
  changeAddress(int index);
  void choosePayMethod(int index);
  void nextStep();
}

class CheckOutControllerimp extends CheckOutController {
  Box authBox = Hive.box(HiveBoxes.authBox);
  bool anyAddress = false;
  StatusRequest statusRequest = StatusRequest.loading;
  StatusRequest giftStatus = StatusRequest.none;
  VoucherData voucherData = VoucherData(Get.find());
  AddressData addressData = AddressData(Get.find());
  GiftCardData giftCardData = GiftCardData(Get.find());
  late List<CartModel> cartProducts;
  late int selectedIndex;
  late PageController pageController;
  late String currentCountry;
  String countryCode = '';
  TapGestureRecognizer? returnspolicies;
  TapGestureRecognizer? termsPrivacy;
  late TextEditingController voucherController;
  late int discount;
  late GiftCardModel selectedGiftCard;
  List<Color> stepsColors = [
    AppColors.primaryColor,
    AppColors.grey,
    AppColors.grey
  ];
  int? selectedPayment;
  bool canPlaceOrder = false;
  bool canAddVoucher = false;
  bool giftLoading = false;
  late bool canAddGift;
  late String sign;
  String? giftType;
  late int paymentAddress;
  late int shippingAddress;
  List<String> paymentMethods = [
    AppImagesAssets.payPal,
    AppImagesAssets.klarna,
  ];
  late List<List<String>> placeOrderList;
  int shipLastIndex = 0;
  List<ShippingModel> shipRadioList = shipRadioStatic;
  late List<StaticAddressModel> shippingAddresList;
  late List<StaticAddressModel> paymentAddresList;
  String shipWay = 'Free';
  int currentStep = 0;
  double totalPrice = 0.0;
  List<AddressModel> addressList = [];

  @override
  void getAddresses() async {
    var response = await addressData.getAddresses(authBox.get(HiveKeys.userid));
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List addressTempList = response['data'];
        addressList
            .addAll(addressTempList.map((e) => AddressModel.fromJson(e)));
        anyAddress = true;
        String tempCountry = addressList[shippingAddress].addressStreet!;
        currentCountry = getCountryData(tempCountry, countryCode, "Name");
        countryCode = getCountryData(tempCountry, countryCode, "");
        shippingAddresList = [
          StaticAddressModel(
              title: authBox.get(HiveKeys.username), icon: Icons.person),
          StaticAddressModel(
              title: addressList[shippingAddress].addressStreet!,
              icon: Icons.location_on_outlined),
          StaticAddressModel(
              title: addressList[shippingAddress].addressPhone!,
              icon: Icons.amp_stories_rounded)
        ];
        paymentAddresList = [
          StaticAddressModel(
              title: authBox.get(HiveKeys.username), icon: Icons.person),
          StaticAddressModel(
              title: addressList[paymentAddress].addressStreet!,
              icon: Icons.location_on_outlined),
          StaticAddressModel(
              title: addressList[paymentAddress].addressPhone!,
              icon: Icons.amp_stories_rounded)
        ];
      }
    }
    update();
  }

  @override
  void handleVoucher() {
    voucherController.text != '' ? canAddVoucher = true : canAddVoucher = false;
    update();
  }

  @override
  void getVoucher() async {
    giftStatus = StatusRequest.loading;
    update();
    var response = await voucherData.checkVoucher(voucherController.text);
    giftStatus = handlingData(response);
    if (giftStatus == StatusRequest.success) {
      if (response['status'] == "success") {
        discount = int.parse(response['data']['voucher_discount']);
        totalPrice = 0.0;
        for (int i = 0; i < cartProducts.length; i++) {
          cartProducts[i]
              .cartPrice = (double.parse(cartProducts[i].cartPrice!) -
                  (double.parse(cartProducts[i].cartPrice!)) * discount / 100)
              .toStringAsFixed(1);
          totalPrice += double.parse(cartProducts[i].cartPrice!);
        }
        authBox.put(HiveKeys.voucherCode, voucherController.text);
        authBox.put(HiveKeys.voucherDiscount, discount);
        canAddGift = false;
        giftType = "Voucher";
        sign = "%";
        Get.back();
      } else {
        giftStatus = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void useGiftCard() async {
    giftStatus = StatusRequest.loading;
    update();
    var response = await giftCardData.useGiftCard(selectedGiftCard.cardId!);
    giftStatus = handlingData(response);
    if (giftStatus == StatusRequest.success) {
      if (response['status'] == "success") {
        discount = int.parse(selectedGiftCard.cardDiscount!);
        giftType = "Card";
        giftCardDiscount();
        authBox.put(HiveKeys.cardDiscount, discount);
        authBox.put(HiveKeys.giftCardId, selectedGiftCard.cardId);
        canAddGift = false;
        Get.back();
        update();
      }
    }
  }

  @override
  void giftCardDiscount() {
    sign = "\$";
    if (giftType == "Card") {
      if (totalPrice > discount) {
        totalPrice = totalPrice - discount;
      } else {
        totalPrice = 0;
      }
      if (double.parse(cartProducts[0].cartPrice!) > discount) {
        cartProducts[0].cartPrice =
            (double.parse(cartProducts[0].cartPrice!) - discount)
                .toStringAsFixed(2);
      } else {
        cartProducts[0].cartPrice = "0.0";
        cartProducts[1].cartPrice =
            (double.parse(cartProducts[0].cartPrice!) - discount)
                .toStringAsFixed(2);
      }
    } else {
      totalPrice = totalPrice + discount;
      cartProducts[0].cartPrice =
          (double.parse(cartProducts[0].cartPrice!) + discount)
              .toStringAsFixed(2);
    }
  }

  @override
  void reGetGift() async {
    giftLoading = true;
    update();
    if (giftType == "Voucher") {
      var response =
          await voucherData.reGetGift(authBox.get(HiveKeys.voucherCode));
      if (response['status'] == "success") {
        CartControllerImp cartController = Get.find();
        cartProducts = cartController.cartProducts;
        canAddGift = true;
        authBox.delete(HiveKeys.voucherCode);
        authBox.delete(HiveKeys.voucherDiscount);
        giftLoading = false;
        totalPrice = 0;
        for (int i = 0; i < cartProducts.length; i++) {
          cartProducts[i].cartPrice = cartController.cartProducts[i].cartPrice;

          totalPrice += double.parse(cartProducts[i].cartPrice!);
        }
      } else {
        giftLoading = false;
      }
    } else {
      var response =
          await giftCardData.regetGiftCard(authBox.get(HiveKeys.giftCardId));
      if (response['status'] == "success") {
        CartControllerImp cartController = Get.find();
        cartProducts = cartController.cartProducts;
        canAddGift = true;
        authBox.delete(HiveKeys.giftCardId);
        authBox.delete(HiveKeys.cardDiscount);
        giftLoading = false;
        totalPrice = totalPrice + discount;
        cartProducts[0].cartPrice = cartController.cartProducts[0].cartPrice;
      }
    }
    update();
  }

  @override
  changeAddress(int index) {
    if (index == -1) {
      if (currentStep == 1) {
        shippingAddresList = [
          StaticAddressModel(
              title: authBox.get(HiveKeys.username), icon: Icons.person),
          StaticAddressModel(
              title: addressList[shippingAddress].addressStreet!,
              icon: Icons.location_on_outlined),
          StaticAddressModel(
              title: addressList[shippingAddress].addressPhone!,
              icon: Icons.amp_stories_rounded)
        ];
      } else {
        paymentAddresList = [
          StaticAddressModel(
              title: authBox.get(HiveKeys.username), icon: Icons.person),
          StaticAddressModel(
              title: addressList[paymentAddress].addressStreet!,
              icon: Icons.location_on_outlined),
          StaticAddressModel(
              title: addressList[paymentAddress].addressPhone!,
              icon: Icons.amp_stories_rounded)
        ];
      }
      Get.back();
      update();
    } else {
      if (currentStep == 1) {
        shippingAddress = index;
      } else {
        paymentAddress = index;
      }
      update();
    }

    return Future.value(false);
  }

  @override
  void changeShipWay(int index) {
    shipRadioList[shipLastIndex].isSelected = false;
    shipLastIndex = index;
    shipRadioList[index].isSelected = true;
    shipWay = shipRadioList[index].title.replaceRange(4, null, '');
    update();
  }

  @override
  void choosePayMethod(int index) {
    selectedPayment = index;
    canPlaceOrder = true;
    update();
  }

  @override
  void nextStep() {
    if (currentStep == 1) {
      placeOrderList = [
        ['Sub - total', 'Shipping', 'Sale tax'],
        ['\$$totalPrice', shipWay, "\$4.70"]
      ];
    }
    pageController.nextPage(
        duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
    currentStep++;
    stepsColors[currentStep] = AppColors.primaryColor;
    update();
  }

  @override
  void onInit() {
    shippingAddress = authBox.get(HiveKeys.choosenAddress);
    paymentAddress = authBox.get(HiveKeys.choosenAddress);

    totalPrice = Get.arguments[ArgumentsNames.cartTotalPrice];
    cartProducts = Get.arguments[ArgumentsNames.cartProducts];
    if (authBox.get(HiveKeys.voucherCode) != null) {
      giftType = "Voucher";
    } else if (authBox.get(HiveKeys.cardDiscount) != null) {
      giftType = "Card";
    }

    giftType == "Voucher" || giftType == "Card"
        ? canAddGift = false
        : canAddGift = true;
    if (giftType == "Voucher") {
      discount = authBox.get(HiveKeys.voucherDiscount);
    } else if (giftType == "Card") {
      discount = authBox.get(HiveKeys.cardDiscount);
    }

    if (canAddGift == false) {
      if (giftType == "Voucher") {
        totalPrice = 0.0;
        sign = "%";
        for (int i = 0; i < cartProducts.length; i++) {
          cartProducts[i]
              .cartPrice = (double.parse(cartProducts[i].cartPrice!) -
                  (double.parse(cartProducts[i].cartPrice!)) * discount / 100)
              .toStringAsFixed(1);
          totalPrice += double.parse(cartProducts[i].cartPrice!);
        }
      } else if (giftType == "Card") {
        giftCardDiscount();
      }
    }
    getAddresses();

    pageController = PageController();
    for (int i = 0; i < cartProducts.length; i++) {
      totalPrice += double.parse(cartProducts[i].cartPrice!);
    }
    voucherController = TextEditingController();
    returnspolicies = TapGestureRecognizer()
      ..onTap = () => print(AppWords.websiteWord);
    termsPrivacy = TapGestureRecognizer()
      ..onTap = () => print(AppWords.websiteWord);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    voucherController.dispose();
    super.onClose();
  }
}
