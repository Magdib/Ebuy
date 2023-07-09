import 'package:ebuy/Controller/Home/CheckOutController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditionText extends GetView<CheckOutControllerimp> {
  const TermsAndConditionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: 'By placing your order you agree to our '.tr,
          style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 12)),
      TextSpan(
          text: 'terms and conditions,\nprivacy '.tr,
          recognizer: controller.termsPrivacy,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(fontSize: 12, height: 1.5)),
      TextSpan(
          text: 'and '.tr,
          style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 12)),
      TextSpan(
          text: 'returns policies '.tr,
          recognizer: controller.returnspolicies,
          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 12)),
      TextSpan(
          text:
              'and consent to some of your data being stored by Ebuy which may be used to make future shopping experiences better for you.'
                  .tr,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontSize: 12, height: 1.5))
    ]));
  }
}
