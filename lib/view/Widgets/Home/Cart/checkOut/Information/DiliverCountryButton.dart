import 'package:country_flags/country_flags.dart';
import 'package:ebuy/Controller/Home/CartController.dart';
import 'package:ebuy/Controller/Home/CheckOutController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/shared/CustomContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiliverCountry extends StatelessWidget {
  const DiliverCountry({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutControllerimp>(
      builder: (controller) => CustomContainer(
        height: 60,
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              'Deliver to:',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
                height: 17,
                width: 20,
                child: CountryFlags.flag(controller.countryCode)),
            const SizedBox(
              width: 10,
            ),
            Text(
              controller.currentCountry,
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
