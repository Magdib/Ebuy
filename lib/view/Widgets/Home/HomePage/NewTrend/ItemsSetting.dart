import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsSetting extends GetView<HomePageControllerImp> {
  const ItemsSetting({
    Key? key,
    required this.onTap,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(UINumber.borderRadius),
            border: Border.all(color: AppColors.primaryColor, width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.primaryColor,
            ),
            Text(
              title,
              style:
                  Theme.of(context).textTheme.headline2!.copyWith(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
