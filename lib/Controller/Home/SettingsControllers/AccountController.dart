import 'dart:io';

import 'package:ebuy/Controller/Home/MainPageController.dart';
import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/constant/AppWords.dart';
import 'package:ebuy/core/constant/CustomIcons.dart';
import 'package:ebuy/core/function/UiFunctions/SnackBars.dart';
import 'package:ebuy/core/function/handleData.dart';
import 'package:ebuy/data/dataSource/remote/auth/AuthEditData.dart';
import 'package:ebuy/data/model/authModels/AccountListModel.dart';
import 'package:ebuy/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/function/handleHiveNullState.dart';
import '../../../data/dataSource/Static/HiveKeys.dart';
import '../../../data/model/authModels/AccountFListModel.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class AccountController extends GetxController {
  openWhatsUp();
  void signOut();
  void updateImage(String type);
  vaildateUserName(String val);
  passwordValidate(String val);
  saveDetailes();
  saveButtonState();
  void notificationState(val);
  void changeLanguage(val);
}

class AccountControllerImp extends AccountController {
  Box authBox = Hive.box(HiveBoxes.authBox);
  StatusRequest statusRequest = StatusRequest.none;
  AuthEditData authEditData = AuthEditData(Get.find());
  String? backgroungImage;
  String? userImage;
  late String userName;
  late String userEmail;
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  GlobalKey<FormState> detailesFormState = GlobalKey<FormState>();
  late bool sendNotificatios;
  bool canSaveChanges = true;
  late bool isEnglish;
  bool isLanguageChanging = false;

  late List<AccountFListModel> accountPageUpperList;
  List<AccountListModel> accountPageLowerList = [
    AccountListModel(
        leadingIcon: Icons.square,
        text: 'My details'.tr,
        page: AppRoutes.usersDetailesPageRoute),
    AccountListModel(
        leadingIcon: Icons.location_on_rounded,
        text: 'Address book'.tr,
        page: AppRoutes.addressPageRoute),
    AccountListModel(
        leadingIcon: Icons.credit_card,
        text: 'Payment methods'.tr,
        page: AppRoutes.paymentPageRoute),
    AccountListModel(
        leadingIcon: CustomIcons.personIcon,
        text: 'Social accounts'.tr,
        page: AppRoutes.accountPageRoute)
  ];
  List<AccountFListModel> accountpageList = [
    AccountFListModel(
        leadingIcon: Icons.circle,
        text: 'Need help?',
        onTap: () => print('Help page must be a website Page')),
    AccountFListModel(
        leadingIcon: FontAwesomeIcons.mobile,
        text: 'Tell us what you think of Ebuy',
        onTap: () => print('Open App Page on GooglePlay Store'))
  ];

  List<AccountFListModel> settingsList = [
    AccountFListModel(
        leadingIcon: Icons.notifications,
        text: 'Notifications'.tr,
        onTap: () => Get.toNamed(AppRoutes.notificationsPageRoute)),
    AccountFListModel(
        leadingIcon: Icons.language,
        text: 'Language'.tr,
        onTap: () => Get.toNamed(AppRoutes.languagePageRoute)),
    AccountFListModel(
        leadingIcon: Icons.lock,
        text: 'Terms & Conditions'.tr,
        onTap: () => print('Terms & Conditions must be a website Page')),
  ];
  List<AccountFListModel> giftCardList = [
    AccountFListModel(
        text: 'What is a Gift Card?', onTap: () => print(AppWords.websiteWord)),
    AccountFListModel(
        text: 'What is a Gift Voucher?',
        onTap: () => print(AppWords.websiteWord)),
    AccountFListModel(
        text: 'Gift card/ Voucher FAQs',
        onTap: () => print(AppWords.websiteWord))
  ];
  @override
  openWhatsUp() async {
    String url = "whatsapp://send?phone=+963937386785";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      errorSnackBar(
          "whatsapp no installed", "Please install whatsapp and try again");
    }
  }

  @override
  void updateImage(String type) async {
    final ImagePicker picker = ImagePicker();
    final XFile? ximage = await picker.pickImage(source: ImageSource.gallery);
    if (ximage != null) {
      String imageoldname;
      final File image = File(ximage.path);
      if (type == "user image") {
        imageoldname = handleHiveNullState(HiveKeys.userimage, '');
        StatusRequest imageStatusRequest = StatusRequest.none;
        var response = await authEditData.updateUserImage(
            authBox.get(HiveKeys.userid), image, imageoldname);
        imageStatusRequest = handlingData(response);
        if (imageStatusRequest == StatusRequest.success) {
          if (response['status'] == "success") {
            userImage = response['data']['users_image'];

            authBox.put(HiveKeys.userimage, userImage);
          }
        } else {
          noInternetSnackBar();
        }
      } else {
        imageoldname = handleHiveNullState(HiveKeys.backgroundimage, '');
        StatusRequest imageStatusRequest = StatusRequest.none;
        var response = await authEditData.updateBackgroundImage(
            authBox.get(HiveKeys.userid), image, imageoldname);
        imageStatusRequest = handlingData(response);
        if (imageStatusRequest == StatusRequest.success) {
          if (response['status'] == "success") {
            backgroungImage = response['data']['users_background'];
            authBox.put(HiveKeys.backgroundimage, backgroungImage);
          }
        } else {
          noInternetSnackBar();
        }
      }
    }
    update();
  }

  @override
  void signOut() {
    authBox.clear();
    authBox.put(HiveKeys.language, isEnglish);
    authBox.put(HiveKeys.islogin, '1');
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    Get.offAllNamed(AppRoutes.signInRoute);
  }

  @override
  vaildateUserName(String val) {
    if (val.isEmpty) {
      return "User Name can't be empty";
    }
    if (val.length < 4) {
      return 'Please write your name correctly';
    }
    return null;
  }

  @override
  passwordValidate(String? val) {
    if (val!.isEmpty) {
      return "Password can't be empty".tr;
    }
    if (val.length < 6) {
      return 'Password must be more than 6 charcters'.tr;
    }
    return null;
  }

  @override
  saveButtonState() {
    FormState formData = detailesFormState.currentState!;
    if (formData.validate()) {
      canSaveChanges = true;
    } else {
      canSaveChanges = false;
    }
    update();
  }

  @override
  saveDetailes() async {
    FormState formData = detailesFormState.currentState!;
    if (formData.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await authEditData.editDetailes(
          authBox.get(HiveKeys.userid),
          userNameController.text,
          passwordController.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          Get.back();
          authBox.put(HiveKeys.username, userNameController.text);
          succesSnackBar(
              "Done.", "your detailes have been edited successfully");
        } else {
          errorSnackBar(
              "Error".tr, "New detailes can't be same as the previous one");
        }
      }
      update();
    }
  }

  @override
  void notificationState(val) {
    sendNotificatios = val;
    authBox.put(HiveKeys.notification, val);
    update();
  }

  @override
  void changeLanguage(val) async {
    isLanguageChanging = true;
    update();
    isEnglish = val;
    authBox.put(HiveKeys.language, val);
    Locale newLocale;
    val == true
        ? newLocale = const Locale('en')
        : newLocale = const Locale('ar');
    MainContrllerImp mainContrllerImp = Get.find();
    mainContrllerImp.languageChanged();
    Get.updateLocale(newLocale);
    await Future.delayed(const Duration(milliseconds: 1500));
    isLanguageChanging = false;
    update();
  }

  @override
  void onInit() {
    accountPageUpperList = [
      AccountFListModel(
          leadingIcon: CustomIcons.boxIcon,
          text: 'My orders'.tr,
          onTap: () => Get.toNamed(AppRoutes.ordersPageRoute)),
      AccountFListModel(
        leadingIcon: CustomIcons.meetingIcon,
        text: 'Contact us'.tr,
        onTap: () => openWhatsUp(),
      )
    ];

    userName = authBox.get(HiveKeys.username);
    passwordController = TextEditingController();
    userNameController = TextEditingController(text: userName);
    sendNotificatios = handleHiveNullState(HiveKeys.notification, true);
    bool langNullval;
    if (authBox.get(HiveKeys.language) == null) {
      if (Get.deviceLocale!.languageCode.contains('ar') == true) {
        langNullval = false;
      } else {
        langNullval = true;
      }
    } else {
      langNullval = false;
    }
    isEnglish = handleHiveNullState(HiveKeys.language, langNullval);
    userImage = handleHiveNullState(HiveKeys.userimage, null);
    backgroungImage = handleHiveNullState(HiveKeys.backgroundimage, null);
    super.onInit();
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
