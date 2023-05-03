import 'package:ebuy/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MostlyIntersetedRichText extends StatelessWidget {
  const MostlyIntersetedRichText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: <TextSpan>[
      TextSpan(
          text: 'Mostly interested in '.tr,
          style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14)),
      TextSpan(
          text: '(Optional):'.tr,
          style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 12))
    ]));
  }
}
