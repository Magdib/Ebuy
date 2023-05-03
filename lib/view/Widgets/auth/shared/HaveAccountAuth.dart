import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/theme.dart';
import '../../../../routes.dart';

class HaveAccountAuth extends StatelessWidget {
  const HaveAccountAuth({
    Key? key,
    required this.authText,
    required this.authType,
    required this.onTap,
  }) : super(key: key);
  final String authText;
  final String authType;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          authText,
          style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            authType,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
