import 'package:country_flags/country_flags.dart';
import 'package:ebuy/Controller/Home/CartController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/shared/CustomContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiliverCountryButton extends StatelessWidget {
  const DiliverCountryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
      builder: (controller) => CustomContainer(
        child: MaterialButton(
          height: 60,
          minWidth: double.infinity,
          color: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () => Get.toNamed(AppRoutes.selectCountryRoute),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Deliver to:',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 17, width: 20, child: CountryFlags.flag('Us')),
              Text(
                'United States',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 14),
              ),
              const SizedBox(
                width: 60,
              ),
              const Icon(
                Icons.arrow_forward,
                color: AppColors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
