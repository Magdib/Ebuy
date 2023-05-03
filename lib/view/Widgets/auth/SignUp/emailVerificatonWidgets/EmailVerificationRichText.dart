import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/theme.dart';

class EmailVerificationRichText extends StatelessWidget {
  const EmailVerificationRichText({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String email;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: <TextSpan>[
      TextSpan(
          text: 'We have send your email verify code to\n'.tr,
          style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 16)),
      TextSpan(
        text: '$email \n\n',
        style: Theme.of(context).textTheme.headline2!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
      ),
      TextSpan(
          text: 'please enter it down here: '.tr,
          style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 16)),
    ]));
  }
}
