import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/function/UiFunctions/SnackBars.dart';
import 'package:ebuy/core/function/handleData.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/data/dataSource/remote/home/AddressData.dart';
import 'package:ebuy/data/dataSource/remote/settings/PaymentData.dart';
import 'package:ebuy/data/dataSource/remote/shared/CheckADPAY.dart';
import 'package:ebuy/data/model/SettingsModels/PaymentModel.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class PaymentController extends GetxController {
  getData();
  void changeExpiryMonth(int val);
  void changeExpiryYear(int val);
  void saveExpiryTime();
  resetExpiryTime();
  void selectPayment(int index);
  void handleSavePayment();
  void goToEditPayment(int index);
  void deletePayment();
  resetPayment();
  void savePayment();
}

class PaymentControllerimp extends PaymentController {
  Box authBox = Hive.box(HiveBoxes.authBox);
  StatusRequest statusRequest = StatusRequest.loading;
  StatusRequest cudStatusRequest = StatusRequest.none;
  CheckADPAY checkADPAY = CheckADPAY(Get.find());
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
  int? editIndex;
  @override
  getData() async {
    var response = await checkADPAY.getData(authBox.get(HiveKeys.userid));
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List tempPayment = response['payment'];
        paymentList.addAll(tempPayment.map((e) => PaymentModel.fromJson(e)));
      } else if (response["paymentstatus"] != "failure") {
        anyAddress = false;
      }
    }
    update();
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
    if (expiryDateTime!.month < DateTime.now().month &&
        expiryDateTime!.year == DateTime.now().year) {
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
    Get.toNamed(AppRoutes.cudPaymentPageRoute);
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
    editIndex = index;
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
  void deletePayment() async {
    cudStatusRequest = StatusRequest.loading;
    update();
    var response =
        await paymentData.deletePayment(paymentList[editIndex!].paymentId!);
    cudStatusRequest = handlingData(response);
    if (cudStatusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        paymentList.removeAt(editIndex!);
        resetPayment();
        succesSnackBar(
            "Done.", "Payment Method have been deleted successfully");
        update();
      }
    }
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
    editIndex = null;
    Get.back();
    return Future.value(false);
  }

  @override
  void savePayment() async {
    cudStatusRequest = StatusRequest.loading;
    update();
    // ignore: prefer_typing_uninitialized_variables
    var response;
    bool isEditing = false;
    if (editIndex == null) {
      response = await paymentData.addPayments(
          authBox.get(HiveKeys.userid),
          cardNameController.text,
          paymentType!,
          cardNumberController.text,
          "$expiryDateTime");
    } else {
      isEditing = true;
      response = await paymentData.editPayment(
          authBox.get(HiveKeys.userid),
          paymentList[editIndex!].paymentId!,
          cardNameController.text,
          paymentType!,
          cardNumberController.text,
          "$expiryDateTime");
    }
    cudStatusRequest = handlingData(response);
    if (cudStatusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        paymentList.clear();
        resetPayment();
        List tempPayment = response['data'];
        paymentList.addAll(tempPayment.map((e) => PaymentModel.fromJson(e)));
        isEditing == false
            ? succesSnackBar(
                "Done.", "Payment Method have been added successfully")
            : succesSnackBar(
                "Done.", "Payment Method have been edited successfully");
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
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
