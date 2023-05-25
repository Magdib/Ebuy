import 'package:flutter/material.dart';

import '../../../core/constant/Colors.dart';

class GreyDivider extends StatelessWidget {
  const GreyDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.brandsGrey,
      indent: 15,
      thickness: 1,
      endIndent: 15,
    );
  }
}
