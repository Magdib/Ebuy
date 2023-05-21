import 'package:ebuy/Controller/authControllers/SignUpController.dart';
import 'package:ebuy/view/Widgets/shared/CustomRadio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenderWearCircle extends GetView<SignUpControllerImp> {
  const GenderWearCircle({
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
          GetBuilder<SignUpControllerImp>(
              builder: (controller) => CustomRadio(
                    condition: controller.womensWear,
                    onTap: () => controller.chooseWommensWear(),
                    radius: 30,
                  )),
          Text(
            'Womenswear'.tr,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(
            width: 50,
          ),
          GetBuilder<SignUpControllerImp>(
              builder: (controller) => CustomRadio(
                    onTap: () => controller.chooseMensWear(),
                    condition: controller.mensWear,
                    radius: 30,
                  )),
          Text(
            'Menswear'.tr,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
