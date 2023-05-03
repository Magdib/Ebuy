import 'package:ebuy/Controller/authControllers/SignUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/Colors.dart';

import '../../../../../core/theme/theme.dart';
import '../../../../../data/dataSource/Static/UINumbers.dart';

class EmailLikedRow extends GetView<SignUpControllerImp> {
  const EmailLikedRow({
    Key? key,
    required this.title,
    required this.itemchosen,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final bool itemchosen;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            InkWell(
              onTap: onTap,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(UINumber.borderRadius),
                    color: itemchosen == false
                        ? AppColors.grey
                        : AppColors.primaryColor),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
