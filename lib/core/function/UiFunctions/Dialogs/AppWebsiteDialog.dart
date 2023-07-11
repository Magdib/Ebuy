import 'package:get/get.dart';

appWebSiteDialog() {
  return Get.defaultDialog(
      title: "Note:".tr,
      middleText: "This page should be a website page".tr,
      titleStyle: Get.textTheme.bodyText1!.copyWith(fontSize: 20),
      middleTextStyle: Get.textTheme.headline2);
}
