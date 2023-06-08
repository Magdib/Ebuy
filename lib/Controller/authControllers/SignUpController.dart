import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/constant/ArgumentsNames.dart';
import 'package:ebuy/core/function/handleData.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/function/UiFunctions/SnackBars.dart';
import '../../data/dataSource/remote/auth/EmailVerificationData.dart';
import '../../data/dataSource/remote/auth/signupData.dart';
import '../../data/model/authModels/EmailLikedModel.dart';

abstract class SignUpController extends GetxController {
  dayListContent();
  monthListContent();
  yearListContent();
  changeDay(String newDate);
  changeMonth(String newDate);
  changeYear(String newDate);
  chooseMensWear();
  chooseWommensWear();
  chooseEmailLiked(int index);
  emailValidate(String? val);
  firstNameValidate(String? val);
  lastNameValidate(String? val);
  passwordValidate(String? val);
  birthTimeCheck();
  signup();
  signupRequest();
  emailVerifiy(String verifiyCode);
}

class SignUpControllerImp extends SignUpController {
  //TextFormField
  TextEditingController? email;
  TextEditingController? firstName;
  TextEditingController? lastName;
  TextEditingController? password;
  GlobalKey<FormState> signUpFormState = GlobalKey<FormState>();

  // Form Validate
  @override
  emailValidate(String? val) {
    if (val!.isEmpty) {
      return "Email can't be empty".tr;
    }
    if (val.contains('@gmail.com') == false || val.length < 10) {
      return 'Please write correct email'.tr;
    }
    return null;
  }

  @override
  firstNameValidate(String? val) {
    if (val!.isEmpty) {
      return "Firstname can't be empty".tr;
    }
    if (val.length < 2) {
      return 'Please write your first name correctly'.tr;
    }
    return null;
  }

  @override
  lastNameValidate(String? val) {
    if (val!.isEmpty) {
      return "Last name can't be empty".tr;
    }
    if (val.length < 2) {
      return 'Please write your last name correctly'.tr;
    }
    return null;
  }

  @override
  passwordValidate(String? val) {
    if (val!.isEmpty) {
      return "Password can't be empty".tr;
    }
    if (val.length < 6) {
      return 'Weak password'.tr;
    }
    return null;
  }

  //Chech Request State
  StatusRequest signUpStatusRequest = StatusRequest.none;
  StatusRequest verifyEmailStatusRequest = StatusRequest.none;
  //Sign Up main Function
  SignUpData signUpData = SignUpData(crud: Get.find());
  @override
  signupRequest() async {
    signUpStatusRequest = StatusRequest.loading;
    update();
    var response = await signUpData.postdata(
        "${firstName!.text} ${lastName!.text}", email!.text, password!.text);

    signUpStatusRequest = handlingData(response);
    update();
    if (StatusRequest.success == signUpStatusRequest) {
      if (response['status'] == "success") {
        Get.toNamed(
          AppRoutes.emailVerificationRoute,
        );
        signUpStatusRequest = StatusRequest.none;
      } else {
        signUpStatusRequest = StatusRequest.failure;
        update();
        errorSnackBar('Invalid Email: '.tr, 'Email already exist'.tr);
      }
    }
  }

  @override
  signup() async {
    FormState signUpFormData = signUpFormState.currentState!;
    if (signUpFormData.validate()) {
      signupRequest();

      discountsAndSales = emailLikedList[0].value;
      newStuff = emailLikedList[1].value;
      yourExclusives = emailLikedList[2].value;
      appPartners = emailLikedList[3].value;
      birthTimeCheck();
    }
  }

  //DropDown Birth Data
  List<String> day = [];
  List<String> month = [];
  List<String> year = [];
  String? birthDay;
  String? birthmonth;
  String? birthYear;
  @override
  dayListContent() {
    for (int i = 0; i < 31; i++) {
      if (i < 9) {
        day.add('0${i + 1}');
      } else {
        day.add('${i + 1}');
      }
    }
  }

  @override
  monthListContent() {
    for (int i = 0; i < 12; i++) {
      if (i < 9) {
        month.add('0${i + 1}');
      } else {
        month.add('${i + 1}');
      }
    }
  }

  @override
  yearListContent() {
    for (int i = 1920; i < DateTime.now().year - 15; i++) {
      year.add('$i');
    }
  }

  @override
  changeDay(String newDate) {
    birthDay = newDate;
    update();
    signUpStateCheck();
  }

  @override
  changeMonth(String newDate) {
    birthmonth = newDate;
    update();
    signUpStateCheck();
  }

  @override
  changeYear(String newDate) {
    birthYear = newDate;
    update();
    signUpStateCheck();
  }

  @override
  birthTimeCheck() {
    if (birthmonth == '02' &&
        birthDay == '29' &&
        int.parse(birthYear!) % 4 != 0) {
      invalidDateSnackBar();
    } else if (birthmonth == '02' && birthDay == '30' ||
        birthDay == '31' && birthmonth == '02') {
      invalidDateSnackBar();
    }
    if (birthmonth == '04' && birthDay == '31') {
      invalidDateSnackBar();
    }
    if (birthmonth == '06' && birthDay == '31') {
      invalidDateSnackBar();
    }
    if (birthmonth == '08' && birthDay == '31') {
      invalidDateSnackBar();
    }
    if (birthmonth == '11' && birthDay == '31') {
      invalidDateSnackBar();
    } else {}
  }

//Men or Women Wear
  bool mensWear = false;
  bool womensWear = false;
  @override
  chooseMensWear() {
    mensWear = !mensWear;
    womensWear = false;
    update();
  }

  @override
  chooseWommensWear() {
    womensWear = !womensWear;
    mensWear = false;
    update();
  }

//Email Liked

  List<EmailLikedModel> emailLikedList = [
    EmailLikedModel(title: 'Discounts and sales'.tr, value: false),
    EmailLikedModel(title: 'New stuff'.tr, value: false),
    EmailLikedModel(title: 'Your exclusives'.tr, value: false),
    EmailLikedModel(title: 'App partners'.tr, value: false),
  ];
  bool discountsAndSales = false;
  bool newStuff = false;
  bool yourExclusives = false;
  bool appPartners = false;
  @override
  chooseEmailLiked(int index) {
    emailLikedList[index].value = !emailLikedList[index].value;
    update();
  }

  //Sign Up State
  bool? signUpState;
  signUpStateCheck() {
    if (email!.text.isNotEmpty &&
        firstName!.text.isNotEmpty &&
        lastName!.text.isNotEmpty &&
        password!.text.isNotEmpty &&
        birthDay!.isNotEmpty &&
        birthmonth!.isNotEmpty &&
        birthYear!.isNotEmpty) {
      signUpState = true;
      update();
    } else {
      signUpState = false;
    }
  }

//Email Verification
  final EmailVerificationData _emailVerificationData =
      EmailVerificationData(crud: Get.find());
  String? controllerverifycode;

  @override
  emailVerifiy(String verifiyCode) async {
    controllerverifycode = verifiyCode;
    verifyEmailStatusRequest = StatusRequest.loading;
    update();
    var response = await _emailVerificationData.postdata(
        email!.text, controllerverifycode!);
    verifyEmailStatusRequest = handlingData(response);
    if (StatusRequest.success == verifyEmailStatusRequest) {
      if (response['status'] == "success") {
        Get.back();
        Get.back();
        succesSnackBar(
            'Success'.tr, 'Your account have been Created successfully'.tr);
      } else {
        verifyEmailStatusRequest = StatusRequest.failure;
        update();
        errorSnackBar(
            'Invalid code: '.tr,
            'Verification Code does not match the code with send to you please recheck your email and write the correct code'
                .tr);
      }
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    firstName = TextEditingController();
    lastName = TextEditingController();
    password = TextEditingController();
    dayListContent();
    monthListContent();
    yearListContent();
    signUpStateCheck();
    if (Get.arguments[ArgumentsNames.verified] == "0") {
      email!.text = Get.arguments[ArgumentsNames.email];
    }
    super.onInit();
  }

  @override
  void onClose() {
    verifyEmailStatusRequest = StatusRequest.none;
    signUpStatusRequest = StatusRequest.none;
    email!.dispose();
    password!.dispose();
    firstName!.dispose();
    lastName!.dispose();

    super.onClose();
  }
}
