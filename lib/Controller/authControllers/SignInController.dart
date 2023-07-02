import 'package:ebuy/core/constant/ArgumentsNames.dart';
import 'package:ebuy/core/localization/getCurrentLang.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../core/class/enums.dart';
import '../../core/function/handleData.dart';
import '../../core/function/UiFunctions/SnackBars.dart';
import '../../data/dataSource/remote/auth/CheckEmailData.dart';
import '../../data/dataSource/remote/auth/CodeVerificationData.dart';
import '../../data/dataSource/remote/auth/NewPasswordData.dart';
import '../../data/dataSource/remote/auth/signinData.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class SigninController extends GetxController {
  signin();
  emailValidate(String? val);
  signinRequest();
  passwordValidate(String? val);
  confirmPasswordValidate(String? val);
  signInStateCheck();
  checkemail();
  sendVerifiyCode();
  codeVerification(String verifiyCode);
  setNewPassword();
  setnewpasswordRequest();
}

class SignInControllerImp extends SigninController {
  late Box authBox;
  bool isEnglish = false;
  //Text Form Filed
  TextEditingController? signInEmail;
  TextEditingController? password;
  GlobalKey<FormState> signInFormState = GlobalKey<FormState>();
  //Chech Request State
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest emailSR = StatusRequest.none;
  StatusRequest passwordSR = StatusRequest.none;
  StatusRequest newpasswordSR = StatusRequest.none;
  //Sign in main Function
  SignInData signinData = SignInData(crud: Get.find());
  @override
  signinRequest() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await signinData.postdata(signInEmail!.text, password!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['data']['users_approve'] == "1") {
          authBox.put(HiveKeys.islogin, '2');
          authBox.put(HiveKeys.email, response['data']['users_email']);
          authBox.put(HiveKeys.username, response['data']['users_name']);
          authBox.put(HiveKeys.userid, response['data']['users_id']);
          authBox.put(HiveKeys.userimage, response['data']['users_image']);
          authBox.put(
              HiveKeys.backgroundimage, response['data']['users_background']);
          FirebaseMessaging.instance.subscribeToTopic("users");
          Get.offAllNamed(AppRoutes.mainPageRoute);
          authBox.close();
        } else {
          Get.toNamed(AppRoutes.emailVerificationRoute, arguments: {
            ArgumentsNames.verified: "0",
            ArgumentsNames.email: signInEmail!.text,
            ArgumentsNames.isEnglish: isEnglish
          });
        }
      } else {
        statusRequest = StatusRequest.failure;
        update();
        errorSnackBar('Invalid Email Or Password: '.tr,
            'Email Not Found Or Password is wrong'.tr);
      }
    } else {
      update();
    }
  }

  @override
  signin() async {
    FormState signInFormData = signInFormState.currentState!;
    if (signInFormData.validate()) {
      signinRequest();
    }
  }

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
  passwordValidate(String? val) {
    if (val!.isEmpty) {
      return "Password can't be empty".tr;
    }
    if (val.length < 6) {
      return 'Password must be more than 6 charcters'.tr;
    }
    return null;
  }

  //Sign In State
  bool signInState = false;
  @override
  signInStateCheck() {
    if (signInEmail!.text.isNotEmpty && password!.text.isNotEmpty) {
      signInState = true;
      update();
    } else {
      signInState = false;
    }
  }

  //Check Email
  TextEditingController checkEmailTextEditingController =
      TextEditingController();
  GlobalKey<FormState> checkEmailFormState = GlobalKey<FormState>();
  CheckEmailData checkEmailData = CheckEmailData(crud: Get.find());
  @override
  checkemail() async {
    FormState checkEmailFormData = checkEmailFormState.currentState!;
    if (checkEmailFormData.validate()) {
      sendVerifiyCode();
    }
  }

  @override
  sendVerifiyCode() async {
    emailSR = StatusRequest.loading;
    update();
    var response =
        await checkEmailData.postdata(checkEmailTextEditingController.text);

    emailSR = handlingData(response);
    update();
    if (StatusRequest.success == emailSR) {
      if (response['status'] == "success") {
        Get.toNamed(AppRoutes.forgotPasswordVerificatonRoute);
        emailSR = StatusRequest.none;
      } else {
        emailSR = StatusRequest.failure;
        update();
        errorSnackBar('Invalid Email: '.tr, 'Email Not Found'.tr);
      }
    }
  }

//Code Verification
  late String controllerVerifiyCode;
  final CodeVerificationData _codeVerificationData =
      CodeVerificationData(crud: Get.find());
  @override
  codeVerification(String verifiyCode) async {
    controllerVerifiyCode = verifiyCode;
    passwordSR = StatusRequest.loading;
    update();
    var response = await _codeVerificationData.postdata(
        checkEmailTextEditingController.text, controllerVerifiyCode);

    passwordSR = handlingData(response);
    if (StatusRequest.success == passwordSR) {
      if (response['status'] == "success") {
        Get.toNamed(
          AppRoutes.setnewPasswordRoute,
        );
        passwordSR = StatusRequest.none;
      } else {
        passwordSR = StatusRequest.failure;
        update();
        errorSnackBar(
            'Invalid code: '.tr,
            'Verification Code does not match the code we send to you please recheck your email and write the correct code'
                .tr);
      }
    }
  }

  //Set New Password
  final NewPasswordData _newPasswordData = NewPasswordData(crud: Get.find());
  GlobalKey<FormState> newPasswordFormState = GlobalKey<FormState>();
  TextEditingController newPassword = TextEditingController();
  TextEditingController newPasswordConfirm = TextEditingController();
  @override
  confirmPasswordValidate(String? val) {
    if (val != newPassword.text) {
      return "Confirmed Password not match new password".tr;
    } else {
      return null;
    }
  }

  @override
  setNewPassword() {
    FormState newPasswordFormData = newPasswordFormState.currentState!;
    if (newPasswordFormData.validate()) {
      setnewpasswordRequest();
    }
  }

  @override
  setnewpasswordRequest() async {
    newpasswordSR = StatusRequest.loading;
    update();
    var response = await _newPasswordData.postdata(
        checkEmailTextEditingController.text, newPassword.text);

    newpasswordSR = handlingData(response);
    if (StatusRequest.success == newpasswordSR) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.signInRoute,
            arguments: Get.put(SignInControllerImp()));
      } else {
        errorSnackBar(
            "Error".tr, "New password can't be same as the old password".tr);
        update();
      }
    }
  }

  @override
  void onInit() {
    signInEmail = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() async {
    authBox = await Hive.openBox(HiveBoxes.authBox);
    if ("${getLocal()}".contains("${const Locale("en")}")) {
      isEnglish = true;
    }

    super.onReady();
  }
}
