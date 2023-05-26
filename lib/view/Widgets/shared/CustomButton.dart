import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/Colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.borderRadius,
    this.color,
    this.textColor,
  }) : super(key: key);
  final String text;
  final void Function() onPressed;
  final double? borderRadius;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius == null
              ? BorderRadius.circular(UINumber.borderRadius)
              : BorderRadius.circular(borderRadius!),
          side: textColor != null
              ? BorderSide(color: textColor!)
              : BorderSide.none),
      padding: const EdgeInsets.symmetric(vertical: 17),
      minWidth: MediaQuery.of(context).size.width / 1,
      color: color ?? AppColors.primaryColor,
      onPressed: onPressed,
      child: Text(
        text,
        style: textColor == null
            ? Theme.of(context).textTheme.headline3
            : Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
      ),
    );
  }
}
