import 'dart:async';

import 'package:ebuy/core/services/intialServices.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/function/handleData.dart';
import '../../core/function/SnackBars.dart';
import '../../data/dataSource/remote/auth/CheckEmailData.dart';
import '../../data/dataSource/remote/auth/CodeVerificationData.dart';
import '../../data/dataSource/remote/auth/NewPasswordData.dart';
import '../../data/dataSource/remote/auth/signinData.dart';

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
  //Text Form Filed
  TextEditingController? signInEmail;

  TextEditingController? password;
  GlobalKey<FormState> signInFormState = GlobalKey<FormState>();
  //Chech Request State
  StatusRequest signInStatusRequest = StatusRequest.none;
  StatusRequest emailCheckStatusRequest = StatusRequest.none;
  StatusRequest forgotPasswordStatusRequest = StatusRequest.none;
  StatusRequest setNewPasswordStatusRequest = StatusRequest.none;
  //Sign in main Function
  SignInData signinData = SignInData(crud: Get.find());
  @override
  signinRequest() async {
    Box authBox = await Hive.openBox(HiveBoxes.authBox);
    signInStatusRequest = StatusRequest.loading;
    update();
    var response = await signinData.postdata(signInEmail!.text, password!.text);

    signInStatusRequest = handlingData(response);
    update();
    if (StatusRequest.success == signInStatusRequest) {
      if (response['status'] == "success") {
        authBox.put(HiveKeys.islogin, '1');
        authBox.put(HiveKeys.email, response['data']['users_email']);
        authBox.put(HiveKeys.username, response['data']['users_name']);
        authBox.put(HiveKeys.userid, response['data']['users_id']);
        Get.offAllNamed(AppRoutes.mainPageRoute);
        authBox.close();
      } else {
        signInStatusRequest = StatusRequest.failure;
        update();
        errorSnackBar('Invalid Email Or Password: '.tr,
            'Email Not Found Or Password is wrong'.tr);
      }
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
    emailCheckStatusRequest = StatusRequest.loading;
    update();
    var response =
        await checkEmailData.postdata(checkEmailTextEditingController.text);

    emailCheckStatusRequest = handlingData(response);
    update();
    if (StatusRequest.success == emailCheckStatusRequest) {
      if (response['status'] == "success") {
        Get.toNamed(AppRoutes.forgotPasswordVerificatonRoute);
        emailCheckStatusRequest = StatusRequest.none;
      } else {
        emailCheckStatusRequest = StatusRequest.failure;
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
    forgotPasswordStatusRequest = StatusRequest.loading;
    update();
    var response = await _codeVerificationData.postdata(
        checkEmailTextEditingController.text, controllerVerifiyCode);

    forgotPasswordStatusRequest = handlingData(response);
    if (StatusRequest.success == forgotPasswordStatusRequest) {
      if (response['status'] == "success") {
        Get.toNamed(
          AppRoutes.setnewPasswordRoute,
        );
        forgotPasswordStatusRequest = StatusRequest.none;
      } else {
        forgotPasswordStatusRequest = StatusRequest.failure;
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
    setNewPasswordStatusRequest = StatusRequest.loading;
    update();
    var response = await _newPasswordData.postdata(
        checkEmailTextEditingController.text, newPassword.text);

    setNewPasswordStatusRequest = handlingData(response);
    if (StatusRequest.success == setNewPasswordStatusRequest) {
      if (response['status'] == "success") {
        Get.offNamedUntil(
          AppRoutes.signInRoute,
          (route) => false,
        );
      } else {
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
  void onClose() {
    signInEmail!.dispose();
    password!.dispose();
    super.onClose();
  }
}
