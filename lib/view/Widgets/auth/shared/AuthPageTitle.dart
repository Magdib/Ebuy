import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/Colors.dart';

import '../../../../core/theme/theme.dart';
import '../../../../data/dataSource/Static/UINumbers.dart';

class AuthPageTitle extends StatelessWidget {
  const AuthPageTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.deepGrey,
              size: 24,
            )),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}
