import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constant/Colors.dart';

import '../../../../../../core/theme/theme.dart';

class FilterPageHeaders extends StatelessWidget {
  const FilterPageHeaders({
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
              Icons.close,
              color: AppColors.grey,
            )),
        Text(
          title,
          style:
              AppTheme.arabicTheme.textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        const SizedBox(
          width: 40,
        ),
      ],
    );
  }
}
