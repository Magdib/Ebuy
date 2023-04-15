import 'package:ebuy/core/constant/Colors.dart';
import 'package:get/get.dart';

SnackbarController invalidDateSnackBar() =>
    Get.snackbar('Invalid Date'.tr, 'Please Choose Valid Date and Retry'.tr,
        backgroundColor: AppColors.primaryColor, colorText: AppColors.white);

SnackbarController invalidAuthSnackBar(String title, String messageBody) =>
    Get.snackbar(title, messageBody,
        backgroundColor: AppColors.red,
        colorText: AppColors.white,
        duration: const Duration(seconds: 20));
SnackbarController succesSnackBar(String title, String messageBody) =>
    Get.snackbar(title, messageBody,
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.white,
        duration: const Duration(seconds: 20));
