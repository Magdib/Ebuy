import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Controller/authControllers/SignUpController.dart';
import '../ChildrenWidgets/DropDownButtonAuth.dart';
import '../ChildrenWidgets/DropDownButtonAuth.dart';

class DropDownButtonsRow extends StatelessWidget {
  const DropDownButtonsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropDownButtonAuth(
            width: 75,
            hint: 'DD'.tr,
            itemstype: controller.day,
            dateType: controller.birthDay,
            onChanged: (newDate) => controller.changeDay(newDate!),
          ),
          DropDownButtonAuth(
            width: 120,
            hint: 'Month'.tr,
            itemstype: controller.month,
            dateType: controller.birthmonth,
            onChanged: (newDate) => controller.changeMonth(newDate!),
          ),
          DropDownButtonAuth(
            width: 90,
            hint: 'YYYY'.tr,
            itemstype: controller.year,
            dateType: controller.birthYear,
            onChanged: (newDate) => controller.changeYear(newDate!),
          )
        ],
      ),
    );
  }
}
