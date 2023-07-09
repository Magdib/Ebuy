import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Controller/authControllers/SignUpController.dart';
import '../../../../../core/constant/Colors.dart';

import '../../../../../data/dataSource/Static/UINumbers.dart';

class SignUpCustomButton extends StatelessWidget {
  const SignUpCustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpControllerImp>(
      builder: (controller) => ClipRRect(
        borderRadius: BorderRadius.circular(UINumber.borderRadius),
        child: MaterialButton(
          padding: const EdgeInsets.symmetric(vertical: 17),
          minWidth: UINumber.deviceWidth,
          color: AppColors.primaryColor,
          disabledColor: AppColors.grey,
          onPressed: controller.signUpState == true ? onPressed : null,
          child: Text(text, style: Theme.of(context).textTheme.headline3),
        ),
      ),
    );
  }
}
