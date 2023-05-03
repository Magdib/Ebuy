import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Controller/authControllers/SignUpController.dart';
import '../../../../../core/constant/Colors.dart';

import '../../../../../core/theme/theme.dart';

class MenOrWomensWearCircle extends GetView<SignUpControllerImp> {
  const MenOrWomensWearCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 335,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => controller.chooseWommensWear(),
            child: GetBuilder<SignUpControllerImp>(
              builder: (controller) => CircleAvatar(
                backgroundColor: controller.womensWear == false
                    ? AppColors.grey
                    : AppColors.primaryColor,
                radius: 15,
              ),
            ),
          ),
          Text(
            'Womenswear'.tr,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(
            width: 50,
          ),
          InkWell(
            onTap: () => controller.chooseMensWear(),
            child: GetBuilder<SignUpControllerImp>(
              builder: (controller) => CircleAvatar(
                backgroundColor: controller.mensWear == false
                    ? AppColors.grey
                    : AppColors.primaryColor,
                radius: 15,
              ),
            ),
          ),
          Text(
            'Menswear'.tr,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
