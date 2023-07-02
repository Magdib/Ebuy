import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Controller/authControllers/SignUpController.dart';
import '../../../../../core/constant/Colors.dart';

import '../../../../../data/dataSource/Static/UINumbers.dart';

class DropDownButtonAuth extends GetView<SignUpControllerImp> {
  const DropDownButtonAuth({
    Key? key,
    required this.onChanged,
    required this.dateType,
    required this.itemstype,
    required this.width,
    required this.hint,
  }) : super(key: key);
  final double width;
  final String hint;
  final String? dateType;
  final List<String> itemstype;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: controller.isEnglish == true ? 15 : 0,
          right: controller.isEnglish == true ? 0 : 15),
      height: 44,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey),
          borderRadius: BorderRadius.circular(UINumber.borderRadius)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14),
          hint: Text(
            hint,
            textAlign: TextAlign.end,
            style:
                Theme.of(context).textTheme.headline4!.copyWith(fontSize: 16),
          ),
          menuMaxHeight: 150,
          borderRadius: BorderRadius.circular(UINumber.borderRadius),
          icon: const Icon(
            Icons.keyboard_arrow_down_sharp,
            color: AppColors.primaryColor,
          ),
          items: itemstype
              .map(
                (e) => DropdownMenuItem(value: e, child: Text('$e ')),
              )
              .toList(),
          onChanged: onChanged,
          value: dateType,
        ),
      ),
    );
  }
}
