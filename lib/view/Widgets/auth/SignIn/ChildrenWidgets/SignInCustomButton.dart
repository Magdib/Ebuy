import 'package:ebuy/Controller/authControllers/SignInController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/constant/Colors.dart';

import '../../../../../core/theme/theme.dart';
import '../../../../../data/dataSource/Static/UINumbers.dart';

class SignInCustomButton extends GetView<SignInControllerImp> {
  const SignInCustomButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInControllerImp>(
      builder: (controller) => ClipRRect(
        borderRadius: BorderRadius.circular(UINumber.borderRadius),
        child: MaterialButton(
          padding: const EdgeInsets.symmetric(vertical: 17),
          minWidth: MediaQuery.of(context).size.width / 1,
          color: AppColors.primaryColor,
          disabledColor: AppColors.grey,
          onPressed:
              controller.signInState == true ? () => controller.signin() : null,
          child: Text(
            'Sign In'.tr,
            style: AppTheme.arabicTheme.textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
