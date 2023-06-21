import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/function/UiFunctions/SnackBars.dart';
import 'package:ebuy/core/function/handleData.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/data/dataSource/Static/static.dart';
import 'package:ebuy/data/dataSource/remote/home/AddressData.dart';
import 'package:ebuy/data/dataSource/remote/settings/PaymentData.dart';
import 'package:ebuy/data/model/SettingsModels/PaymentModel.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class PaymentController extends GetxController {
  getData(bool start);
  String paymentImage(int index);
  void changeExpiryMonth(int val);
  void changeExpiryYear(int val);
  void saveExpiryTime();
  resetExpiryTime();
  void selectPayment(int index);
  void handleSavePayment();
  void goToEditPayment(int index);
  resetPayment();
  void savePayment();
}

class PaymentControllerimp extends PaymentController {
  Box authBox = Hive.box(HiveBoxes.authBox);
  StatusRequest statusRequest = StatusRequest.loading;
  StatusRequest cudStatusRequest = StatusRequest.none;
  AddressData addressData = AddressData(Get.find());
  PaymentData paymentData = PaymentData(Get.find());
  bool anyAddress = true;
  bool canSaveCard = false;
  List<PaymentModel> paymentList = [];
  late TextEditingController cardNumberController;
  late TextEditingController cardNameController;
  int selectedMonth = 1;
  int selectedYear = 2023;
  int? selectedPayment;
  String? paymentType;
  String? expiryDate;
  DateTime? expiryDateTime;
  bool paymentEdit = false;
  @override
  getData(bool start) async {
    if (start == true) {
      var response =
          await addressData.getAddresses(authBox.get(HiveKeys.userid));
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          var paymentResponse =
              await paymentData.getPayments(authBox.get(HiveKeys.userid));
          statusRequest = handlingData(paymentResponse);
          if (statusRequest == StatusRequest.success) {
            if (paymentResponse['status'] == "success") {
              List tempPayment = paymentResponse['data'];
              paymentList
                  .addAll(tempPayment.map((e) => PaymentModel.fromJson(e)));
            }
          }
        } else {
          anyAddress = false;
        }
      }
    } else {
      paymentList.clear();
      var paymentResponse =
          await paymentData.getPayments(authBox.get(HiveKeys.userid));
      statusRequest = handlingData(paymentResponse);
      if (statusRequest == StatusRequest.success) {
        if (paymentResponse['status'] == "success") {
          List tempPayment = paymentResponse['data'];
          paymentList.addAll(tempPayment.map((e) => PaymentModel.fromJson(e)));
        }
      }
    }
    update();
  }

  @override
  String paymentImage(int index) {
    switch (paymentList[index].paymentType) {
      case "Visa":
        return payMethods[0];

      case "Paypal":
        return payMethods[1];
      case "Master Card":
        return payMethods[2];
      case "American Express":
        return payMethods[3];

      default:
        return payMethods[4];
    }
  }

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
    expiryDateTime = DateTime(selectedYear, selectedMonth);
    if (expiryDateTime!.month < DateTime.now().month) {
      errorSnackBar('Wrong Date',
          'The expiry date is invalid please enter valid date and try again');
    } else {
      expiryDate = DateTime(selectedYear, selectedMonth)
          .toString()
          .replaceRange(7, null, '');
      Get.back();
      handleSavePayment();
    }
  }

  @override
  void handleSavePayment() {
    if (cardNumberController.text.length == 16 &&
        cardNameController.text.isNotEmpty &&
        expiryDate != null &&
        selectedPayment != null) {
      canSaveCard = true;
    } else {
      canSaveCard = false;
    }
    update();
  }

  @override
  void goToEditPayment(int index) {
    Get.toNamed(AppRoutes.CUDPaymentPageRoute);
    cardNameController.text = paymentList[index].paymentName!;
    cardNumberController.text = paymentList[index].paymentCardnumber!;
    switch (paymentList[index].paymentType) {
      case "Visa":
        selectedPayment = 0;
        break;
      case "Paypal":
        selectedPayment = 1;
        break;
      case "Master Card":
        selectedPayment = 2;
        break;
      case "American Express":
        selectedPayment = 3;
        break;
      default:
        selectedPayment = 4;
    }
    paymentType = paymentList[index].paymentType;
    expiryDateTime = DateTime.parse(paymentList[index].paymentExpiredate!);

    selectedMonth = expiryDateTime!.month;
    selectedYear = expiryDateTime!.year;
    expiryDate = DateTime(selectedYear, selectedMonth)
        .toString()
        .replaceRange(7, null, '');
    paymentEdit = true;
    canSaveCard = true;
  }

  @override
  resetExpiryTime() {
    selectedMonth = 1;
    selectedYear = DateTime.now().year;
    Get.back();
    return Future.value(false);
  }

  @override
  void selectPayment(int index) {
    selectedPayment = index;
    switch (index) {
      case 0:
        paymentType = "Visa";

        break;
      case 1:
        paymentType = "Paypal";

        break;
      case 2:
        paymentType = "Master Card";

        break;
      case 3:
        paymentType = "American Express";

        break;
      case 4:
        paymentType = "Klarna";

        break;
      default:
    }
    handleSavePayment();
  }

  @override
  resetPayment() {
    selectedMonth = 1;
    selectedYear = DateTime.now().year;
    cardNameController.clear();
    cardNumberController.clear();
    selectedPayment = null;
    expiryDate = null;
    canSaveCard = false;
    paymentEdit = false;
    Get.back();
    return Future.value(false);
  }

  @override
  void savePayment() async {
    cudStatusRequest = StatusRequest.loading;
    update();
    var response = await paymentData.addPayments(
        authBox.get(HiveKeys.userid),
        cardNameController.text,
        paymentType!,
        cardNumberController.text,
        "$expiryDateTime");
    cudStatusRequest = handlingData(response);
    if (cudStatusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        resetPayment();
        await getData(false);
        succesSnackBar("Done.", "Payment Method have been added successfully");
      }
    }
  }

  @override
  void onInit() {
    getData(true);
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
