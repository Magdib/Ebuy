import 'package:ebuy/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/Colors.dart';

import '../../../../data/dataSource/Static/UINumbers.dart';

class RetryAuthButton extends StatelessWidget {
  const RetryAuthButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(UINumber.borderRadius),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 17),
        minWidth: MediaQuery.of(context).size.width / 4,
        color: AppColors.primaryColor,
        onPressed: onPressed,
        child:
            Text('Retry'.tr, style: AppTheme.arabicTheme.textTheme.headline3),
      ),
    );
  }
}