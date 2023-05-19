import 'package:ebuy/core/theme/theme.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/onBoardingController/OnBoardingController.dart';
import '../../../core/constant/Colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.borderRadius,
  }) : super(key: key);
  final String text;
  final void Function() onPressed;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius == null
            ? BorderRadius.circular(UINumber.borderRadius)
            : BorderRadius.circular(borderRadius!),
      ),
      padding: const EdgeInsets.symmetric(vertical: 17),
      minWidth: MediaQuery.of(context).size.width / 1,
      color: AppColors.primaryColor,
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
