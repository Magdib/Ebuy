import 'package:ebuy/Controller/authControllers/SignUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/theme.dart';
import '../../../shared/TitledTextField.dart';

class SignUpTextFields extends GetView<SignUpControllerImp> {
  const SignUpTextFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.signUpFormState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitledTextField(
              label: 'Email'.tr,
              hint: 'Enter email'.tr,
              obscure: false,
              textEditingController: controller.email!,
              validator: (String? val) => controller.emailValidate(val),
              onChanged: (val) => controller.signUpStateCheck()),
          Text(
            'We\'ll send your order confirmation here'.tr,
            style:
                Theme.of(context).textTheme.headline6!.copyWith(fontSize: 12),
          ),
          TitledTextField(
              label: 'First name'.tr,
              hint: 'Enter first name'.tr,
              obscure: false,
              textEditingController: controller.firstName!,
              validator: (String? val) => controller.firstNameValidate(val),
              onChanged: (val) => controller.signUpStateCheck()),
          TitledTextField(
              label: 'Last name'.tr,
              hint: 'Enter last name'.tr,
              obscure: false,
              textEditingController: controller.lastName!,
              validator: (String? val) => controller.lastNameValidate(val),
              onChanged: (val) => controller.signUpStateCheck()),
          TitledTextField(
              label: 'Password'.tr,
              hint: 'Enter Password'.tr,
              obscure: true,
              textEditingController: controller.password!,
              validator: (String? val) => controller.passwordValidate(val),
              onChanged: (val) => controller.signUpStateCheck()),
          Text(
            'Must be 6 or more characters'.tr,
            style:
                Theme.of(context).textTheme.headline6!.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
