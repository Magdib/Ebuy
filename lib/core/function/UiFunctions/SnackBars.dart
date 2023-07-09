import 'package:ebuy/core/constant/Colors.dart';
import 'package:get/get.dart';

SnackbarController invalidDateSnackBar() =>
    Get.snackbar('Invalid Date'.tr, 'Please Choose Valid Date and Retry'.tr,
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.white,
        duration: const Duration(seconds: 5));

SnackbarController errorSnackBar(String title, String messageBody) =>
    Get.snackbar(title, messageBody,
        backgroundColor: AppColors.red,
        colorText: AppColors.white,
        duration: const Duration(seconds: 5));
SnackbarController succesSnackBar(String title, String messageBody) =>
    Get.snackbar(title, messageBody,
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.white,
        duration: const Duration(seconds: 5));
SnackbarController noInternetSnackBar() => errorSnackBar(
    "No internet connection".tr, "Please check your internet and try again".tr);
