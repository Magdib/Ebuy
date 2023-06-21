import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:flutter/material.dart';

class CustomConditionButton extends StatelessWidget {
  const CustomConditionButton({
    super.key,
    required this.condition,
    required this.onPressed,
    required this.text,
    this.borderRadius,
  });
  final bool condition;
  final void Function() onPressed;
  final String text;
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
      disabledColor: AppColors.grey,
      onPressed: condition == true ? onPressed : null,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
