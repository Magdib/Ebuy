import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Controller/authControllers/SignInController.dart';
import '../../../shared/TitledTextField.dart';

class SignInTextFields extends GetView<SignInControllerImp> {
  const SignInTextFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.signInFormState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitledTextField(
              label: 'Email'.tr,
              hint: 'Enter email'.tr,
              obscure: false,
              textEditingController: controller.signInEmail!,
              validator: (val) => controller.emailValidate(val),
              onChanged: (val) => controller.signInStateCheck()),
          TitledTextField(
              label: 'Password'.tr,
              hint: 'Enter Password'.tr,
              obscure: true,
              textEditingController: controller.password!,
              validator: (val) => controller.passwordValidate(val),
              onChanged: (val) => controller.signInStateCheck()),
        ],
      ),
    );
  }
}
