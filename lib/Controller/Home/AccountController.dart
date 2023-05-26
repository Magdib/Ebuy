import 'package:ebuy/Controller/Home/MainPageController.dart';
import 'package:ebuy/core/constant/AppWords.dart';
import 'package:ebuy/core/theme/theme.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../core/function/Ui Functions/ShopInDialog.dart';
import '../../core/function/handleHiveNullState.dart';
import '../../data/dataSource/Static/HiveKeys.dart';
import '../../data/model/authModels/AccountFListModel.dart';

abstract class AccountController extends GetxController {
  final bool _isThereBackGround = false;
  final bool _isThereAccountImage = false;
  void signOut();
  vaildateUserName(String val);
  vaildateEmail(String val);
  saveDetailes();
  saveButtonState();
  void notificationState(val);
  void changeLanguage(val);
}

class AccountControllerImp extends AccountController {
  Box authBox = Hive.box(HiveBoxes.authBox);
  late String userName;
  late String userEmail;
  late TextEditingController userNameController;
  late TextEditingController userEmailController;
  GlobalKey<FormState> detailesFormState = GlobalKey<FormState>();
  late bool sendNotificatios;
  bool canSaveChanges = true;
  late bool isEnglish;
  bool isLanguageChanging = false;
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
      leadingIcon: Icons.circle,
      text: 'Shop in',
      onTap: () => shopInDialog(),
    ),
    AccountFListModel(
        leadingIcon: Icons.notifications,
        text: 'Notifications',
        onTap: () => Get.toNamed(AppRoutes.notificationsPageRoute)),
    AccountFListModel(
        leadingIcon: Icons.language,
        text: 'Language',
        onTap: () => Get.toNamed(AppRoutes.languagePageRoute)),
    AccountFListModel(
        leadingIcon: Icons.lock,
        text: 'Terms & Conditions',
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
  bool getBackGroundImage() => _isThereBackGround;
  bool getAccountImage() => _isThereAccountImage;

  @override
  void signOut() {
    authBox.put(HiveKeys.islogin, '1');
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
  vaildateEmail(String val) {
    if (val.isEmpty) {
      return "Email can't be empty".tr;
    }
    if (val.contains('@gmail.com') == false || val.length < 10) {
      return 'Please write correct email'.tr;
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
  saveDetailes() {
    FormState formData = detailesFormState.currentState!;
    if (formData.validate()) {
      print('Save Changes');
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
    userName = authBox.get(HiveKeys.username);
    userEmail = authBox.get(HiveKeys.email);
    userEmailController = TextEditingController(text: userEmail);
    userNameController = TextEditingController(text: userName);
    sendNotificatios = handleHiveNullState(HiveKeys.notification, false);
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
    super.onInit();
  }

  @override
  void onClose() {
    userNameController.dispose();
    userEmailController.dispose();
    super.onClose();
  }
}
