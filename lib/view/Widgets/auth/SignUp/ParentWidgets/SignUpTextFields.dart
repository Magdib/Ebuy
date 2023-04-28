import 'package:ebuy/Controller/authControllers/SignUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/theme.dart';
import '../ChildrenWidgets/CustomTextFromFieldWithUpperText.dart';

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
          CustomTextFromFieldWithUpperText(
              label: 'Email'.tr,
              hint: 'Enter email'.tr,
              obscure: false,
              textEditingController: controller.email!,
              validator: (String? val) => controller.emailValidate(val),
              onChanged: (val) => controller.signUpStateCheck()),
          Text(
            'We\'ll send your order confirmation here'.tr,
            style: AppTheme.arabicTheme.textTheme.headline6!
                .copyWith(fontSize: 12),
          ),
          CustomTextFromFieldWithUpperText(
              label: 'First name'.tr,
              hint: 'Enter first name'.tr,
              obscure: false,
              textEditingController: controller.firstName!,
              validator: (String? val) => controller.firstNameValidate(val),
              onChanged: (val) => controller.signUpStateCheck()),
          CustomTextFromFieldWithUpperText(
              label: 'Last name'.tr,
              hint: 'Enter last name'.tr,
              obscure: false,
              textEditingController: controller.lastName!,
              validator: (String? val) => controller.lastNameValidate(val),
              onChanged: (val) => controller.signUpStateCheck()),
          CustomTextFromFieldWithUpperText(
              label: 'Password'.tr,
              hint: 'Enter Password'.tr,
              obscure: true,
              textEditingController: controller.password!,
              validator: (String? val) => controller.passwordValidate(val),
              onChanged: (val) => controller.signUpStateCheck()),
          Text(
            'Must be 6 or more characters'.tr,
            style: AppTheme.arabicTheme.textTheme.headline6!
                .copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}