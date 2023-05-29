import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/Colors.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15),
      minWidth: UINumber.deviceWidth / 3,
      color: AppColors.primaryColor,
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
